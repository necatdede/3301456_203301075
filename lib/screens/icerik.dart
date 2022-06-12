import 'package:diyetlendin/icerik_data.dart';
import 'package:diyetlendin/widgets/build_icerik_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Icerik extends StatelessWidget {
  const Icerik({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final index = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Diyetlendin"),
      ),
      body: SizedBox(
        height: Get.size.height,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: BuildIcerikWidget(
              imageUrl: icerikData[index].imageUrl!,
              imageUrl2: icerikData[index].imageUrl2!,
              title: icerikData[index].title!,
              content: icerikData[index].content!),
        ),
      ),
    );
  }
}
