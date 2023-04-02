import 'package:flutter/material.dart';

class HomePractica extends StatefulWidget {
  const HomePractica({super.key});

  @override
  State<HomePractica> createState() => _HomePracticaState();
}

class _HomePracticaState extends State<HomePractica> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.indigo,
      body:  Center(
        child: Card(
          child: Text("This is my first card in flutter"),
        ),
      ),
    );
  }
}
