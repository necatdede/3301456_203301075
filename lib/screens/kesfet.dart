import 'package:diyetlendin/widgets/build_kesfet_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Kesfet extends StatelessWidget {
  const Kesfet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: const [
              BuildKesfetWidget(
                  avatarUrl:
                      "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/770.jpg",
                  name: "Nellie Mraz",
                  content: "Bugünkü kahvaltımmm 🙂",
                  imageUrl:
                      "https://www.gulyurt.com.tr/yuklemeler/2021/09/klasik-kahvalti-scaled-8.jpg"),
              BuildKesfetWidget(
                  avatarUrl:
                      "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1056.jpg",
                  name: "Ismael Cartwright",
                  content: "Anlık gelen açlıkkk 🤣",
                  imageUrl:
                      "https://cdn.ye-mek.net/App_UI/Img/out/650/2013/10/citir-sogan-halkalari-resimli-yemek-tarifi(12).jpg"),
              BuildKesfetWidget(
                  avatarUrl:
                      "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/91.jpg",
                  name: "Miss Myrtle Swaniawski",
                  content: "Günaydınnn",
                  imageUrl:
                      "https://firsat.me/img/big1024/18.07.02_15.23.00_1637x1080_1.jpg"),
              BuildKesfetWidget(
                  avatarUrl:
                      "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/477.jpg",
                  name: "Kristine Denesik",
                  content: "Kapanışşş",
                  imageUrl:
                      "https://i.nefisyemektarifleri.com/2019/11/16/20-dakikada-aksam-yemegi-menusu.jpg"),
            ],
          )),
    );
  }
}
