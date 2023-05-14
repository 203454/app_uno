import 'package:app_uno/features/posts/data/models/book_model.dart';
import 'package:app_uno/features/posts/domain/entities/book.dart';
import 'package:app_uno/features/posts/presentation/blocs/book_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../classes/Usuario.dart';

class FormAddBook extends StatefulWidget {
  const FormAddBook({Key? key}) : super(key: key);

  @override
  _FormAddBookState createState() => _FormAddBookState();
}

class _FormAddBookState extends State<FormAddBook> {
  late BooksBloc booksBloc;

  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();
  final _editorialController = TextEditingController();
  final _numcapitulosController = TextEditingController();
  final _numIsbn = TextEditingController();
  final _npaginasController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    booksBloc = BlocProvider.of<BooksBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Añadir libro',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _titleController,
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                decoration: InputDecoration(
                  hintText: 'Titulo',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 231, 0, 0),
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255),
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(169, 2, 255, 27),
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _authorController,
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                decoration: InputDecoration(
                  hintText: 'Autor',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 231, 0, 0),
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255),
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(169, 2, 255, 27),
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _editorialController,
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                decoration: InputDecoration(
                  hintText: 'Editorial',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 231, 0, 0),
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255),
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(169, 2, 255, 27),
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _numcapitulosController,
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                decoration: InputDecoration(
                  hintText: 'Numero de capítulos',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 231, 0, 0),
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255),
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(169, 2, 255, 27),
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _numIsbn,
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                decoration: InputDecoration(
                  hintText: 'ISBN',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 231, 0, 0),
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255),
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(169, 2, 255, 27),
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              TextField(
                controller: _npaginasController,
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                decoration: InputDecoration(
                  hintText: 'Numero de paginas',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 231, 0, 0),
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255),
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(169, 2, 255, 27),
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    final nuevoLibro = Book(
                      titulo: _titleController.text,
                      autor: _authorController.text,
                      editorial: _editorialController.text,
                      ncapitulos: int.parse(_npaginasController.text),
                      isbn: int.parse(_numIsbn.text),
                      status: false,
                      npaginas: int.parse(_npaginasController.text),
                      actual: 0,
                    );
                    BlocProvider.of<BooksBloc>(context)
                        .add(AddBook(nuevoLibro));
                  }
                },
                child: const Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
