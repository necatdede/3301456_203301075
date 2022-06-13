import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SSS extends StatelessWidget {
  const SSS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sıkça Sorulan Sorular")),
      body: SizedBox(
          height: Get.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Diyetlendin Nedir?",
                  style:
                      TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
                ),
                const Text(
                    '''Diyetlendin seni ideal kilona ve sağlıklı bir yaşama kavuşturmak için var olan ücretsiz bir online diyet uygulamasıdır.'''),
                Text(
                  "Diyetlendin Üyeliğinde Yaş Sınırı Var Mı?",
                  style:
                      TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
                ),
                const Text(
                    '''Diyetlendin hukuki gerekçelerle 18 yaşın altındaki kişilere diyet önerisinde bulunamaz.'''),
              ],
            ),
          )),
    );
  }
}
