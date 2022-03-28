import 'package:diyetlendin/main.dart';
import 'package:diyetlendin/widgets/build_button_widget.dart';
import 'package:diyetlendin/widgets/build_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../globals.dart' as globals;
import '../widgets/build_ayarlar_widget.dart';

class Ayarlar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Ayarlar();
  }
}

class _Ayarlar extends State<Ayarlar> {
  final boy = TextEditingController();
  final kilo = TextEditingController();

  final konu = TextEditingController();
  final detay = TextEditingController();

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    var queryHeight = queryData.size.height;
    var queryWidth = queryData.size.width;

    // TODO: implement build
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: queryWidth,
            height: queryHeight,
            color: MyApp().bgColor,
            child: Column(
              children: [
                BuildAyarlarWidget(
                  yazi2: "",
                  yazi: "Hakkımızda",
                  icon: LineIcons.infoCircle,
                  islem: () {
                    var alert = AlertDialog(
                      title: Text(
                          "Bu uygulama,\nüstad Ahmet Cevahir ÇINAR tarafından verilen,\n3301456 numaralı Mobil Programlama dersinin ara sınavı için,\nBekir Necat Dede tarafından yapılmıştır.\n\nİletişim için,\n05419714711"),
                    );
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => alert);
                  },
                ),
                BuildAyarlarWidget(
                  yazi2: "",
                  yazi: "Gizlilik ve Koşullar",
                  icon: LineIcons.alternateShield,
                  islem: () {
                    var alert = AlertDialog(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Gizlilik",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          Text(
                              "Gizlilik, ayrı bir sayfada, kişisel verilerinizin tarafımızca işlenmesinin esaslarını düzenlemek üzere mevcuttur. Diyetlendin'i kullandığınız takdirde, bu verilerin işlenmesinin gizlilik politikasına uygun olarak gerçekleştiğini kabul edersiniz.\n"),
                          Text(
                            "Kullanım Koşulları",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          Text(
                              "Sevgili ziyaretçimiz, lütfen Diyetlendin'i ziyaret etmeden önce işbu kullanım koşulları sözleşmesini dikkatlice okuyunuz. Uygulamaya erişiminiz tamamen bu sözleşmeyi kabulünüze ve bu sözleşme ile belirlenen şartlara uymanıza bağlıdır."),
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
                  yazi: "Sıkça Sorulan Sorular",
                  icon: LineIcons.questionCircle,
                  islem: () {
                    var alert = AlertDialog(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Diyetlendin Nedir?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                          Text("Diyetlendin seni ideal kilona ve sağlıklı bir yaşama kavuşturmak için var olan ücretsiz bir online diyet uygulamasıdır."),

                          Text("\nDiyetlendin Üyeliğinde Yaş Sınırı Var Mı?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                          Text("Diyetlendin hukuki gerekçelerle 18 yaşın altındaki kişilere diyet önerisinde bulunamaz."),
                        ],
                      ),
                    );
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => alert);
                  },
                ),
                BuildAyarlarWidget(
                  yazi2: globals.kullanici.boy.toString(),
                  yazi: "Boy",
                  icon: LineIcons.ruler,
                  islem: () {
                    var alert = AlertDialog(
                      title: Column(
                        children: [
                          buildTextFieldWidget(
                              control: boy,
                              str: "Boy",
                              icon: LineIcons.ruler,
                              kontrol: false,
                              klavyetur: TextInputType.number),
                          build_button_widget(
                              str: "Güncelle",
                              islem: () {
                                setState(() {
                                  (boy.text.isEmpty)
                                      ? globals.kullanici.boy = globals.kullanici.boy
                                      : globals.kullanici.boy = (int.parse(boy.text));
                                });
                                boy.text = "";
                                Navigator.pop(context);

                                //  print(globals.boy);
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
                  yazi2: globals.kullanici.kilo.toString(),
                  yazi: "Kilo",
                  icon: LineIcons.weight,
                  islem: () {
                    var alert = AlertDialog(
                      title: Column(
                        children: [
                          buildTextFieldWidget(
                              control: kilo,
                              str: "Kilo",
                              icon: LineIcons.weight,
                              kontrol: false,
                              klavyetur: TextInputType.number),
                          build_button_widget(
                              str: "Güncelle",
                              islem: () {
                                setState(() {
                                  (kilo.text.isEmpty)
                                      ? globals.kullanici.kilo = globals.kullanici.kilo
                                      : globals.kullanici.kilo =
                                          (double.parse(kilo.text));
                                });
                                kilo.text = "";
                                Navigator.pop(context);

                                //  print(globals.boy);
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
                          buildTextFieldWidget(
                              control: konu,
                              str: "Konu",
                              icon: Icons.messenger_outline,
                              kontrol: false,
                              klavyetur: TextInputType.text),
                          buildTextFieldWidget(
                              control: detay,
                              str: "Detay",
                              icon: Icons.message_outlined,
                              kontrol: false,
                              klavyetur: TextInputType.text),
                          build_button_widget(
                              str: "Gönder",
                              islem: () {
                                Navigator.pop(context);
                                final snackbar = SnackBar(
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
                    Navigator.popAndPushNamed(context, "/");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
