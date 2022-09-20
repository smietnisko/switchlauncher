import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_animations/simple_animations.dart';
import '../theme.dart';

class AppTile extends StatefulWidget {
  final String text;
  const AppTile({Key? key, required this.text}) : super(key: key);

  @override
  _AppTileState createState() => _AppTileState();
}

class _AppTileState extends State<AppTile> with TickerProviderStateMixin {
  late FocusNode _node;
  // ignore: unused_field
  late FocusAttachment _attachment;
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _node = FocusNode();
    _node.addListener(_handleFocusChange);
    _attachment = _node.attach(context, onKey: _handleKeyPress);
  }

  void _handleFocusChange() {
    if (_node.hasFocus != _focused) {
      if (_node.hasFocus) {
        _focused = _node.hasFocus;
      } else {
        _focused = _node.hasFocus;
      }
      setState(() {
        _focused = _node.hasFocus;
        //print(_focused.toString() + _node.debugLabel);
      });
    }
  }

  KeyEventResult _handleKeyPress(FocusNode node, RawKeyEvent event) {
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    return MirrorAnimation<double>(
        tween: Tween(begin: 0, end: 1),
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 450),
        builder: ((context, child, value) {
          return ButtonTheme(
              //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))) ,
              padding: EdgeInsets.all(0),
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              child: RawMaterialButton(
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  elevation: 1,
                  focusElevation: 2,
                  onPressed: () {},
                  onLongPress: () {},
                  focusNode: _node,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 31.42,
                        child:
                            OverflowBox(
        maxWidth: double.infinity,
                              alignment: Alignment.bottomCenter,
                              child: Text((_focused) ? "this is some long App name" : "",
                            softWrap: false,

                            overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 17.8, color: basicWhite.highlightFade, ), )),
                      ),
                      SizedBox(
                          height: 156.57,
                          width: 156.57,
                          child: Container(
                            child: SizedBox(
                          height: 156.57,
                          width: 156.57,
                          child: Container(
                            child: Padding(
                                padding: EdgeInsets.all(2.8),
                                child: SizedBox(
                                    height: 150.86,
                                    child: Container(
                                      child: Padding(
                                          padding: EdgeInsets.all(2.8),
                                          child: SizedBox(
                                              height: 146.28,
                                              child: Container(
                                                child: Center(
                                                    child: Center(
                                                        child:
                                                            Text(widget.text))),
                                                decoration: BoxDecoration(
                                                  color: basicWhite.accent,
                                                ),
                                              ))),
                                      decoration: (_focused)
                                          ? BoxDecoration(
                                              color: basicWhite.background2)
                                          : null,
                                    ))),

                            decoration: (_focused)
                                ? BoxDecoration(
                                    color: Color.fromRGBO(basicWhite.highlightFade.red, basicWhite.highlightFade.green, basicWhite.highlightFade.blue, value),
                                    //color: value,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(2)))
                                : null)),
                            decoration: (_focused)
                                ? BoxDecoration(
                                    color: basicWhite.highlight,
                                    //color: value,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(2)))
                                : null,
                          )),
                          Expanded(child: Text(""))
                    ],
                  )));
        }));
    //
  }
}
