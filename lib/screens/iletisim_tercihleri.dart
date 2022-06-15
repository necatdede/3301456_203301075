import 'package:diyetlendin/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IletisimTercihleri extends StatefulWidget {
  const IletisimTercihleri({Key? key}) : super(key: key);

  @override
  State<IletisimTercihleri> createState() => _IletisimTercihleriState();
}

class _IletisimTercihleriState extends State<IletisimTercihleri> {
  bool isEposta = true;
  bool isBildirim = true;
  bool isSMS = false;
  bool isAra = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("İletişim Tercihleri")),
      body: SizedBox(
        height: Get.height,
        child: Column(children: [
          buildIletisimWidget(
              "E-posta",
              "Bilgilendirilmek için e-posta almak istiyorum.",
              isEposta, (value) {
            setState(() {
              isEposta = value;
            });
          }),
          buildIletisimWidget(
              "Bildirim",
              "Bilgilendirilmek için bildirim almak istiyorum.",
              isBildirim, (value) {
            setState(() {
              isBildirim = value;
            });
          }),
          buildIletisimWidget(
              "SMS", "Bilgilendirilmek için SMS almak istiyorum.", isSMS,
              (value) {
            setState(() {
              isSMS = value;
            });
          }),
          buildIletisimWidget(
              "Telefon",
              "Bilgilendirilmek için cep telefonumdan aranmak istiyorum.",
              isAra, (value) {
            setState(() {
              isAra = value;
            });
          }),
        ]),
      ),
    );
  }

  ListTile buildIletisimWidget(
      String title, String content, bool kontrol, Function(bool) onChanged) {
    return ListTile(
      title: Text(title),
      subtitle: Text(content),
      trailing: Switch(
          activeColor: textfieldColor, value: kontrol, onChanged: onChanged),
    );
  }
}
