// import 'package:books_app/pages/News.dart';

import 'dart:async';

import 'package:app_uno/features/posts/presentation/blocs/book_bloc.dart';
import 'package:app_uno/features/posts/presentation/pages/BookListPage.dart';
import 'package:app_uno/features/posts/presentation/pages/.ignore/BookReadingPage.dart';
import 'package:app_uno/features/posts/presentation/pages/FormAddBook.dart';
import 'package:app_uno/services/local_storage.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeAlternative extends StatefulWidget {
  const HomeAlternative({Key? key}) : super(key: key);

  @override
  State<HomeAlternative> createState() => _HomeAlternativeState();
}

class _HomeAlternativeState extends State<HomeAlternative> {
  late int _currentIndex = 0;
  late StreamSubscription<ConnectivityResult> subscription;
  bool internetConnection = false;

  List<Widget> screens = [];
  @override
  void initState() {
    super.initState();
    // Escucha los cambios en la conectividad
    subscription = Connectivity().onConnectivityChanged.listen((result) {
      setState(() {
        if (result == ConnectivityResult.wifi ||
            result == ConnectivityResult.mobile) {
          internetConnection = true;

          //Ejecucion del registro de eventos
          print('Estás conectado a internet');
          List<dynamic> items = BlocProvider.of<BooksBloc>(context).items;
          print('len of array before to execute: $items');

          for (var event in items) {
            print('This is the event $event');
            context.read<BooksBloc>().add(event);
            print('EJECUTANDO...');
          }

          context.read<BooksBloc>().add(ClearArrayEvents());
        } else {
          internetConnection = false;
          print('No estás conectado a ninguna red');
        }
        screens = [
          BookListPage(reading: false, online: internetConnection),
          BookListPage(reading: true, online: internetConnection),
          FormAddBook(online: internetConnection),
        ];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: internetConnection
            ? const Text("Tu librero online",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ))
            : const Text("Tu librero offline",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                )),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 6.0,
      ),
      body: screens.isEmpty
          ? const CircularProgressIndicator()
          : screens[_currentIndex],
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
