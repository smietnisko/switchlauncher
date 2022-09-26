// a tiny mod of battery_indicator package
// https://github.com/debuggerx01/battery_indicator/blob/master/lib/battery_indicator.dart

import 'package:flutter/material.dart';

import 'package:battery_plus/battery_plus.dart';

enum NSBatteryIndicatorStyle { flat, skeumorphism, atmos }

enum NSBatteryIndicatorColorMode { colorful, state, none }

class NSBatteryIndicator extends StatefulWidget {
  /// indicator style，[NSBatteryIndicatorStyle.flat] and [NSBatteryIndicatorStyle.skeumorphism]
  /// forked: [NSBatteryIndicatorStyle.atmos]
  final NSBatteryIndicatorStyle style;

  /// widget`s width / height , default to 2.5：1
  final double ratio;

  /// color of borderline , and fill color when colorful is false
  final Color mainColor;

  /// indicator color mode 
  /// [NSBatteryIndicatorColorMode.colorful]  -- always colored, based on percent
  /// [NSBatteryIndicatorColorMode.state]     -- color based on battery state (charging, lpm)
  /// [NSBatteryIndicatorColorMode.none]      -- never colored
  final NSBatteryIndicatorColorMode colorful;

  /// whether paint fill color
  final bool showPercentSlide;

  /// whether show battery value , Recommended [NOT] set to True when colorful = false
  final bool showPercentNum;

  /// default to 14.0
  final double size;

  /// battery value font size, default to null
  final double? percentNumSize;

  ///boolean to choose from where to obtain the value of the battery
  ///if it is true, the indicator will update in base of the phone battery,
  ///if not, you can controll with a variable
  final bool batteryFromPhone;

  final int batteryLevel;

  NSBatteryIndicator(
      {this.batteryFromPhone = true,
        this.batteryLevel = 25,
        this.style = NSBatteryIndicatorStyle.flat,
        this.ratio = 2.5,
        this.mainColor = Colors.black,
        this.colorful = NSBatteryIndicatorColorMode.none,
        this.showPercentNum = true,
        this.showPercentSlide = true,
        this.percentNumSize,
        this.size = 14.0});

  @override
  _NSBatteryIndicatorState createState() => _NSBatteryIndicatorState();
}

class _NSBatteryIndicatorState extends State<NSBatteryIndicator> {
  int batteryLv = 0;
  Battery battery = Battery();
  bool batteryIsCharging = false;
  bool batteryLowPowermode = false;

  @override
  Widget build(BuildContext context) {
    if (widget.batteryFromPhone) {
      //this variable batteryLevel is from battery package
      battery.batteryLevel.then((val) {
        setState(() {
          batteryLv = val;
        });
      });
    } else {
      setState(() {
        batteryLv = widget.batteryLevel;
      });
    }

    return Container(
      child: SizedBox(
        height: widget.size,
        width: widget.size * widget.ratio,
        child: CustomPaint(
          painter: NSBatteryIndicatorPainter(batteryLv, batteryIsCharging, batteryLowPowermode, widget.style,
              widget.showPercentSlide, widget.colorful, widget.mainColor),
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(
                  right: widget.style == NSBatteryIndicatorStyle.flat
                      ? 0.0
                      : widget.size * widget.ratio * 0.04),
              child: widget.showPercentNum
                  ? Text(
                '$batteryLv',
                style: TextStyle(
                    fontSize: widget.percentNumSize ?? widget.size * 0.9),
              )
                  : Text(
                '',
                style: TextStyle(
                    fontSize: widget.percentNumSize ?? widget.size * 0.9),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NSBatteryIndicatorPainter extends CustomPainter {
  int batteryLv;
  bool batteryLowPowerMode;
  bool batteryIsCharging;
  NSBatteryIndicatorStyle style;
  NSBatteryIndicatorColorMode colorful;
  bool showPercentSlide;
  Color mainColor;

  NSBatteryIndicatorPainter(this.batteryLv, this.batteryIsCharging, this.batteryLowPowerMode, this.style, this.showPercentSlide,
      this.colorful, this.mainColor);

  @override
  void paint(Canvas canvas, Size size) {
    if (style == NSBatteryIndicatorStyle.flat) {
      canvas.drawRRect(
          RRect.fromLTRBR(0.0, size.height * 0.05, size.width,
              size.height * 0.95, const Radius.circular(100.0)),
          Paint()
            ..color = mainColor
            ..strokeWidth = 0.5
            ..style = PaintingStyle.stroke);

      if (showPercentSlide) {
        canvas.clipRect(Rect.fromLTWH(0.0, size.height * 0.05,
            size.width * fixedBatteryLv / 100, size.height * 0.95));

        double offset = size.height * 0.1;

        canvas.drawRRect(
            RRect.fromLTRBR(
                offset,
                size.height * 0.05 + offset,
                size.width - offset,
                size.height * 0.95 - offset,
                const Radius.circular(100.0)),
            Paint()
              ..color = (colorful == NSBatteryIndicatorColorMode.colorful) ? getBatteryLvColor : mainColor
              ..style = PaintingStyle.fill);
      }
    } else {
      canvas.drawRRect(
          RRect.fromLTRBR(0.0, size.height * 0.05, size.width * 0.92,
              size.height * 0.95, Radius.circular(size.height * 0.1)),
          Paint()
            ..color = mainColor
            ..strokeWidth = 0.8
            ..style = PaintingStyle.stroke);

      canvas.drawRRect(
          RRect.fromLTRBR(size.width * 0.92, size.height * 0.25, size.width,
              size.height * 0.75, Radius.circular(size.height * 0.1)),
          Paint()
            ..color = mainColor
            ..style = PaintingStyle.fill);

      if (showPercentSlide) {
        canvas.clipRect(Rect.fromLTWH(0.0, size.height * 0.05,
            size.width * 0.92 * fixedBatteryLv / 100, size.height * 0.95));

        double offset = size.height * 0.1;

        canvas.drawRRect(
            RRect.fromLTRBR(
                offset,
                size.height * 0.05 + offset,
                size.width * 0.92 - offset,
                size.height * 0.95 - offset,
                Radius.circular(size.height * 0.1)),
            Paint()
              ..color = (colorful == NSBatteryIndicatorColorMode.colorful) ? getBatteryLvColor : mainColor
              ..style = PaintingStyle.fill);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return (oldDelegate as NSBatteryIndicatorPainter).batteryLv != batteryLv ||
        (oldDelegate).mainColor != mainColor;
  }

  get fixedBatteryLv => batteryLv < 10 ? 4 + batteryLv / 2 : batteryLv;

  get getBatteryLvColor => batteryLv < 15
      ? Colors.red
      : batteryLv < 30
      ? Colors.orange
      : Colors.green;
}