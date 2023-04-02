// import 'package:books_app/pages/News.dart';
import 'package:app_uno/pages/BookListPage.dart';
import 'package:app_uno/pages/ReadingBooks.dart';
import 'package:app_uno/pages/UserProfile.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeAlternative extends StatefulWidget {
  const HomeAlternative({super.key});

  @override
  State<HomeAlternative> createState() => _HomeAlternativeState();
}

class _HomeAlternativeState extends State<HomeAlternative> {
  int _currentIndex = 0;

  final screens = [BookListPage(),ReadingBooks(),UserProfile(),];
  final colors = [
    Colors.cyan,
    Colors.purple,
    Colors.green,
    // Colors.red,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Library!"),
          centerTitle: true,
          // backgroundColor: ,
          backgroundColor: colors[_currentIndex],
        ),
        body: screens[_currentIndex],
        bottomNavigationBar: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: const EdgeInsets.only(bottom: 10, top: 10),
            child: GNav(
                // haptic: true,
                // tabBorder: Border.all(color: Colors.grey, width: 1),
                color: colors[_currentIndex],
                tabBackgroundColor: colors[_currentIndex],
                selectedIndex: _currentIndex,
                tabBorderRadius: 10,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                onTabChange: (index) => {setState(() => _currentIndex = index)},
                tabs: [
                  GButton(
                    icon: Icons.amp_stories_rounded,
                    text: 'Librero',
                    iconActiveColor: Colors.white,
                    textColor: Colors.white,
                    // backgroundColor: Colors.red,
                  ),
                  GButton(
                    icon: Icons.book_rounded,
                    text: 'libros leyendo ',
                    iconActiveColor: Colors.white,
                    textColor: Colors.white,
                    // backgroundColor: Colors.red,
                  ),
                  GButton(
                    icon: Icons.account_box_rounded,
                    text: 'Mi cuenta',
                    iconActiveColor: Colors.white,
                    textColor: Colors.white,
                    // backgroundColor: Colors.red,
                  ),
                ]
                )
              ),
             
            );
  }
}
