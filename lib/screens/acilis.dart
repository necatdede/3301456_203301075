import 'package:diyetlendin/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Acilis extends StatefulWidget {
  const Acilis({Key? key}) : super(key: key);

  @override
  State<Acilis> createState() => _AcilisState();
}

class _AcilisState extends State<Acilis> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      (FirebaseAuth.instance.currentUser == null)
          ? Navigator.popAndPushNamed(context, "/routeGirisYap")
          : Navigator.popAndPushNamed(context, "/routeCerceve");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const MyApp().bgColor,
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/logo.png"),
                        fit: BoxFit.contain)),
              ),
            ),
            Expanded(
              flex: 1,
              child: Image.asset(
                "images/yukleniyor.gif",
                height: 75,
                width: 75,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
