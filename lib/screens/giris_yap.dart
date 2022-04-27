import 'package:diyetlendin/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icons.dart';

import '../main.dart';
import '../widgets/build_button_widget.dart';
import '../widgets/build_textfield_widget.dart';

class GirisYap extends StatefulWidget {
  const GirisYap({Key? key}) : super(key: key);

  @override
  _GirisYapState createState() => _GirisYapState();
}

class _GirisYapState extends State<GirisYap> {
  FirebaseService service = FirebaseService();
  var alert = AlertDialog(
    title: Column(
      children: const [
        Icon(
          Icons.error_outline,
          color: Colors.red,
          size: 75,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Kullanıcı Adı, Şifre Yanlış",
          style: TextStyle(fontSize: 25),
        ),
      ],
    ),
  );

  final kullaniciAdi = TextEditingController();
  final sifre = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const MyApp().bgColor,
      body: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: SizedBox(
            width: screenSize.width,
            height: screenSize.height,
            child: Column(
              children: [
                Image.asset(
                  "images/logo.png",
                  width: 350.w,
                  height: 350.h,
                ),
                SizedBox(
                  width: 300.w,
                  height: 340.h,
                  child: Card(
                    elevation: 20,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(50)),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(8.0.r),
                      child: Column(
                        children: [
                          BuildTextFieldWidget(
                            control: kullaniciAdi,
                            str: "E-mail",
                            icon: LineIcons.user,
                            klavyetur: TextInputType.name,
                          ),
                          BuildTextFieldWidget(
                            control: sifre,
                            str: "Şifre",
                            icon: LineIcons.userLock,
                            kontrol: true,
                          ),
                          BuildButtonWidget(
                              context: context,
                              str: "Giriş Yap",
                              islem: () {
                                FocusScope.of(context)
                                    .unfocus(); // klavyeyi kapatmak icin
                                try {
                                  service
                                      .login(kullaniciAdi.text, sifre.text)
                                      .then((value) {
                                    Navigator.popAndPushNamed(
                                      context,
                                      "/routeCerceve",
                                    );
                                  });
                                } catch (e) {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) => alert);
                                }
                              }),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "/routeKayitOl");
                              },
                              child: Text(
                                "Üye Değil Misin ?",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.grey.shade800,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
