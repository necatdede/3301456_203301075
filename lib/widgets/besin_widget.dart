import 'package:diyetlendin/main.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class BesinWidget extends StatefulWidget {
  BesinWidget(this.besinAd, this.kalori, this.karbonhidrat, this.protein,
      this.yag, this.besinFoto);

  final String besinAd;
  final int kalori;
  final double karbonhidrat;
  final double protein;
  final double yag;
  final String besinFoto;

  @override
  State<BesinWidget> createState() => _BesinWidgetState();
}

class _BesinWidgetState extends State<BesinWidget> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    var queryHeight = queryData.size.height;
    var queryWidth = queryData.size.width;

    var width = queryWidth * 0.9;

    return Stack(children: [
      Row(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              height: 100,
              // width: width*0.4,
              decoration: BoxDecoration(
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.black.withOpacity(0.5),
                //     spreadRadius: 1,
                //     blurRadius: 7,
                //     offset: Offset(0, 3), // changes position of shadow
                //   ),
                // ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                image: DecorationImage(
                    colorFilter:
                        ColorFilter.mode(Colors.black, BlendMode.dstATop),
                    opacity: 30,
                    fit: BoxFit.fill,
                    image: NetworkImage(widget.besinFoto)),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: Container(
                height: 100,
                //width: width*0.6,
                decoration: BoxDecoration(

                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.black.withOpacity(0.5),
                  //     spreadRadius: 1,
                  //     blurRadius: 7,
                  //     offset: Offset(0, 3), // changes position of shadow
                  //   ),
                  // ],
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.besinAd,
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      //verticalDirection: VerticalDirection.up,
                      //crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "images/kalori.png",
                              width: 30,
                              height: 30,
                              color: Colors.blue,
                            ),
                            Text(
                              widget.kalori.toString() + " ",
                              style:
                                  buildTextStyle(Colors.blue, 25, FontWeight.bold),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "images/karbonhidrat.png",
                              width: 30,
                              height: 30,
                              color: Colors.yellow,
                            ),
                            Text(
                              widget.karbonhidrat.toString() + " ",
                              style:
                                  buildTextStyle(Colors.yellow, 20, FontWeight.bold),
                            ),

                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "images/protein.png",
                              width: 30,
                              height: 30,
                              color: Colors.red,
                            ),
                            Text(
                              widget.protein.toString() + " ",
                              style: buildTextStyle(Colors.red, 20, FontWeight.bold),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "images/yag.png",
                              width: 30,
                              height: 30,
                              color: Colors.green,
                            ),
                            Text(
                              widget.yag.toString() + " ",
                              style:
                                  buildTextStyle(Colors.green, 20, FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          IconButton(onPressed: (){}, icon: Icon(LineIcons.infoCircle),iconSize: 40,)
        ],
      ),
      // Container(
      //   height: 125,
      //   width: 400,
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(30),
      //     // gradient: LinearGradient(
      //     //   //stops: [0.0,0.55],
      //     //   begin: Alignment.bottomLeft,
      //     //   end: Alignment.topRight,
      //     //   colors: [
      //     //     MyApp().textfieldColor,
      //     //     MyApp().textfieldColor.withOpacity(0),
      //     //   ],
      //     // ),
      //   ),
      // )
    ]);
  }

  TextStyle buildTextStyle(Color renk, double size, FontWeight fontWeight) {
    return TextStyle(
      color: renk,
      fontSize: size,
      fontWeight: fontWeight,
    );
  }
}
