import 'package:diyetlendin/controllers/firebase_controller.dart';
import 'package:diyetlendin/main.dart';
import 'package:diyetlendin/services/firebase_service.dart';
import 'package:diyetlendin/widgets/build_button_widget.dart';
import 'package:diyetlendin/widgets/build_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../widgets/build_ayarlar_widget.dart';

class Ayarlar extends StatefulWidget {
  const Ayarlar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Ayarlar();
  }
}

class _Ayarlar extends State<Ayarlar> {
  final c = Get.put(FirebaseController());
  FirebaseService service = FirebaseService();
  final boy = TextEditingController();
  final kilo = TextEditingController();

  final konu = TextEditingController();
  final detay = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: const MyApp().bgColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: Get.height,
          child: Column(
            children: [
              BuildAyarlarWidget(
                yazi2: "",
                yazi: "Hakkımızda",
                icon: LineIcons.infoCircle,
                islem: () {
                  Get.defaultDialog(
                      titleStyle: TextStyle(fontSize: 20.sp),
                      title: "Hakkımızda",
                      content: Text(
                          "Bu uygulama,\nüstad Ahmet Cevahir ÇINAR tarafından verilen,\n3301456 numaralı Mobil Programlama dersinin ara sınavı için,\nBekir Necat Dede tarafından yapılmıştır.\n\nİletişim için,\n05419714711"));
                },
              ),
              BuildAyarlarWidget(
                yazi2: "",
                yazi: "Gizlilik ve Koşullar",
                icon: LineIcons.alternateShield,
                islem: () {
                  Get.defaultDialog(
                    titleStyle: TextStyle(fontSize: 20.sp),
                    title: "Gizlilik ve Koşullar",
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Gizlilik",
                          style: TextStyle(fontSize: 18.sp),
                        ),
                        const Text(
                            "Gizlilik, ayrı bir sayfada, kişisel verilerinizin tarafımızca işlenmesinin esaslarını düzenlemek üzere mevcuttur. Diyetlendin'i kullandığınız takdirde, bu verilerin işlenmesinin gizlilik politikasına uygun olarak gerçekleştiğini kabul edersiniz.\n"),
                        Text(
                          "Kullanım Koşulları",
                          style: TextStyle(fontSize: 18.sp),
                        ),
                        const Text(
                            "Sevgili ziyaretçimiz, lütfen Diyetlendin'i ziyaret etmeden önce işbu kullanım koşulları sözleşmesini dikkatlice okuyunuz. Uygulamaya erişiminiz tamamen bu sözleşmeyi kabulünüze ve bu sözleşme ile belirlenen şartlara uymanıza bağlıdır."),
                      ],
                    ),
                  );
                },
              ),
              BuildAyarlarWidget(
                yazi2: "",
                yazi: "Sıkça Sorulan Sorular",
                icon: LineIcons.questionCircle,
                islem: () {
                  Get.defaultDialog(
                    titleStyle: TextStyle(fontSize: 20.sp),
                    title: "Sıkça Sorulan Sorular",
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Diyetlendin Nedir?",
                          style: TextStyle(fontSize: 18.sp),
                        ),
                        Text(
                            "Diyetlendin seni ideal kilona ve sağlıklı bir yaşama kavuşturmak için var olan ücretsiz bir online diyet uygulamasıdır."),
                        Text(
                          "\nDiyetlendin Üyeliğinde Yaş Sınırı Var Mı?",
                          style: TextStyle(fontSize: 18.sp),
                        ),
                        Text(
                            "Diyetlendin hukuki gerekçelerle 18 yaşın altındaki kişilere diyet önerisinde bulunamaz."),
                      ],
                    ),
                  );
                },
              ),
              BuildAyarlarWidget(
                yazi2: c.kullanici.value.boy.toString(),
                yazi: "Boy",
                icon: LineIcons.ruler,
                islem: () {
                  var alert = AlertDialog(
                    title: Column(
                      children: [
                        BuildTextFieldWidget(
                            control: boy,
                            str: "Boy",
                            icon: LineIcons.ruler,
                            kontrol: false,
                            klavyetur: TextInputType.number),
                        BuildButtonWidget(
                            str: "Güncelle",
                            islem: () {
                              setState(() {});
                              boy.text = "";
                              Navigator.pop(context);
                            },
                            context: context),
                      ],
                    ),
                  );
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => alert);
                },
              ),
              BuildAyarlarWidget(
                yazi2: c.kullanici.value.kilo.toString(),
                yazi: "Kilo",
                icon: LineIcons.weight,
                islem: () {
                  var alert = AlertDialog(
                    title: Column(
                      children: [
                        BuildTextFieldWidget(
                            control: kilo,
                            str: "Kilo",
                            icon: LineIcons.weight,
                            kontrol: false,
                            klavyetur: TextInputType.number),
                        BuildButtonWidget(
                            str: "Güncelle",
                            islem: () {
                              setState(() {});
                              kilo.text = "";
                              Navigator.pop(context);
                            },
                            context: context),
                      ],
                    ),
                  );
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => alert);
                },
              ),
              BuildAyarlarWidget(
                yazi2: "",
                yazi: "Bize Ulaşmak İçin",
                icon: LineIcons.comments,
                islem: () {
                  var alert = AlertDialog(
                    title: Column(
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
                              Navigator.pop(context);
                              const snackbar = SnackBar(
                                content: Text("Mesajınız Gönderildi!"),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackbar);
                            },
                            context: context),
                      ],
                    ),
                  );
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => alert);
                },
              ),
              BuildAyarlarWidget(
                yazi2: "",
                yazi: "Çıkış",
                icon: LineIcons.doorOpen,
                islem: () {
                  service.out();
                  Navigator.popAndPushNamed(context, "/");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
