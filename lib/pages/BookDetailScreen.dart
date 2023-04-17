import 'package:app_uno/pages/BookUpdateScreen.dart';
import 'package:app_uno/pages/Notifications.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class BookDetailScreen extends StatefulWidget {
  final Map<String, dynamic> book;
  const BookDetailScreen({Key? key, required this.book}) : super(key: key);

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  Dio dio = Dio();
  int _sliderValue = 0;

  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  void _actualizarValor(BuildContext context) async {
    try {
      // Realizar la petición HTTP utilizando Dio
      final response = await dio.put(
        'http://192.168.243.154:8000/api/books/${widget.book['id']}/',
        data: {
          'titulo': widget.book['titulo'],
          'autor': widget.book['autor'],
          'editorial': widget.book['editorial'],
          'nCapitulos': widget.book['nCapitulos'],
          'isbq': widget.book['isbq'],
          'npaginas': widget.book['npaginas'],
          'paginaSave':
              _sliderValue, // Enviar el valor del slider como datos en la petición
        },
      );

      // Verificar si la petición fue exitosa
      if (response.statusCode == 200) {
        // Mostrar un mensaje de éxito
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Valor actualizado')),
        );
      } else {
        // Mostrar un mensaje de error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al actualizar el valor')),
        );
      }
    } catch (error) {
      // Mostrar un mensaje de error en caso de excepción
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $error')),
      );
    }
  }

  void eliminarDato(int id, BuildContext context) async {
    print(id);

    try {
      // Realiza la petición HTTP DELETE
      await dio.delete('http://192.168.243.154:8000/api/books/$id/',
          options: Options(
              sendTimeout: const Duration(milliseconds: 2500),
              receiveTimeout: const Duration(milliseconds: 2500)));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Libro eliminado exitosamente'),
        ),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al eliminar el libro: $e'),
        ),
      );
    }
  }

  void printBook() {
    print(widget.book['id']);
  }

  triggerNotification() {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 10,
            channelKey: 'basic_channel',
            title: 'Tengo que leer...',
            body: '${widget.book['titulo']}!'));
  }

  @override
  Widget build(BuildContext context) {
    // paginaAact =
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            16.0, 24.0, 16.0, 16.0), // Añadir margen superior
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                // transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 209, 165, 110),
                      Color.fromARGB(255, 130, 130, 130),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: [
                      _sliderValue / widget.book['npaginas'],
                      _sliderValue / widget.book['npaginas'],
                    ],
                  ),
                ),
                child: Card(
                  color: Colors.transparent,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 400, // Tamaño deseado de ancho
                          height: 400, // Tamaño deseado de alto
                          child: Image.network(
                            widget.book['portada'],
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          "Libro: ${widget.book['titulo']}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        // Mostrar valor de páginas leídas
                        Text(
                          'Páginas leídas: ${widget.book['paginaSave']} de ${widget.book['npaginas']}',
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 16.0),

                        Slider(
                          value: widget.book['paginaSave'].toDouble(),
                          min: 0,
                          max: widget.book['npaginas'].toDouble(),
                          onChanged: (value) {
                            setState(() {
                              widget.book['paginaSave'] = value.toInt();
                              _sliderValue = widget.book['paginaSave'];
                              if (_sliderValue ==
                                  widget.book['npaginas'].toDouble()) {
                                widget.book['status'] = true;
                              } else {
                                widget.book['status'] = false;
                              }
                            });
                          },
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          "Autor: ${widget.book['autor']}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          "Editorial: '${widget.book['editorial'].toString()}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          "Numero de capitulos: ${widget.book['nCapitulos'].toString()}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        AnimatedDefaultTextStyle(
                          style: TextStyle(
                            fontSize: 16.0,
                            color: widget.book['status']
                                ? Colors.green
                                : Color.fromARGB(255, 137, 132, 131),
                          ),
                          duration: Duration(milliseconds: 300),
                          child: Text(
                            widget.book['status'] ? 'Leido!' : 'Leyendo...',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        SizedBox(height: 4.0),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 8.0),
            
                SizedBox(width: 10.0),
                FloatingActionButton(
                  onPressed: () {
                    _actualizarValor(context);
                  },
                  child: Icon(Icons.save),
                  backgroundColor: Color.fromARGB(255, 143, 143, 143),
                ),
                SizedBox(width: 10.0),
                FloatingActionButton(
                  onPressed: () {
                    eliminarDato(widget.book['id'], context);
                  },
                  child: Icon(Icons.delete),
                  backgroundColor: Color.fromARGB(255, 222, 11, 11),
                ),
                SizedBox(width: 10.0),
                FloatingActionButton(
                  onPressed: () {
                    showNotificacion(1, 'Tengo que leer', '${widget.book['titulo']}!');
                  },
                  child: Icon(Icons.notification_add),
                  backgroundColor: Color.fromARGB(255, 15, 142, 149),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
