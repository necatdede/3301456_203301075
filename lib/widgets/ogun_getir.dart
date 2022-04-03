import 'package:flutter/material.dart';

class OgunGetir extends StatelessWidget {
  const OgunGetir({
    Key? key,
    required this.tur,
    required this.renk,
    required this.renk2,
    required this.yazi,
    required this.ontab,
  }) : super(key: key);

  final String tur;
  final Color renk;
  final Color renk2;
  final String yazi;
  final Function() ontab;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 3.0),
      child: InkWell(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(60),
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20)),
        onTap: ontab,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            width: 130,
            height: 160,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: renk.withOpacity(1),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  renk,
                  renk2,
                ],
              ),
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(60),
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    tur,
                    width: 100,
                    height: 100,
                  ),
                  Text(
                    yazi,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "0 kcal",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
