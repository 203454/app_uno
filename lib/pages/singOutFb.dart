import 'package:app_uno/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookLogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cerrar sesión"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Cerrar sesión"),
          onPressed: () async {
            
        // await FirebaseAuth.instance.signOut();
        await FacebookAuth.instance.logOut();
        
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            );
          },
        ),
      ),
    );
  }



    // ElevatedButton(
    //   onPressed: () async {
    //     try {

    //       await _auth.signOut();

    //       await FacebookAuth.instance.logOut();
    //       await FirebaseAuth.instance.signOut();
    //       print("CONTEXTO");
    //       print(context);
    //       Navigator.of(context).pushAndRemoveUntil(
    //         MaterialPageRoute(builder: (context) => Login()),
    //         (Route<dynamic> route) => false,
    //       );
    //     } on FirebaseAuthException catch (e) {
    //       // Handle FirebaseAuth exceptions
    //       print('FirebaseAuthException: $e');
    //     } catch (e) {
    //       // Handle other exceptions
    //       print('Error: $e');
    //     }
    //   },
    //   child: Text('Cerrar sesión con Facebook'),
    // );
  
}


//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () async {
//         await _logout();
//         Navigator.pushAndRemoveUntil(
//           context,
//           MaterialPageRoute(builder: (context) => Login()),
//           (route) => false,
//         );
//       },
//       child: Text('Cerrar sesión'),
//     );
//   }
// }
