import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rect_getter/rect_getter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            ISDropDown(),
          ],
        ),
      ),
    );
  }
}

class ISDropDown extends StatefulWidget {
  const ISDropDown({Key? key}) : super(key: key);

  @override
  State<ISDropDown> createState() => _ISDropDownState();
}

class _ISDropDownState extends State<ISDropDown> {
  final GlobalKey<RectGetterState> itemKey = RectGetter.createGlobalKey();
  GlobalKey inputKey = GlobalKey();
  late OverlayEntry _overlayEntry;
  late bool isOpen = false;
  String _text = '';

  void openDropdown() {
    isOpen = true;
    // if (widget.onOpen != null) {
    //   widget.onOpen!(isOpen);
    // }
    _overlayEntry = _createOverlayEntry();
    Overlay.of(inputKey.currentContext!)!.insert(_overlayEntry);
  }

  void closeDropdown() {
    isOpen = false;
    // if (widget.onOpen != null) {
    //   widget.onOpen!(isOpen);
    // }
    _overlayEntry.remove();
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: closeDropdown,
            ),
          ),
          Positioned.fromRect(
            rect: Rect.fromCenter(
              center: RectGetter.getRectFromKey(itemKey)!.bottomCenter.translate(0, 100),
              width: MediaQuery.of(context).size.width - 32,
              height: 200,
            ),
            child: Material(
              child: Container(
                color: CupertinoColors.extraLightBackgroundGray,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ...List.generate(
                        15,
                        (index) => SizedBox(
                          width: double.infinity,
                          child: CupertinoButton(
                            color: CupertinoColors.activeOrange,
                            child: Text('${index.toString() != _text ? index : 'этот'}'),
                            onPressed: () async {
                              log('$index', name: 'onPressed dropDown-element');
                              Future.delayed(
                                const Duration(milliseconds: 250),
                                () => closeDropdown(),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RectGetter(
      key: itemKey,
      child: WillPopScope(
        onWillPop: () async {
          if (isOpen) {
            // await dropdownBodyChild.currentState!.animationReverse();
            closeDropdown();
            return Future.value(false);
          } else {
            return Future.value(true);
          }
        },
        child: CupertinoTextField(
          key: inputKey,
          onTap: () {
            openDropdown();
          },
          onChanged: (text) {
            setState(() {
              _text = text;
            });
            log(_text, name: 'textField onChange');
          },
        ),
      ),
    );
  }
}
