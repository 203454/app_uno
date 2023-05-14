import 'package:flutter/material.dart';

class View03 extends StatelessWidget {
  const View03({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text("data"),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text("data"),
                  ),
                ]),
            Image.asset("assets/images/img.png"),
            wFinal()
          ],
        ),
      ),
    );
  }

  Column wFinal() {
    return Column(
      children: const [
        Text("1. Texto 1 "),
        Text("2. Texto 2 "),
        Text("3. Texto 3 "),
        Text("4. Texto 4 ")
      ],
    );
  }
}
