import 'package:app_uno/features/posts/data/models/book_model.dart';
import 'package:app_uno/features/posts/domain/entities/book.dart';
import 'package:app_uno/features/posts/presentation/blocs/book_bloc.dart';
// import 'package:app_uno/pages/BookUpdateScreen.dart';
// import 'package:app_uno/pages/Notifications.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailScreen extends StatefulWidget {
  final BookModel book;

  const BookDetailScreen({Key? key, required this.book}) : super(key: key);

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  late BooksBloc booksBloc;

  double sliderValue = 0.0;
  bool statusValue = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    booksBloc = BlocProvider.of<BooksBloc>(context);
    sliderValue = widget.book.actual.toDouble();
    statusValue = widget.book.status;
  }
  // @override
  // void initState() {
  //   AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
  //     if (!isAllowed) {
  //       AwesomeNotifications().requestPermissionToSendNotifications();
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // paginaAact =
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            16.0, 24.0, 16.0, 16.0), // Añadir margen superior
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                // transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: const [
                      Color.fromARGB(255, 56, 212, 4),
                      Color.fromARGB(255, 54, 54, 54),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: [
                      sliderValue / widget.book.npaginas,
                      sliderValue / widget.book.npaginas,
                    ],
                  ),
                ),
                child: Card(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 400,
                          height: 400,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://images.unsplash.com/photo-1543002588-bfa74002ed7e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'), // URL de la imagen
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          "Libro: ${widget.book.titulo}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        // Mostrar valor de páginas leídas
                        Text(
                          'Páginas leídas: ${sliderValue.toInt()} de ${widget.book.npaginas}',
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Slider(
                          value: sliderValue,
                          min: 0,
                          max: widget.book.npaginas.toDouble(),
                          onChanged: (value) {
                            setState(() {
                              sliderValue = value;
                              if (sliderValue ==
                                  widget.book.npaginas.toDouble()) {
                                statusValue = true;
                              } else {
                                statusValue = false;
                              }
                            });
                          },
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          "Autor: ${widget.book.autor}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          "Editorial: '${widget.book.editorial.toString()}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          "Numero de capitulos: ${widget.book.ncapitulos.toString()}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        AnimatedDefaultTextStyle(
                          style: TextStyle(
                            fontSize: 16.0,
                            color: widget.book.status
                                ? Colors.green
                                : Color.fromARGB(255, 0, 0, 0),
                          ),
                          duration: const Duration(milliseconds: 300),
                          child: Text(
                            statusValue ? 'Leido!' : 'Leyendo...',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        const SizedBox(height: 4.0),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Book updatedBook = widget.book
                    .copyWith(actual: sliderValue.toInt(), status: statusValue);
                context.read<BooksBloc>().add(SliderValueChanged(updatedBook));
              },
              child: const Text('Guardar'),
            ),
            const SizedBox(width: 10.0),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Eliminar Libro'),
                      content: const Text(
                          '¿Estás seguro de que quieres eliminar este libro?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancelar'),
                        ),
                        TextButton(
                          onPressed: () {
                            booksBloc.add(DeleteBooks(widget.book.id!));
                            Navigator.of(context).pop();
                          },
                          child: const Text('Eliminar'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Eliminar'),
            ),
          ],
        ),
      ),
    );
  }
}
