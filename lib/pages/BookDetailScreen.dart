import 'package:app_uno/pages/BookUpdateScreen.dart';
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

  void eliminarDato(int id, BuildContext context) async {
    print(id);

    try {
      // Realiza la petición HTTP DELETE
      await dio.delete('http://192.168.0.14:8000/api/books/$id/',
          options: Options(
              sendTimeout: const Duration(milliseconds: 2500),
              receiveTimeout:const Duration(milliseconds: 2500)));
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 1,
        crossAxisSpacing: 1,
        children: [
          Container(
            margin: EdgeInsets.all(8),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.book['titulo'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      widget.book['autor'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      widget.book['editorial'].toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      widget.book['nCapitulos'].toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      widget.book['status'] ? 'Disponible' : 'No Disponible',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      widget.book['created_at'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              // Acción para eliminar
              eliminarDato(widget.book['id'], context);
            },
            child: Icon(Icons.delete),
            backgroundColor: Colors.red,
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BookUpdateScreen(book: widget.book)),
              );
            },
            child: Icon(Icons.edit),
            backgroundColor: Colors.blue,
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
