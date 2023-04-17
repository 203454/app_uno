// import 'package:books_app/pages/News.dart';
import 'package:app_uno/classes/Usuario.dart';
import 'package:app_uno/pages/BookListPage.dart';
import 'package:app_uno/pages/ReadingBooks.dart';
import 'package:app_uno/pages/UserProfile.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeAlternative extends StatefulWidget {
  final Usuario usuario;
  const HomeAlternative({Key? key, required this.usuario});
  @override
  State<HomeAlternative> createState() => _HomeAlternativeState();
}

class _HomeAlternativeState extends State<HomeAlternative> {
  late int _currentIndex = 0;
  
  List<Widget> screens = []; // Declara la lista de screens

  @override
  void initState() {

    super.initState();
    // Inicializa la lista   screens con widget.usuario disponible
    screens = [
      BookListPage(usuario: widget.usuario),
      UserProfile(usuario: widget.usuario),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tu librero",
            style: TextStyle(
              color: Colors.white,
              fontSize: 27,
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
        backgroundColor:
            Colors.black, // Cambia el color de fondo de la AppBar a negro
        elevation: 6.0,
      ),
      body: screens[_currentIndex],
      bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          margin: const EdgeInsets.only(bottom: 10, top: 10),
          child: GNav(
              color: Color.fromARGB(255, 255, 255,
                  255), // Cambia el color de los iconos y texto del GNav a gris
              tabBackgroundColor: Colors
                  .white, // Cambia el color de fondo de los tabs del GNav a blanco
              selectedIndex: _currentIndex,
              tabBorderRadius: 10,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              onTabChange: (index) => {setState(() => _currentIndex = index)},
              tabs: const [
                GButton(
                  icon: Icons.amp_stories_rounded,
                  text: 'Librero',
                  iconActiveColor:
                      Color.fromARGB(255, 0, 0, 0), // Cambia el color del ícono activo a negro
                  textColor: Colors.black, // Cambia el color del texto a negro
                  backgroundColor: Colors
                      .grey, // Cambia el color de fondo del tab activo a gris
                ),
                GButton(
                  icon: Icons.account_box_rounded,
                  text: 'Mi Cuenta',
                  iconActiveColor: Colors.black,
                  textColor: Colors.black,
                  backgroundColor: Colors.white,
                ),
              ])),
    );
  }
}
