import 'package:diyetlendin/main.dart';
import 'package:diyetlendin/widgets/besin_widget.dart';
import 'package:diyetlendin/widgets/build_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:line_icons/line_icons.dart';

class BesinEkle extends StatefulWidget {
  const BesinEkle({Key? key}) : super(key: key);

  @override
  _BesinEkleState createState() => _BesinEkleState();
}

class _BesinEkleState extends State<BesinEkle> {
  final besinArama = TextEditingController();

  static List yenmisler = [
    0,
    1,
  ];

  @override
  Widget build(BuildContext context) {
    String ogunAd = ModalRoute.of(context)!.settings.arguments as String;

    List urunler = [
      BesinWidget("Muz", 89, 22.84, 1.09, 0.33, "https://l24.im/ckpeG0"),
      BesinWidget("Çilek", 32, 7.68, 0.67, 0.3, "https://l24.im/efWC"),
      BesinWidget("Yulaf", 351, 57.25, 11.35, 5.8, "https://l24.im/QLewxf"),
      BesinWidget("Ekmek", 238, 43.91, 10.66, 2.15, "https://l24.im/NRUvAO"),
      BesinWidget("Çikolata", 528, 57.9, 4.4, 35.1, "https://l24.im/jGiHt2"),
      BesinWidget("Cips", 532, 7.75, 0.91, 55.39, "https://l24.im/f8GP"),
      BesinWidget("Peynir", 310, 2.53, 20.38, 24.31, "https://l24.im/ZR7u")];

    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    var queryHeight = queryData.size.height;
    var queryWidth = queryData.size.width;


    return Scaffold(
      backgroundColor: MyApp().bgColor,
      appBar: AppBar(

        title: Text(ogunAd),
        actions: [
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(LineIcons.save,size: 40,)),
        ],

      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(

            children: [
              buildTextFieldWidget(
                kontrol: false,
                control: besinArama,
                icon: Icons.search,
                klavyetur: TextInputType.text,
                str: "Besin Arama",
              ),
              Container(
                height: queryHeight*0.7,
                margin: EdgeInsets.only(top: 5, bottom: 5),
                //width: queryWidth*0.9,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: urunler.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        borderRadius: BorderRadius.circular(30),
                        onTap: () {
                          setState(() {
                            yenmisler.add(index);
                          });
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          color: Colors.white,
                          child: urunler[index],
                        ),
                      );
                    }),
                // color: MyApp().bgColor,
              ),
              // Text(
              //   ogunAd,
              //   style: TextStyle(fontSize: 30),
              //   textAlign: TextAlign.start,
              // ),
            ],
          ),
          // DraggableScrollableSheet(
          //   initialChildSize: 0.2,
          //   minChildSize: 0.2,
          //   maxChildSize: 1,
          //
          //   builder: (BuildContext context,
          //       ScrollController scrollController) {
          //     return Container(
          //
          //       decoration: BoxDecoration(
          //         color: MyApp().bgColor,
          //
          //         border: Border(
          //           top: BorderSide(
          //             color: MyApp().textfieldColor,
          //             width: 3,
          //           ),
          //           left: BorderSide(
          //             color: MyApp().textfieldColor,
          //             width: 3,
          //           ),
          //           right: BorderSide(
          //             color: MyApp().textfieldColor,
          //             width: 3,
          //           ),
          //
          //         ),
          //       ),
          //       height: queryHeight*0.4,
          //         //color: Colors.white70,
          //         child: ListView.builder(
          //           physics: BouncingScrollPhysics(),
          //             controller: scrollController,
          //             //scrollDirection: Axis.vertical,
          //             itemCount: yenmisler.length,
          //             itemBuilder: (context, index) {
          //               return Padding(
          //                 padding:
          //                     const EdgeInsets.only(right: 10, left: 10),
          //                 child: InkWell(
          //                   borderRadius: BorderRadius.circular(30),
          //                   onTap: () {
          //                     setState(() {
          //                       yenmisler.removeAt(index);
          //                     });
          //                   },
          //                   child: Card(
          //                     shape: RoundedRectangleBorder(
          //                       borderRadius: BorderRadius.circular(30),
          //                     ),
          //                     color: Colors.white,
          //                     child: urunler[yenmisler[index]],
          //                   ),
          //                 ),
          //               );
          //             }));
          //   },
          // ),
        ],
      ),
    );
  }
}
