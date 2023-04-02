import 'package:app_uno/pages/BookDetailScreen.dart';
import 'package:app_uno/pages/FormAddBook.dart';
import 'package:app_uno/pages/login.dart';
import 'package:app_uno/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class BookListPage extends StatefulWidget {
  @override
  _BookListPageState createState() => _BookListPageState();
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
      Response response = await Dio().get('http://192.168.0.14:8000/api/books/',
          options: Options(sendTimeout: duracion, receiveTimeout: duracion));
      setState(() {
        books = response.data;
        print(books);
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.count(
          crossAxisCount: 1,
          children: List.generate(books.length, (index) {
            return GestureDetector(
              onTap: () {
                // navigateBookDetail(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookDetailScreen(book: books[index]),
                  ),
                );
              },
              child: Card(
                margin: EdgeInsets.all(8),
                color: Colors.grey[900],
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        books[index]['titulo'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        books[index]['autor'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        books[index]['nCapitulos'].toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        books[index]['status'] ? 'Disponible' : 'No Disponible',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: books[index]['status']
                              ? Colors.greenAccent
                              : Colors.redAccent,
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        books[index]['created_at'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
        floatingActionButton:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          FloatingActionButton(
            backgroundColor: Color.fromARGB(255, 185, 255, 253),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FormAddBook()),
              );
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 16.0),
          FloatingActionButton(
            backgroundColor: Color.fromARGB(255, 185, 255, 253),
            onPressed: () {
              getData();
            },
            child: Icon(Icons.refresh),
          )
        ])

        // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        );
  }
}
