// import 'package:books_app/pages/News.dart';
import 'package:app_uno/classes/Usuario.dart';
import 'package:app_uno/pages/BookListPage.dart';
import 'package:app_uno/pages/ReadingBooks.dart';
import 'package:app_uno/pages/UserProfile.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeAlternative extends StatefulWidget {

final Usuario usuario;
const HomeAlternative({Key? key, required this.usuario });
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
      BookListPage(),
      ReadingBooks(),
      UserProfile(usuario: widget.usuario),
    ];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tu librero", style: TextStyle(
          color: Colors.white,
          fontSize: 27,
          fontWeight: FontWeight.bold, 
          )),
        centerTitle: true,
        backgroundColor:Color.fromARGB(255, 47, 20, 74),
        elevation: 6.0,
      ),
      body: screens[_currentIndex],
      bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          margin: const EdgeInsets.only(bottom: 10, top: 10),
          child: GNav(
              // haptic: true,
              // tabBorder: Border.all(color: Colors.grey, width: 1),
              color:const Color.fromARGB(255, 255, 255, 255),
              tabBackgroundColor:const Color.fromARGB(255, 255, 255, 255),
              selectedIndex: _currentIndex,
              tabBorderRadius: 10,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              onTabChange: (index) => {setState(() => _currentIndex = index)},
              tabs: const [
                GButton(
                  icon: Icons.amp_stories_rounded,
                  text: 'Librero',
                  iconActiveColor: Color.fromARGB(255, 0, 0, 0),
                  textColor: Color.fromARGB(255, 0, 0, 0),
                  backgroundColor: Color.fromARGB(255, 55, 82, 145),
                ),
                GButton(
                  icon: Icons.book_rounded,
                  text: 'libros leyendo ',
                  iconActiveColor: Color.fromARGB(255, 0, 0, 0),
                  textColor: Color.fromARGB(255, 0, 0, 0),
                  // backgroundColor: Colors.red,
                ),
                GButton(
                  icon: Icons.account_box_rounded,
                  text: 'Mi cuenta',
                  iconActiveColor: Color.fromARGB(255, 0, 0, 0),
                  textColor: Color.fromARGB(255, 0, 0, 0),
                ),
              ])),
    );
  }
}
