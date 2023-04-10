import 'package:app_uno/classes/Usuario.dart';
import 'package:app_uno/pages/HomeAlternative.dart';
import 'package:app_uno/pages/signOut.dart';
import 'package:app_uno/pages/recovery.dart';
import 'package:app_uno/pages/singOutFb.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:app_uno/pages/register.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class HomeLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 98, 99, 195),
              Color.fromARGB(255, 5, 198, 195), // Color superior del gradiente
              Color.fromARGB(255, 76, 93, 105), // Color inferior del gradiente
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Bienvenido',
                style: TextStyle(
                  fontSize: 32, // Tamaño de fuente
                  fontWeight: FontWeight.w600, // Peso de la fuente (negrita)
                  color: Color.fromARGB(255, 255, 255, 255), // Color de fuente
                  // Otros atributos de estilo de fuente opcionales:
                  // fontFamily: 'Nombre de la fuente', // Tipo de fuente
                  fontStyle: FontStyle.italic, // Estilo de fuente (cursiva)
                  letterSpacing: 1.5, // Espaciado entre letras
                  wordSpacing: 2.0, // Espaciado entre palabras
                  // decorationColor: Color.fromARGB(255, 74, 80, 255), // Color de la decoración de texto
                  // decorationThickness: 2.0, // Grosor de la decoración de texto
                  // height: 1.5, // Altura del texto (espaciado entre líneas)
                ),
              ),
              const SizedBox(height: 16),
              Image.asset(
                'assets/images/logo.png', // Ruta de la imagen local
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 64),
              ElevatedButton.icon(
                label: const Text(
                  "Continuar con Google",
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
                onPressed: (() async {
                  signInWithGoogle(context);
                }),
                icon: SvgPicture.asset("assets/images/google.svg",
                    color: Colors.white),
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(63, 104, 236, 1),
                  textStyle: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> signInWithGoogle(BuildContext context) async {
  // Trigger the authentication flow
  try {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    String displayName = googleUser?.displayName ?? '';
    String email = googleUser?.email ?? '';
    String photoUrl = googleUser?.photoUrl ?? '';

    Usuario usuario = Usuario(
      displayName: displayName,
      email: email,
      photoUrl: photoUrl,
      idToken: credential.idToken ?? '',
      accessToken: credential.accessToken ?? '',
    );

    // Once signed in, navigate to the new component
    // final UserCredential userCredential =
    //     await FirebaseAuth.instance.signInWithCredential(credential);

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                HomeAlternative(usuario: usuario) )); // Reemplaza 'NewComponent' con el nombre de tu componente
  } catch (error) {
    // Show error message
    print("Inicio de sesión no exitoso: $error");
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Inicio de sesión no exitoso"),
      duration: Duration(seconds: 3),
    ));
  }
}
