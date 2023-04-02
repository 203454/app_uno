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

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 70),
          child: Column(children: <Widget>[
            // Image.asset(
            //   "assets/images/login.png",
            //   width: 300,
            //   height: 300,
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                width: 300,
                height: 40,
                child: ElevatedButton.icon(
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(
                width: 300,
                height: 40,
                child: ElevatedButton.icon(
                  label: const Text(
                    "Continuar con Facsebook",
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                  onPressed: (() {
                    signInWithFacebook(context);
                  }),
                  icon: SvgPicture.asset(
                    "assets/images/facebook.svg",
                    color: Colors.white,
                  ),
                  style: OutlinedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: const Color.fromRGBO(56, 78, 159, 1),
                    textStyle: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28.0),
                    ),
                  ),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 30),
            //   child: SizedBox(
            //     width: 300,
            //     height: 40,
            //     child: ElevatedButton.icon(
            //       label: const Text(
            //         "Registrarse con e-mail",
            //         style: TextStyle(
            //           color: Color.fromRGBO(101, 103, 110, 1),
            //         ),
            //       ),
            //       onPressed: () {
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => const Registration(),
            //           ),
            //         );
            //       },
            //       icon: const Icon(
            //         Icons.mail,
            //         color: Color.fromRGBO(101, 103, 110, 1),
            //       ),
            //       style: OutlinedButton.styleFrom(
            //         elevation: 0,
            //         backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
            //         textStyle: const TextStyle(
            //           fontSize: 16.0,
            //           fontWeight: FontWeight.bold,
            //         ),
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(28.0),
            //         ),
            //         side: const BorderSide(
            //           width: 2.0,
            //           color: Color.fromRGBO(101, 103, 110, 1),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 50, bottom: 10),
            //   child: SizedBox(
            //     height: 20,
            //     child: TextButton(
            //       onPressed: null,
            //       style: TextButton.styleFrom(
            //         padding: EdgeInsets.zero,
            //       ),
            //       child: const Text(
            //         "Entrar como invitado",
            //         style: TextStyle(
            //           color: Color.fromRGBO(231, 56, 99, 1),
            //           fontSize: 16,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: EdgeInsets.only(bottom: 30),
            //   child: SizedBox(
            //     height: 20,
            //     child: TextButton(
            //       onPressed: null,
            //       style: TextButton.styleFrom(
            //         padding: EdgeInsets.zero,
            //       ),
            //       child: const Text(
            //         "Entrar como vendedor",
            //         style: TextStyle(
            //           color: Color.fromRGBO(142, 176, 114, 1),
            //           fontSize: 16,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     Text(
            //       "¿Ysa tienes una cuenta?",
            //       style: TextStyle(
            //         fontSize: 16,
            //       ),
            //     ),
            //     TextButton(
            //       onPressed: null,
            //       style: TextButton.styleFrom(
            //         padding: EdgeInsets.only(left: 4),
            //       ),
            //       child: const Text(
            //         "Iniciar Sesión",
            //         style: TextStyle(
            //           color: Color.fromRGBO(231, 56, 99, 1),
            //           fontSize: 16,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ]),
        ),
      ),
    );
  }
}

// final FirebaseAuth _auth = FirebaseAuth.instance;
// final GoogleSignIn _googleSignIn = GoogleSignIn();

// Future<void> signup(BuildContext context) async {
//   final GoogleSignIn googleSignIn = GoogleSignIn();
//   final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
//   if (googleSignInAccount != null) {
//     final GoogleSignInAuthentication googleSignInAuthentication =
//         await googleSignInAccount.authentication;
//     final AuthCredential authCredential = GoogleAuthProvider.credential(
//         idToken: googleSignInAuthentication.idToken,
//         accessToken: googleSignInAuthentication.accessToken);

//     // Getting users credential
//     UserCredential result = await _auth.signInWithCredential(authCredential);
//     User? user = result.user;

//     if (result != null) {
//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) => Recovery()));
//     } // if result not null we simply call the MaterialpageRoute,
//     // for go to the HomePage screen
//   }
// }

// Future<UserCredential> signInWithGoogle() async {
//   // Trigger the authentication flow
//   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//   // Obtain the auth details from the request
//   final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

//   // Create a new credential
//   final credential = GoogleAuthProvider.credential(
//     accessToken: googleAuth?.accessToken,
//     idToken: googleAuth?.idToken,
//   );

//   // Once signed in, return the UserCredential
//   return await FirebaseAuth.instance.signInWithCredential(credential);
// }

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

    // Once signed in, navigate to the new component
    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                Logout())); // Reemplaza 'NewComponent' con el nombre de tu componente
  } catch (error) {
    // Show error message
    print("Inicio de sesión no exitoso: $error");
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Inicio de sesión no exitoso"),
      duration: Duration(seconds: 3),
    ));
  }
}

Future<UserCredential?> signInWithFacebook(BuildContext context) async {
  try {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    // Once signed in, return the UserCredential

    final UserCredential userCredential = await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);

    // Aquí se envía el userCredential y se redirige a una nueva vista
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => FacebookLogoutButton()),
    );

    return userCredential;
  } catch (e) {
    // Mostrar un mensaje de error
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: $e')),
    );
    return null;
  }
}
