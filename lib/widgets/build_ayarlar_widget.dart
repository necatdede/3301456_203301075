import 'package:flutter/material.dart';

import '../main.dart';

class BuildAyarlarWidget extends StatelessWidget {
  const BuildAyarlarWidget({
    required this.yazi,
    required this.icon,
    required this.islem,
    required this.yazi2,
    Key? key,
  }) : super(key: key);

  final String yazi;
  final IconData icon;
  final Function() islem;
  final String yazi2;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8,top: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: MyApp().textfieldColor,
            width: 1,
          ),
        ),
      ),
      child: ListTile(
        onTap: islem,
        title: Text(yazi,
            style: TextStyle(
              color: Colors.grey.shade800,
              fontSize: 25,
            )),
        iconColor: Colors.grey.shade600,
        leading: Icon(
          icon,
          size: 35,
        ),
        trailing: Text(yazi2,style: TextStyle(
          fontSize: 20,
          color: Colors.grey.shade600

        ),),
      ),
    );
  }
}
