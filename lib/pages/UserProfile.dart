import 'package:app_uno/classes/Usuario.dart';
import 'package:app_uno/pages/HomeLogin.dart';
import 'package:app_uno/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserProfile extends StatefulWidget {
  final Usuario usuario;
  const UserProfile({Key? key, required this.usuario}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {


    void completeLogin() {
      Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) =>  HomeLogin(),
        ),
      );
    }

    return Scaffold(
      body: Center(
        child: Container(
          height: 300,
          child: Card(
            child: Column(
              children: [
                Text(
                  widget.usuario.displayName,
                  style: const TextStyle(color: Colors.black),
                ),
                Image.network(widget.usuario.photoUrl),
                Text(
                  widget.usuario.email,
                  style: const TextStyle(color: Colors.black),
                ),
                Text(
                  widget.usuario.displayName,
                  style: const TextStyle(color: Colors.black),
                ),
                ElevatedButton(
                  child: const Text("Cerrar sesión"),
                  onPressed: () async {
                    await _auth.signOut();
                    await googleSignIn.signOut();
                    completeLogin;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
