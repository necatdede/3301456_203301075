import 'package:diyetlendin/widgets/build_besin_widget.dart';
import 'package:flutter/material.dart';
import '../models/besin.dart';

class EklenenBesinler extends StatefulWidget {
  const EklenenBesinler({Key? key}) : super(key: key);

  @override
  _EklenenBesinlerState createState() => _EklenenBesinlerState();
}

class _EklenenBesinlerState extends State<EklenenBesinler> {
  @override
  Widget build(BuildContext context) {

    List<Besin> eklenenBesinler = ModalRoute.of(context)!.settings.arguments as List<Besin>;


    return Scaffold(
      appBar: AppBar(title: const Text("Eklenenler"),),
      body: Container(
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.only(top: 5, bottom: 5),
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: eklenenBesinler.length,
            itemBuilder: (context, index) {
              return InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  setState(() {
                   eklenenBesinler.removeAt(index);
                  });
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: Colors.white,
                  child: Stack(children: [
                    BuildBesinWidget(besinler: eklenenBesinler, index: index),
                  ],),
                ),
              );
            }),
        // color: MyApp().bgColor,
      ),
    );
  }
}
