// import 'package:books_app/pages/News.dart';

import 'package:app_uno/features/posts/presentation/pages/BookListPage.dart';
import 'package:app_uno/features/posts/presentation/pages/BookReadingPage.dart';
import 'package:app_uno/features/posts/presentation/pages/FormAddBook.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeAlternative extends StatefulWidget {
  const HomeAlternative({Key? key}) : super(key: key);

  @override
  State<HomeAlternative> createState() => _HomeAlternativeState();
}

class _HomeAlternativeState extends State<HomeAlternative> {
  late int _currentIndex = 0;

  List<Widget> screens = []; // Declara la lista de screens

  @override
  void initState() {
    super.initState();

    screens = [
      const BookListPage(),
      const BookReadingPage(),
      const FormAddBook(),
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
        backgroundColor: Colors.black,
        elevation: 6.0,
      ),
      body: screens[_currentIndex],
      backgroundColor: Colors.black,
      bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          margin: const EdgeInsets.only(bottom: 10, top: 10),
          child: GNav(
              color: const Color.fromARGB(255, 255, 255, 255),
              tabBackgroundColor: Colors.white,
              selectedIndex: _currentIndex,
              tabBorderRadius: 10,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              onTabChange: (index) => {setState(() => _currentIndex = index)},
              tabs: const [
                GButton(
                  icon: Icons.menu_book_sharp,
                  text: 'Leyendo',
                  iconActiveColor: Color.fromARGB(255, 0, 0, 0),
                  textColor: Colors.black,
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                ),
                GButton(
                  icon: Icons.menu_book_sharp,
                  text: 'Leidos',
                  iconActiveColor: Color.fromARGB(255, 0, 0, 0),
                  textColor: Colors.black,
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                ),
                GButton(
                  icon: Icons.book_sharp,
                  text: 'Añadir',
                  iconActiveColor: Color.fromARGB(255, 0, 0, 0),
                  textColor: Colors.black,
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                ),
              ])),
    );
  }
}
