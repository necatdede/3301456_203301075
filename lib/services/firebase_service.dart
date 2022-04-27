import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/kullanici.dart';

class FirebaseService {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<User?> login(String email, String password) async {
    var user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return user.user;
  }

  Future<User?> createUser(
      String email, String password, Kullanici kullanici) async {
    var user = await auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await firestore
        .collection("kullanicilar")
        .doc(user.user!.uid)
        .set(kullanici.toJson());
    return user.user;
  }

  Future<Kullanici> getUser() async {
    var data;
    CollectionReference ref = firestore.collection("kullanicilar");
    String uid = auth.currentUser!.uid;
    var document = ref.doc(uid);
    var response = await document.get();
    data = response.data();

    Kullanici kullanici = Kullanici.fromJson(data);

    return kullanici;
  }

  Future out() async {
    auth.signOut();
  }
}
