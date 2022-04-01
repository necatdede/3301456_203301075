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
      backgroundColor: MyApp().bgColor,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/logo.png"), fit: BoxFit.contain)),
          ),
          Image.asset("images/yukleniyor.gif",height: 75,width: 75,),
        ],
      ),
    );
  }
}
