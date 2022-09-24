import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme.dart';
import '../widgets/appcircle.dart';
import '../widgets/apptile.dart';
import '../widgets/statusbar.dart';

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
    //double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    double devicePixelRatio = MediaQuery.of(context).size.height / 720;
    double kAspectRatio = MediaQuery.of(context).size.aspectRatio;
    double kScreenWidth = MediaQuery.of(context).size.width;
    double kScreenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: basicWhite.background,
        body: Center(
            child: SizedBox(
          child: Column(children: [
            SizedBox(
                height: (130 * devicePixelRatio),
                child: Container(
                  // color: basicBlack.accent,
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, (50 * devicePixelRatio),
                            (63 * devicePixelRatio), (50 * devicePixelRatio)),
                        child: StatusBar(
                            devicePixelRatio: devicePixelRatio,
                            theme: basicWhite))
                  ]),
                )),
            SizedBox(
                height: (373 * devicePixelRatio),
                child: Container(
                    // color: basicBlack.highlight,
                    child: SizedBox(
                  height: 140,
                  child: PageView.builder(
                    padEnds: true,
                    pageSnapping: true,
                    allowImplicitScrolling: true,
                    physics: BouncingScrollPhysics(),
                    controller: PageController(
                        initialPage: 0,
                        keepPage: false,
                        viewportFraction: 0.185),
                    itemCount: 10,
                    itemBuilder: ((context, index) => AppTile(
                        screenscale: devicePixelRatio,
                        text: "number " + index.toString())),
                  ),
                ))),
            SizedBox(
              height: (144 * devicePixelRatio),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.2 * devicePixelRatio),
                    child: AppCircle(
                        text: "", screenscale: devicePixelRatio, index: 0),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.2 * devicePixelRatio),
                    child: AppCircle(
                        text: "", screenscale: devicePixelRatio, index: 1),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.2 * devicePixelRatio),
                    child: AppCircle(
                        text: "", screenscale: devicePixelRatio, index: 2),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.2 * devicePixelRatio),
                    child: AppCircle(
                        text: "", screenscale: devicePixelRatio, index: 3),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.2 * devicePixelRatio),
                    child: AppCircle(
                        text: "", screenscale: devicePixelRatio, index: 4),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.2 * devicePixelRatio),
                    child: AppCircle(
                        text: "", screenscale: devicePixelRatio, index: 5),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.2 * devicePixelRatio),
                    child: AppCircle(
                        text: "", screenscale: devicePixelRatio, index: 6),
                  ),
                ],
              ),
            ),
            SizedBox(
                height: (73 * devicePixelRatio),
                child: Column(
                  children: [
                    Divider(
                      height: 1 * devicePixelRatio,
                      indent: 30 * devicePixelRatio,
                      endIndent: 30 * devicePixelRatio,
                      color: basicWhite.fontColor,
                    ),
                    Row(children: [
                      //
    // double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    // double kAspectRatio = MediaQuery.of(context).size.aspectRatio;
    // double kScreenWidth = MediaQuery.of(context).size.width;
    // double kScreenHeight = MediaQuery.of(context).size.height;
                      Text("  pixel ratio: " + devicePixelRatio.toString()),
                      Text("  aspect ratio: " + kAspectRatio.toString()),
                      Text("  width " + kScreenWidth.toString()),
                      Text("  height " + kScreenHeight.toString()),
                    ],)
                  ],
                ))
          ]),
        )));
  }
}
