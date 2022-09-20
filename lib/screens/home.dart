import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme.dart';
import '../widgets/apptile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: basicWhite.background,
        body: Center(
            child: SizedBox(
          child: Column(children: [
            SizedBox(
                height: 75,
                child: Container(
                  // color: basicBlack.accent,
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Text(MediaQuery.of(context).devicePixelRatio.toString()),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 29.3, 36, 29.5),
                        child: Row(children: [
                          const Text("21:37", style: TextStyle(fontSize: 17.7)),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(14, 0, 16, 0),
                            child: Icon(
                              Icons.wifi,
                              size: 17.7,
                              color: basicWhite.fontColor,
                            ),
                          ),
                          const Text("100%", style: TextStyle(fontSize: 17.7)),
                          const Icon(Icons.battery_full_outlined, size: 17.7)
                        ]))
                  ]),
                )),
            SizedBox(
                height: 213,
                width: 1280,
                child: Container(
                    // color: basicBlack.highlight,
                    child: SizedBox(
                        height: 140,
                        child:
                        PageView.builder(
                            padEnds: true,
                            pageSnapping: true,
                            allowImplicitScrolling: true,

                          physics: BouncingScrollPhysics(),
                            controller: PageController(
                                initialPage: 0,
                                keepPage: false,
                                viewportFraction: 0.19),
                            itemCount: 10,
                            itemBuilder: ((context, index) =>
                                AppTile(text: "number " + index.toString()))
                                ,
                                ),
                ))),
            SizedBox(
                height: 81,
                width: 1280,
                child: Container(
                  // color: basicBlack.highlightFade,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6.5),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(""),
                            style: ElevatedButton.styleFrom(
                              elevation: 0.35,
                              minimumSize: Size.fromRadius(24.55),
                              maximumSize: Size.fromRadius(24.55),
                              shape: CircleBorder(),
                              primary: Color.fromARGB(255, 242, 16, 31),
                              shadowColor: basicBlack.background2,
                              onPrimary:
                                  basicWhite.highlight, // <-- Splash color
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6.5),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(""),
                            style: ElevatedButton.styleFrom(
                              elevation: 0.35,
                              minimumSize: Size.fromRadius(24.55),
                              maximumSize: Size.fromRadius(24.55),
                              shape: CircleBorder(),
                              primary: basicWhite.iconbg, // <-- Button color
                              onPrimary:
                                  basicWhite.highlight, // <-- Splash color
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6.5),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(""),
                            style: ElevatedButton.styleFrom(
                              elevation: 0.35,
                              minimumSize: Size.fromRadius(24.55),
                              maximumSize: Size.fromRadius(24.55),
                              shape: CircleBorder(),
                              primary: basicWhite.iconbg, // <-- Button color
                              onPrimary:
                                  basicWhite.highlight, // <-- Splash color
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6.5),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(""),
                            style: ElevatedButton.styleFrom(
                              elevation: 0.35,
                              minimumSize: Size.fromRadius(24.55),
                              maximumSize: Size.fromRadius(24.55),
                              shape: CircleBorder(),
                              primary: basicWhite.iconbg, // <-- Button color
                              onPrimary:
                                  basicWhite.highlight, // <-- Splash color
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6.5),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(""),
                            style: ElevatedButton.styleFrom(
                              elevation: 0.35,
                              minimumSize: Size.fromRadius(24.55),
                              maximumSize: Size.fromRadius(24.55),
                              shape: CircleBorder(),
                              primary: basicWhite.iconbg, // <-- Button color
                              onPrimary:
                                  basicWhite.highlight, // <-- Splash color
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6.5),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(""),
                            style: ElevatedButton.styleFrom(
                              elevation: 0.35,
                              minimumSize: Size.fromRadius(24.55),
                              maximumSize: Size.fromRadius(24.55),
                              shape: CircleBorder(),
                              primary: basicWhite.iconbg, // <-- Button color
                              onPrimary:
                                  basicWhite.highlight, // <-- Splash color
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6.5),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(""),
                            style: ElevatedButton.styleFrom(
                              elevation: 0.35,
                              minimumSize: Size.fromRadius(24.55),
                              maximumSize: Size.fromRadius(24.55),
                              shape: CircleBorder(),
                              primary: basicWhite.iconbg, // <-- Button color
                              onPrimary:
                                  basicWhite.highlight, // <-- Splash color
                            ),
                          )),
                    ],
                  ),
                )),
            SizedBox(
                height: 42,
                width: 1280,
                child: Column(
                  children: [
                    Divider(
                      height: 0.5,
                      indent: 17.1,
                      endIndent: 17.1,
                      color: basicWhite.fontColor,
                    )
                  ],
                ))
          ]),
        )));
  }
}
