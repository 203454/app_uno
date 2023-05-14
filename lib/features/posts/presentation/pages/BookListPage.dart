import 'package:app_uno/features/posts/data/models/book_model.dart';
import 'package:app_uno/features/posts/presentation/pages/BookDetailScreen.dart';
import 'package:app_uno/features/posts/presentation/pages/FormAddBook.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/book_bloc.dart';

class BookListPage extends StatefulWidget {
  const BookListPage({Key? key}) : super(key: key);
  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  List<dynamic> books = [];

  @override
  void initState() {
    super.initState();
    context.read<BooksBloc>().add(GetBooks(false));
  }

  void _refreshView() {
    context.read<BooksBloc>().add(GetBooks(false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BooksBloc, BooksState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is Loaded) {
            return SingleChildScrollView(
              child: Column(
                children: state.books.map((book) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookDetailScreen(
                            book: BookModel.fromEntity(book),
                          ),
                        ),
                      );
                    },
                    child: Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 2,
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            height: 150,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://images.unsplash.com/photo-1543002588-bfa74002ed7e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'), // URL de la imagen
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    book.titulo,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Autor: ${book.autor}',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    'Número de páginas: ${book.npaginas}',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: 'Status: ',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                        TextSpan(
                                          text: book.status
                                              ? 'Leido'
                                              : 'Leyendo...',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: book.status
                                                ? Colors.green
                                                : const Color.fromARGB(
                                                    255, 95, 95, 95),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            );
          } else if (state is Error) {
            return Center(
              child: Text(
                state.error,
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          _refreshView;
        },
        icon: const Icon(Icons.refresh),
        color: Colors.blue,
        splashColor: const Color.fromARGB(255, 0, 0, 0),
        highlightColor: Colors.green,
        tooltip: 'Actualizar',
        iconSize: 24, // Tamaño del ícono
        padding: const EdgeInsets.all(8),
        constraints: const BoxConstraints(),
        alignment: Alignment.center,
      ),
    );
  }
}
