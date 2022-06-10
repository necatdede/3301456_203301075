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
                  content: "quis voluptas et",
                  imageUrl: "http://placeimg.com/640/480/animals"),
              BuildKesfetWidget(
                  avatarUrl:
                      "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1056.jpg",
                  name: "Ismael Cartwright",
                  content: "perferendis consequatur numquam",
                  imageUrl: "http://placeimg.com/640/480/abstract"),
              BuildKesfetWidget(
                  avatarUrl:
                      "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/91.jpg",
                  name: "Miss Myrtle Swaniawski",
                  content: "deserunt laudantium molestias",
                  imageUrl: "http://placeimg.com/640/480/nightlife"),
              BuildKesfetWidget(
                  avatarUrl:
                      "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/477.jpg",
                  name: "Kristine Denesik",
                  content: "architecto facere alias",
                  imageUrl: "http://placeimg.com/640/480/city"),
            ],
          )),
    );
  }
}
