import 'package:app_uno/pages/BookDetailScreen.dart';
import 'package:app_uno/pages/FormAddBook.dart';
import 'package:app_uno/pages/login.dart';
import 'package:app_uno/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:app_uno/classes/Usuario.dart';

class BookListPage extends StatefulWidget {
  final Usuario usuario;

  const BookListPage({Key? key, required this.usuario}) : super(key: key);
  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  List<dynamic> books = [];

  @override
  void initState() {
    super.initState();

    getData();
  }

  Duration duracion = const Duration(milliseconds: 2500);
  Duration duracion2 = const Duration(milliseconds: 2500);
  Future<void> getData() async {
    try {
      Response response = await Dio().get('http://192.168.243.154:8000/api/books/',
          options: Options(sendTimeout: duracion, receiveTimeout: duracion));
      setState(() {
        books = response.data;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GridView.count(
        crossAxisCount: 1,
        childAspectRatio: 2,
        children: List.generate(books.length, (index) {
          return SizedBox(
            height: 100.0,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookDetailScreen(book: books[index]),
                  ),
                );
              },
              child: Card(
                elevation: 10,
                margin: const EdgeInsets.all(8),
                color: Colors.blueGrey[
                    900], // Cambia el color de fondo a un tono de gris azulado
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 90.0,
                        height: 160.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(books[index]['portada']),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20.0),
                            Text(
                              'Titulo: ${books[index]['titulo']}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            Text(
                              'Autor: ${books[index]['autor']}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            Text(
                              'Paginas: ${books[index]['npaginas'].toString()}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            Text(
                              books[index]['status']
                                  ? 'Lo has leido!'
                                  : 'Leyendo...',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: books[index]['status']
                                    ? Colors.greenAccent
                                    : Color.fromARGB(255, 85, 85, 85),
                                fontSize: 14.0,
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            Text(
                              'Creado el: ${books[index]['created_at']}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.purple,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FormAddBook(usuario: widget.usuario)),
              );
            },
            child: Icon(Icons.add),
          ),
          const SizedBox(height: 16.0),
          FloatingActionButton(
            backgroundColor: Colors.purple,
            onPressed: () {
              getData();
            },
            child: Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
