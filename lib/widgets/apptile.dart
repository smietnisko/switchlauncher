import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_animations/simple_animations.dart';
import '../theme.dart';

class AppTile extends StatefulWidget {
  final String text;
  final String appName;
  final double screenscale;
  final LauncherTheme theme;
  const AppTile(
      {Key? key,
      required this.text,
      required this.screenscale,
      required this.theme,
      this.appName = "sample"})
      : super(key: key);

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

  Widget outerBorder(Color color) => SizedBox(
      height: 274,
      width: 274,
      child: Container(
        decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.all(Radius.circular(4))),
      ));
  Widget get innerBorder => SizedBox(
      height: 264,
      width: 264,
      child: Container(decoration: BoxDecoration(color: widget.theme.iconbg),
      ));
  Widget get __empty => const SizedBox.shrink();

  Widget get _temptilefill => SizedBox(
      height: 256,
      width: 256,
      child: Container(
        child: Center(child: Center(child: Text(widget.text))),
        decoration: BoxDecoration(
          color: widget.theme.accent,
        ),
      ));

  @override
  Widget build(BuildContext context) {
    return MirrorAnimation<double>(
        tween: Tween(begin: 0, end: 1),
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 450),
        builder: ((context, child, animValue) {
          return ButtonTheme(
              //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))) ,
              // padding: EdgeInsets.all(0),
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
                        height: 55 * widget.screenscale,
                        child: OverflowBox(
                            maxWidth: double.infinity,
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              (_focused) ? "this is some long App name" : "",
                              softWrap: false,
                              overflow: TextOverflow.visible,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17.8,
                                color: widget.theme.highlightFade,
                              ),
                            )),
                      ),
                      Stack(clipBehavior: Clip.none, children: [
                        (_focused)? Positioned(left: -9,top: -9,child: outerBorder(widget.theme.highlight)) : __empty,
                        (_focused)? Positioned(left: -9,top: -9,
                                child: outerBorder(Color.fromRGBO(
                                    widget.theme.highlightFade.red,
                                    widget.theme.highlightFade.green,
                                    widget.theme.highlightFade.blue,
                                    animValue)))
                            : __empty,
                        (_focused)? Positioned(child: innerBorder,left: -4, top: -4,): __empty,
                         _temptilefill,
                      ]),
                      Expanded(child: Text(""))
                    ],
                  )));
        }));
    //
  }
}

