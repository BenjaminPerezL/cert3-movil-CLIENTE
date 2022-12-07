import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:proyecto_movil/pages/admin_page.dart';
import 'package:proyecto_movil/pages/cliente_page.dart';
import 'package:proyecto_movil/pages/home.dart';
import 'package:proyecto_movil/pages/login.dart';

class AuthService {
  //chequea credenciales de user, si esta logeado o no
  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            if (FirebaseAuth.instance.currentUser!.email! ==
                'admin@gmail.com') {
              return Admin_Home();
            } else {
              return Cliente_Home();
            }
          } else {
            return const Login();
          }
        });
  }

//login de google
  signInWithGoogle() async {
    // iniciar la autenticacion
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    //obtiene los detalles auth desde el request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // crear nueva credencial
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // una vez iniciado, retorna credenciales
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  //deslogearse

  signOut() async {
    await GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
  }
}
