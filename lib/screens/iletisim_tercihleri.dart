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
          build_iletisim_widget(
              "E-posta",
              "Kampanyalarla ilgili e-posta almak istiyorum.",
              isEposta, (value) {
            setState(() {
              isEposta = value;
            });
          }),
          build_iletisim_widget(
              "Bildirim",
              "Kampanyalarla ilgili bildirim almak istiyorum.",
              isBildirim, (value) {
            setState(() {
              isBildirim = value;
            });
          }),
          build_iletisim_widget(
              "SMS", "Kampanyalarla ilgili SMS almak istiyorum.", isSMS,
              (value) {
            setState(() {
              isSMS = value;
            });
          }),
          build_iletisim_widget(
              "Telefon",
              "Kampanyalarla ilgili cep telefonumdan aranmak istiyorum.",
              isAra, (value) {
            setState(() {
              isAra = value;
            });
          }),
        ]),
      ),
    );
  }

  ListTile build_iletisim_widget(
      String title, String content, bool kontrol, Function(bool) onChanged) {
    return ListTile(
      title: Text(title),
      subtitle: Text(content),
      trailing: Switch(
          activeColor: textfieldColor, value: kontrol, onChanged: onChanged),
    );
  }
}
