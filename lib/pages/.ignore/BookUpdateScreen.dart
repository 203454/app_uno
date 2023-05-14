import 'package:flutter/material.dart';

class BookUpdateScreen extends StatefulWidget {

  final Map<String, dynamic> book;

  const BookUpdateScreen({super.key, required this.book});

  @override
  State<BookUpdateScreen> createState() => _BookUpdateScreenState();
}

class _BookUpdateScreenState extends State<BookUpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}