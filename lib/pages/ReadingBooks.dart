import 'package:flutter/material.dart';

class ReadingBooks extends StatefulWidget {
  const ReadingBooks({super.key});

  @override
  State<ReadingBooks> createState() => _ReadingBooksState();
}

class _ReadingBooksState extends State<ReadingBooks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        "HOLA ESTos son libros que estas leyendo"  
        ),
    );
  }
}
