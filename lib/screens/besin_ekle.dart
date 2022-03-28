import 'package:diyetlendin/models/besin.dart';
import 'package:diyetlendin/main.dart';
import 'package:diyetlendin/widgets/build_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:line_icons/line_icons.dart';
import '../globals.dart' as globals;
import '../widgets/build_besin_widget.dart';

class BesinEkle extends StatefulWidget {
  const BesinEkle({Key? key}) : super(key: key);

  @override
  _BesinEkleState createState() => _BesinEkleState();
}

class _BesinEkleState extends State<BesinEkle> {
  final besinArama = TextEditingController();

  List<Besin> eklenen = [];

  @override
  Widget build(BuildContext context) {
    List ogunAdveBesinler = ModalRoute.of(context)!.settings.arguments as List;
    List<Besin> besinler = ogunAdveBesinler[1];

    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    var queryHeight = queryData.size.height;
    var queryWidth = queryData.size.width;

    return Scaffold(
      backgroundColor: MyApp().bgColor,
      appBar: AppBar(
        title: Text(ogunAdveBesinler[0]),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/routeEklenenBesinler",
                    arguments: eklenen);
              },
              icon: Icon(
                LineIcons.shoppingBasket,
                size: 40,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildTextFieldWidget(
              kontrol: false,
              control: besinArama,
              icon: Icons.search,
              klavyetur: TextInputType.text,
              str: "Besin Arama",
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              margin: EdgeInsets.only(top: 5, bottom: 5),
              //width: queryWidth*0.9,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: besinler.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () {
                        setState(() {
                          eklenen.add(besinler[index]);
                        });

                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        color: Colors.white,
                        child: Stack(
                          children: [
                            build_besin_widget(besinler: besinler,index: index,),
                          ],
                        ),
                      ),
                    );
                  }),
              // color: MyApp().bgColor,
            ),
          ],
        ),
      ),
    );
  }
}
