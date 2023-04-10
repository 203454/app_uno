import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FormAddBook extends StatefulWidget {
  @override
  _FormAddBookState createState() => _FormAddBookState();
}

class _FormAddBookState extends State<FormAddBook> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();
  final _editorialController = TextEditingController();
  final _numChaptersController = TextEditingController();
  final _numIsbn = TextEditingController();
  final status = false;



  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // Enviar la petición POST a la API utilizando Dio
      final dio = Dio();
      await dio.post(
        'http://192.168.0.14:8000/api/books/',
        data: {
          'titulo': _titleController.text,
          'autor': _authorController.text,
          'editorial': _editorialController.text,
          'nCapitulos': int.parse(_numChaptersController.text),
          'isbq': int.parse(_numIsbn.text),
          'status': false
        },
        options: Options(
          contentType: 'application/json',
        ),
      );

      // Volver a la vista anterior
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Añadir libro'),
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
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                decoration: InputDecoration(
                  hintText: 'Titulo',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 231, 0, 0),
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255),
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color.fromARGB(169, 2, 255, 27),
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _authorController,
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                decoration: InputDecoration(
                  hintText: 'Autor',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 231, 0, 0),
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255),
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color.fromARGB(169, 2, 255, 27),
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),

              TextField(
                controller: _editorialController,
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                decoration: InputDecoration(
                  hintText: 'Editorial',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 231, 0, 0),
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255),
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color.fromARGB(169, 2, 255, 27),
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),

              TextField(
                controller: _numChaptersController,
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
              SizedBox(height: 16.0),

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
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed:
                    (){

                    }, // Llama a la función _pickImage cuando se presione el botón
                child: const Text('Seleccionar imagen',style: TextStyle(
                  color: Colors.black
                ),),

                
              ),
              // TextFormField(
              //   controller: _titleController,
              //   decoration: InputDecoration(
              //     labelText: 'Título',
              //   ),
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return 'Por favor ingrese un título';
              //     }
              //     return null;
              //   },
              // ),
              // TextFormField(
              //   controller: _authorController,
              //   decoration: InputDecoration(
              //     labelText: 'Autor',
              //   ),
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return 'Por favor ingrese un autor';
              //     }
              //     return null;
              //   },
              // ),
              // TextFormField(
              //   controller: _editorialController,
              //   decoration: InputDecoration(
              //     labelText: 'Editorial',
              //   ),
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return 'Por favor ingrese una editorial';
              //     }
              //     return null;
              //   },
              // ),
              // TextFormField(
              //   controller: _numChaptersController,
              //   decoration: InputDecoration(
              //     labelText: 'Número de capítulos',
              //   ),
              //   keyboardType: TextInputType.number,
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return 'Por favor ingrese el número de capítulos';
              //     }
              //     final n = int.tryParse(value);
              //     if (n == null || n <= 0) {
              //       return 'Por favor ingrese un número válido de capítulos';
              //     }
              //     return null;
              //   },
              // ),
              // TextFormField(
              //   controller: _numIsbn,
              //   decoration: InputDecoration(
              //     labelText: 'ISBN',
              //   ),
              //   keyboardType: TextInputType.number,
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return 'Por favor ingrese el ISBN';
              //     }
              //     final n = int.tryParse(value);
              //     if (n == null || n <= 0) {
              //       return 'Por favor ingrese un ISBN';
              //     }
              //     return null;
              //   },
              // ),
              // SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
