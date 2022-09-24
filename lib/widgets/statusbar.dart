import 'package:flutter/material.dart';
import 'package:battery_indicator/battery_indicator.dart';
import 'package:battery_plus/battery_plus.dart';
import '../theme.dart';
import '../widgets/netindicator.dart';

class StatusBar extends StatefulWidget {
  final double devicePixelRatio;
  final LauncherTheme theme;
  const StatusBar({Key? key, this.devicePixelRatio = 1.0, required this.theme})
      : super(key: key);

  @override
  State<StatusBar> createState() => _StatusBarState();
}

class _StatusBarState extends State<StatusBar> {
  var batteryLevel = -1;
  // ignore: prefer_final_fields
  var _battery = Battery();
  var batteryCharging = false;
  var lowPowerMode = false;
  BatteryState? _batstat;

  @override
  initState() {
    super.initState();

    _battery.batteryLevel.then((value) => batteryLevel = value);
    _battery.isInBatterySaveMode.then((value) => lowPowerMode = value);
    _battery.batteryState.then((value) {
      _batstat = value;
      batteryCharging = (value == BatteryState.charging);
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _battery.onBatteryStateChanged.listen((BatteryState state) {
      if (_batstat == null || _batstat != state) {
        _batstat = state;
        _battery.batteryLevel.then((value) {
          setState(() {
            batteryLevel = value;
            _battery.isInBatterySaveMode.then((value) => lowPowerMode = value);
            batteryCharging = (state == BatteryState.charging);
          });
        });
      }
    });

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center, 
      children: [
        StreamBuilder(
          stream: Stream.periodic(const Duration(seconds: 1)),
          builder: ((context, snapshot) => Text(TimeOfDay.now().format(context),
              style: TextStyle(
                  fontSize: (26 * widget.devicePixelRatio),
                  color: widget.theme.fontColor,
                  fontWeight: FontWeight.bold))),
        ),
        //,
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: (22 * widget.devicePixelRatio)),
          child: NetworkIndicator(
              devicePixelRatio: widget.devicePixelRatio, theme: widget.theme)),
        Text(
          batteryLevel.toString(),
          style: TextStyle(
              fontSize: (26 * widget.devicePixelRatio),
              color: widget.theme.fontColor,
              fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text("%",
              style: TextStyle(
                  fontSize: (17.6 * widget.devicePixelRatio),
                  color: widget.theme.fontColor,
                  fontWeight: FontWeight.w900)),
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(7 * widget.devicePixelRatio, 4, 0, 4),
            child: SizedBox(
                height: 29 * widget.devicePixelRatio,
                child: BatteryIndicator(
                  batteryFromPhone: true,
                  size: 35 * widget.devicePixelRatio,
                  ratio: 1,
                  style: BatteryIndicatorStyle.skeumorphism,
                  mainColor: widget.theme.fontColor,
                  colorful: (batteryCharging || lowPowerMode),
                  showPercentNum: false,
                ))),
        (batteryCharging)
            ? Icon(
                Icons.bolt,
                size: 25 * widget.devicePixelRatio,
                color: widget.theme.fontColor,
              )
            : Text(
                "",
                style: TextStyle(fontSize: 20 * widget.devicePixelRatio),
              ),
      ]);
  }
}
