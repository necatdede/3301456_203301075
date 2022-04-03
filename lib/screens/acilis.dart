import 'package:diyetlendin/main.dart';
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
      Navigator.popAndPushNamed(context, "/routeGirisYap");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const MyApp().bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/logo.png"),
                      fit: BoxFit.contain)),
            ),
            Image.asset(
              "images/yukleniyor.gif",
              height: 75,
              width: 75,
            ),
          ],
        ),
      ),
    );
  }
}
