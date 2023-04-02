import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:app_uno/pages/recovery.dart';

class Registration extends StatelessWidget {
  const Registration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Regístrate',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        backgroundColor: Color.fromRGBO(71, 25, 124, 1),
        leading: const BackButton(
          color: Color.fromRGBO(228, 54, 99, 1),
        ),
        leadingWidth: 60,
        titleSpacing: -10,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: SizedBox(
              width: 75,
              child: Image.asset(
                'assets/images/OutsideLogin.png',
              ),
            ),
          ),
        ],
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 30, bottom: 48),
            child: Text(
              "Crea una cuenta para empezar a usar la app",
              style: TextStyle(
                  color: Color.fromRGBO(117, 117, 117, 1),
                  fontSize: 17,
                  fontWeight: FontWeight.w900),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 22.0, right: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                labelUp("Nombre"),
                genericField("Nombre completo", 35),
                labelUp("Correo electrónico"),
                genericField("Dirección de correo electrónico", 35),
                labelUp("Contraseña"),
                passField("Contraseña", 5),
                const Padding(
                  padding: EdgeInsets.only(right: 5.0, left: 15),
                  child: Text(
                    "La contraseña debe de contener caracteres, números y símbolos con un máximo de 6 carácteres",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(192, 192, 192, 1),
                      height: 1.5,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: Radio(
                              value: "radio value",
                              groupValue: "group value",
                              onChanged: (value) {
                                print(value); //selected value
                              }),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 6.0),
                        child: Text(
                          "Al registrarme, acepto los",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 6.0),
                        child: SizedBox(
                          height: 25,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: null,
                            child: const Text(
                              "terminos y condiciones",
                              style: TextStyle(
                                color: Color.fromRGBO(142, 176, 114, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Text("y")
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Row(
                    children: <Widget>[
                      const Text("la"),
                      SizedBox(
                        height: 20,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.only(left: 6),
                          ),
                          onPressed: null,
                          child: const Text(
                            "política de privacidad",
                            style: TextStyle(
                              color: Color.fromRGBO(142, 176, 114, 1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: SizedBox(
              width: 360,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Recovery(),
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: const Color.fromRGBO(128, 166, 96, 1),
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.0),
                  ),
                ),
                child: const Text(
                  "Crear Cuenta",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "¿Ya tienes una cuenta?",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              TextButton(
                onPressed: null,
                style: TextButton.styleFrom(
                  padding: EdgeInsets.only(left: 4),
                ),
                child: const Text(
                  "Iniciar Sesión",
                  style: TextStyle(
                    color: Color.fromRGBO(231, 56, 99, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }

  labelUp(label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        label,
        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 17),
      ),
    );
  }

  genericField(hint, double bottomb) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomb),
      child: TextField(
        decoration: InputDecoration(
          //suffixIcon: Icon(Icons.visibility_off),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(192, 192, 192, 1),
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(192, 192, 192, 1),
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          hintText: hint,
          hintStyle: TextStyle(
            color: Color.fromRGBO(192, 192, 192, 1),
            fontSize: 17,
          ),
          labelStyle: const TextStyle(
            fontSize: 20,
            color: Color.fromRGBO(192, 192, 192, 1),
          ),
        ),
      ),
    );
  }

  passField(hint, double bottomb) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomb),
      child: TextField(
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.visibility_off),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(192, 192, 192, 1),
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(192, 192, 192, 1),
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          hintText: hint,
          hintStyle: TextStyle(
            color: Color.fromRGBO(192, 192, 192, 1),
            fontSize: 17,
          ),
          labelStyle: const TextStyle(
            fontSize: 25,
            color: Color.fromRGBO(192, 192, 192, 1),
          ),
        ),
      ),
    );
  }
}
