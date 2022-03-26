import 'package:diyetlendin/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class buildTextFieldWidget extends StatelessWidget {
  buildTextFieldWidget({
    Key? key,
     required this.control,
    required this.str,
    required this.icon,
    this.isEnable = true,
    this.kontrol = false,
    this.klavyetur = TextInputType.text,
  }) : super(key: key);

  TextEditingController control;
  final String str;
  final IconData icon;
  final bool kontrol;
  final TextInputType klavyetur;
  final bool isEnable;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
        width: MediaQuery.of(context).size.width * 0.8,
        // height: MediaQuery.of(context).size.height / 15,
        //padding: const EdgeInsets.all(8),
        child: TextField(
          enabled: isEnable,
          keyboardType: klavyetur,
          obscureText: kontrol,
          controller: control,
          autocorrect: true,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyApp().textfieldColor, width: 3),
              borderRadius: BorderRadius.circular(25),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyApp().bgColor, width: 3),
              borderRadius: BorderRadius.circular(25),
            ),
            prefixIcon: Icon(
              icon,
              size: 25,
              //color: MyApp().textfieldColor,
            ),
            hintText: str,
          ),
        ));
  }
}
