import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:havadurumu/menu.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool giris = true;
  String? id;
  // ignore: non_constant_identifier_names
  SignIn(String mevcutEposta, String mevcutSifre) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: mevcutEposta, password: mevcutSifre);
      id = userCredential.user!.uid;
      if (id == "") {
        giris = false;
      } else {
        giris = true;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        giris = false;
        print('Bu e-posta için kullanıcı bulunamadı.');
      } else if (e.code == 'wrong-password') {
        giris = false;
        print('Bu kullanıcı yanlış şifre kullandı.');
      }
    }
  }

  // ignore: prefer_typing_uninitialized_variables
  var user;
  bool kayit = true;
  // ignore: non_constant_identifier_names
  CreatePerson(String name, String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      kayit = false;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        kayit = false;
        print('Sağlanan şifre çok zayıf.');
      } else if (e.code == 'email-already-in-use') {
        kayit = false;
        print('Bu e-posta için hesap zaten var.');
      }
    }
  }
}
