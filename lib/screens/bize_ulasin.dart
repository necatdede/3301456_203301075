import 'package:diyetlendin/widgets/build_button_widget.dart';
import 'package:diyetlendin/widgets/build_dialog_snackbar.dart';
import 'package:diyetlendin/widgets/build_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BizeUlasin extends StatelessWidget {
  BizeUlasin({Key? key}) : super(key: key);

  final konu = TextEditingController();
  final detay = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bize Ulaşın")),
      body: SizedBox(
        height: Get.height,
        child: Column(
          children: [
            BuildTextFieldWidget(
                control: konu,
                str: "Konu",
                icon: Icons.messenger_outline,
                kontrol: false,
                klavyetur: TextInputType.text),
            BuildTextFieldWidget(
                control: detay,
                str: "Detay",
                icon: Icons.message_outlined,
                kontrol: false,
                klavyetur: TextInputType.text),
            BuildButtonWidget(
                str: "Gönder",
                islem: () {
                  buildSnackBar(
                      "Başarılı", "Mesajınız Gönderildi", SnackPosition.BOTTOM);
                },
                context: context),
          ],
        ),
      ),
    );
  }

  /*

buildDialog("Bize Ulaşın", () {
                    Get.back(closeOverlays: true);
                    buildSnackBar(
                        "Bilgi", "Mesajınız Gönderildi!", SnackPosition.BOTTOM);
                  },
                      Column(
                        children: [
                          BuildTextFieldWidget(
                              control: konu,
                              str: "Konu",
                              icon: Icons.messenger_outline,
                              kontrol: false,
                              klavyetur: TextInputType.text),
                          BuildTextFieldWidget(
                              control: detay,
                              str: "Detay",
                              icon: Icons.message_outlined,
                              kontrol: false,
                              klavyetur: TextInputType.text),
                        ],
                      ));



  */
}
