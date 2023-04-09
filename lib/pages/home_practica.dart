import 'package:flutter/material.dart';

class HomePractica extends StatefulWidget {
  const HomePractica({super.key});

  @override
  State<HomePractica> createState() => _HomePracticaState();
}

class _HomePracticaState extends State<HomePractica> {
  int counter = 10;

  void increase() {
    counter++;
    setState(() {});
  }

  void decrease() {
    counter--;
    setState(() {});
  }

  void reset() {
    counter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const fontSize30 = TextStyle(fontSize: 56);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 255, 226),
        title: const Text("Home Practica"),
        elevation: 8.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            print(Key);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              margin: const EdgeInsets.all(10.0),
              color: const Color.fromARGB(255, 255, 0, 0),
              // shadowColor: const Colo  r.fromARGB(255, 0, 38, 255),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  '$counter',
                  style: fontSize30,
                ),
              ),

              // child: ListTile(
              //   leading: Icon(Icons.album),
              //   // isThreeLine: true,
              //   title: Text("The Enchanted NightSiingale"),
              //   subtitle: Text("Music by Julie Gable. Lyrics by Sidney Stein."),
              // ),
            ),

            // Card(
            //   child: Column(
            //     mainAxisSize: MainAxisSize.min,
            //     children: <Widget>[
            //       const ListTile(
            //         leading: Icon(Icons.album),
            //         title: Text('Heart Shaker'),
            //         subtitle: Text('TWICE'),
            //       ),
            //       Image.asset('assets/images/twice.jpg'),
            //       ButtonBar(
            //         children: <Widget>[
            //           TextButton(
            //             child: const Text('BUY TICKETS'),
            //             onPressed: () {/* ... */},
            //           ),
            //           TextButton(
            //             child: const Text('LISTEN'),
            //             onPressed: () {/* ... */},
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),

            Card(
              elevation: 10, // para darle profundidad
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(15.0), // para redondear los bordes
              ),
              child: Container(
                padding: EdgeInsets.all(10), // para agregar espacio interno
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Título',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Icon(Icons.favorite, color: Colors.red),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Image.network('https://example.com/image.jpg',
                        width: double.infinity, height: 200, fit: BoxFit.cover),
                    const SizedBox(height: 10),
                    const Text('Descripción',
                        style: TextStyle(color: Colors.grey)),
                    const SizedBox(height: 10),
                    const Row(
                      children: [
                        Icon(Icons.calendar_today),
                        SizedBox(width: 5),
                        Text('Fecha', style: TextStyle(color: Colors.grey)),
                        SizedBox(width: 20),
                        Icon(Icons.location_on),
                        SizedBox(width: 5),
                        Text('Ubicación', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('PROYECTO X',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 56,
                                color: Colors.black)),
                        Icon(Icons.star, color: Colors.blueAccent),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.blue, Colors.purple],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.8),
                            blurRadius: 10,
                            spreadRadius: 3,
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 10,
                            left: 20,
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 100,
                            right: 20,
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 50,
                            left: 20,
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.purpleAccent,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 100,
                            right: 20,
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text('Descripción del proyecto',
                        style: TextStyle(color: Colors.black.withOpacity(0.8))),
                    const SizedBox(height: 20),
                    const Row(
                      children: [
                        Icon(Icons.calendar_today, color: Colors.black),
                        SizedBox(width: 10),
                        Text('Fecha de lanzamiento: 30/10/2050',
                            style: TextStyle(color: Colors.black)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      children: [
                        Icon(Icons.group, color: Colors.black),
                        SizedBox(width: 10),
                        Text('Equipo de desarrollo: 10 personas',
                            style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  ],
                ),
              ),
            )

            // const Card(child: Text("hola 222222222ss2222222")),
            // const Card(child: Text("hola 3")),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFloattingActions(
        increaseFunction: increase,
        decreaseFunction: decrease,
        resetFunction: reset,
      ),
    );
  }
}

class CustomFloattingActions extends StatelessWidget {
  final Function increaseFunction, decreaseFunction, resetFunction;

  const CustomFloattingActions({
    super.key,
    required this.increaseFunction,
    required this.decreaseFunction,
    required this.resetFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 3, 255, 226),
          onPressed: () => increaseFunction(),
          child: const Icon(Icons.exposure_plus_1),
        ),
        FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 3, 255, 226),
          onPressed: () => resetFunction(),
          child: const Icon(Icons.exposure_zero),
        ),
        FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 3, 255, 226),
          onPressed: () => decreaseFunction(),
          child: const Icon(Icons.exposure_minus_1),
        ),
      ],
    );
  }
}


