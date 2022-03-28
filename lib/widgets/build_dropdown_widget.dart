import 'package:flutter/material.dart';

import '../main.dart';

import '../globals.dart' as globals;

class BuildDropDownWidget extends StatefulWidget {
  const BuildDropDownWidget({
    Key? key,
    required this.secilen,
    required this.veri,
    required this.islem,
  }) : super(key: key);

  final String secilen;
  final List<String> veri;
  final Function(String?)? islem;

  @override
  State<BuildDropDownWidget> createState() => _BuildDropDownWidgetState();
}

class _BuildDropDownWidgetState extends State<BuildDropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8) ,
      decoration: BoxDecoration(
        border: Border.all(
          color: MyApp().bgColor,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: DropdownButton<String>(
          alignment: Alignment.center,
          //itemHeight: 10,
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
          onChanged: widget.islem,
          value: widget.secilen,
          items: widget.veri.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
