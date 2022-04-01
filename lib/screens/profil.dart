import 'package:diyetlendin/main.dart';
import 'package:diyetlendin/widgets/build_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../globals.dart' as globals;

class Profil extends StatelessWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    final bos = TextEditingController();
    return Scaffold(
      backgroundColor: MyApp().bgColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(globals.kullanici.resimUrl)),
                    )),
                buildTextFieldWidget(
                  control: bos,
                  str: globals.kullanici.ad,
                  icon: LineIcons.addressCard,
                  isEnable: false,
                ),
                buildTextFieldWidget(
                  control: bos,
                  str: globals.kullanici.kullaniciAdi,
                  icon: LineIcons.user,
                  isEnable: false,
                ),
                buildTextFieldWidget(
                  control: bos,
                  str: globals.kullanici.yas.toString(),
                  icon: LineIcons.birthdayCake,
                  isEnable: false,
                ),
                buildTextFieldWidget(
                  control: bos,
                  str: globals.kullanici.boy.toString(),
                  icon: LineIcons.ruler,
                  isEnable: false,
                ),
                buildTextFieldWidget(
                  control: bos,
                  str: globals.kullanici.kilo.toString(),
                  icon: LineIcons.weight,
                  isEnable: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
