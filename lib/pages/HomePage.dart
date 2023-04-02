// import 'package:books_app/pages/News.dart';
// import 'package:books_app/pages/conexion.dart';
// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _selectedIndex = 0;

//   //Aqui se muestran los widgets que queremos pintar dependiendo del item del navbar seleccionado
//   static const List<Widget> _widgetOptions = <Widget>[
//     Text(
//       'Aqui te vas alvv',
//       style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
//     ),
//     MyDioWidget(),
//     NewsWidget()
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.purple[900], 
//       appBar: AppBar(
//         backgroundColor: Colors.red[400],
//         automaticallyImplyLeading: false, //quita el botón de regreso
//         title: const Text('Bienbenido <Ciro>'),
//       ),
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex)
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.book),
//             label: 'Librero',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.bookmark),
//             label: 'Leyendo',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.newspaper),
//             label: 'Noticias',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Color.fromARGB(255, 242, 0, 255),
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
