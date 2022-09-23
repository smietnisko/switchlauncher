import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:battery_indicator/battery_indicator.dart';
import 'package:battery_plus/battery_plus.dart';
import '../theme.dart';
import '../widgets/appcircle.dart';
import '../widgets/apptile.dart';
import '../widgets/netindicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

    var batteryLevel = -1;
    var _battery = Battery();
    BatteryState? _batstat;

  @override
  initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);


    _battery.batteryLevel.then((value) => batteryLevel = value);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    _battery.onBatteryStateChanged.listen((BatteryState state) {
      if(_batstat == null || _batstat != state)
      {
        _batstat = state;
        _battery.batteryLevel.then((value) {setState(() {batteryLevel = value;});});
      }
     });

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
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 0),
                                child:
                                  StreamBuilder(
                                    stream: Stream.periodic(const Duration(seconds: 1)),
                                    builder: ((context, snapshot) => Text(TimeOfDay.now().format(context), style: TextStyle(fontSize: (26 * devicePixelRatio), fontWeight: FontWeight.bold))),)
                                //,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: (22 * devicePixelRatio)),
                                child: NetworkIndicator(devicePixelRatio: devicePixelRatio, theme: basicWhite)
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 0),
                                child:
                                  Text(batteryLevel.toString() ,style: TextStyle(fontSize: (26 * devicePixelRatio), fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Text("%",style: TextStyle(fontSize: (17.6 * devicePixelRatio), fontWeight: FontWeight.w900)),
                              ),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(7 * devicePixelRatio, 4, 0, 4),
                                  child:
                                  SizedBox(
                                    height: 29 * devicePixelRatio,
                                  child: BatteryIndicator(
                                    batteryFromPhone: true,
                                    size: 35 * devicePixelRatio,
                                    ratio: 1,
                                    style: BatteryIndicatorStyle.skeumorphism,
                                    mainColor: basicWhite.fontColor,
                                    colorful: false,
                                    showPercentNum: false,
                                  ))
                                  ),
                            ]))
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
