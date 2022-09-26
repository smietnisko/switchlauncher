// NetworkIndicator widget

// TODO: flight mode icon
// TODO: mobile data icons

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:signal_strength_indicator/signal_strength_indicator.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:wifi_info_plugin/wifi_info_plugin.dart';
import '../theme.dart';

class NetworkIndicator extends StatefulWidget
{
  final double devicePixelRatio;
  final LauncherTheme theme;
  const NetworkIndicator({Key? key, this.devicePixelRatio = 1.0, required this.theme}) : super(key: key);

  @override
  _NetworkIndicatorState createState() => _NetworkIndicatorState();
}

class _NetworkIndicatorState extends State<NetworkIndicator>
{
  WifiInfoWrapper? _wifiObject;

  var subscription;

  @override
  void initState() {
    super.initState();
    initPlatformState();
      Timer.periodic(const Duration(seconds:1), (Timer t)=> initPlatformState());

    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) { initPlatformState(); });
  }

  @override
  dispose() {
    super.dispose();

    subscription.cancel();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    WifiInfoWrapper? wifiObject;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      wifiObject = await  WifiInfoPlugin.wifiDetails;
    }
    on PlatformException{}
    if (!mounted) return;

    if((_wifiObject?.networkId != wifiObject?.networkId) ||
      (_wifiObject?.connectionType != wifiObject?.connectionType) ||
       (_wifiObject?.signalStrength != wifiObject?.signalStrength))
    {
        setState(() {_wifiObject = wifiObject;});
    }
  }

  @override
  Widget build(BuildContext context)
  {
    initPlatformState();
    return Column(children:[
      Text(" ", style: TextStyle(fontSize: (_wifiObject?.connectionType == null)? 0 : 8.25),),
      SizedBox(
          height: 20 * widget.devicePixelRatio,
          width: 20 * widget.devicePixelRatio,
          child: neticon(context),
        )]);
  }

  Widget neticon(BuildContext context)
  {
    switch (_wifiObject?.connectionType) {
      case "Wifi":
        return wifiIcon(context);
      // case "Mobile data"
      default:
        return Icon(Icons.wifi_off, size: 28 * widget.devicePixelRatio, color: widget.theme.fontColor);
    }
  }

  Widget wifiIcon(BuildContext context) =>
    Transform.rotate(
      angle: -45 * pi / 180,
      origin: const Offset(-15, 0),
      child: SignalStrengthIndicator.sector(
        value: wifiStrengthValue(_wifiObject?.signalStrength),
        size: (14 * widget.devicePixelRatio),
        spacing: 0.5,
        activeColor: widget.theme.fontColor,
        inactiveColor: widget.theme.inactive,
        margin: EdgeInsets.symmetric(vertical: 0.1),
        ),
    );
}

double wifiStrengthValue(int? strength)
{
  if (strength == null) return 0;
  return strength/10.0;
}