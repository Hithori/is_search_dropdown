// import 'package:flutter/material.dart';
//
// class CoolDropdown extends StatefulWidget {
//   List dropdownList;
//   Function onChange;
//   Function? onOpen;
//   String placeholder;
//   late Map defaultValue;
//   bool isTriangle;
//   bool isAnimation;
//   bool isResultIconLabel;
//   bool isResultLabel;
//   bool isDropdownLabel; // late
//   bool resultIconRotation;
//   late Widget resultIcon;
//   double resultIconRotationValue;
//
//   // size
//   double resultWidth;
//   double resultHeight;
//   double? dropdownWidth; // late
//   double dropdownHeight; // late
//   double dropdownItemHeight;
//   double triangleWidth;
//   double triangleHeight;
//   double iconSize;
//
//   // align
//   Alignment resultAlign;
//   String dropdownAlign; // late
//   Alignment dropdownItemAlign;
//   String triangleAlign;
//   double triangleLeft;
//   bool dropdownItemReverse;
//   bool resultReverse;
//   MainAxisAlignment resultMainAxis;
//   MainAxisAlignment dropdownItemMainAxis;
//
//   // padding
//   EdgeInsets resultPadding;
//   EdgeInsets dropdownItemPadding;
//   EdgeInsets dropdownPadding; // late
//   EdgeInsets selectedItemPadding;
//
//   // style
//   // late BoxDecoration resultBD;
//   // late BoxDecoration dropdownBD; // late
//   // late BoxDecoration selectedItemBD;
//   // late TextStyle selectedItemTS;
//   // late TextStyle unselectedItemTS;
//   // late TextStyle resultTS;
//   // late TextStyle placeholderTS;
//
//   // gap
//   double gap;
//   double labelIconGap;
//   double dropdownItemGap;
//   double dropdownItemTopGap;
//   double dropdownItemBottomGap;
//   double resultIconLeftGap;
//
//   CoolDropdown({
//     required this.dropdownList,
//     required this.onChange,
//     this.onOpen,
//     resultIcon,
//     placeholderTS,
//     this.dropdownItemReverse = false,
//     this.resultReverse = false,
//     this.resultIconRotation = true,
//     this.isTriangle = false,
//     this.isResultLabel = true,
//     this.placeholder = 'Выберите',
//     required this.resultWidth,
//     required this.resultHeight,
//     this.dropdownWidth,
//     this.dropdownHeight = 200,
//     this.dropdownItemHeight = 50,
//     this.resultAlign = Alignment.centerLeft,
//     this.dropdownAlign = 'center',
//     this.triangleAlign = 'center',
//     this.dropdownItemAlign = Alignment.centerLeft,
//     this.dropdownItemMainAxis = MainAxisAlignment.spaceBetween,
//     this.resultMainAxis = MainAxisAlignment.spaceBetween,
//     this.resultPadding = const EdgeInsets.only(top: 9, bottom: 9, right: 12, left: 12),
//     this.dropdownItemPadding = const EdgeInsets.only(top: 3, bottom: 3, right: 16, left: 16),
//     this.dropdownPadding = const EdgeInsets.only(left: 0, right: 0),
//     this.selectedItemPadding = const EdgeInsets.only(top: 3, bottom: 3, right: 16, left: 16),
//     resultBD,
//     dropdownBD,
//     selectedItemBD,
//     selectedItemTS,
//     unselectedItemTS,
//     resultTS,
//     this.labelIconGap = 10,
//     this.dropdownItemGap = 0,
//     this.dropdownItemTopGap = 0,
//     this.dropdownItemBottomGap = 0,
//     this.resultIconLeftGap = 0,
//     this.gap = 4,
//     this.triangleWidth = 20,
//     this.triangleHeight = 20,
//     this.triangleLeft = 0,
//     this.isAnimation = false,
//     this.isResultIconLabel = true,
//     this.resultIconRotationValue = 0.5,
//     this.isDropdownLabel = true,
//     this.iconSize = 10,
//     defaultValue,
//   }) {
//     // 기본값 셋팅
//     if (defaultValue != null) {
//       print('.. $defaultValue');
//       this.defaultValue = defaultValue;
//     } else {
//       this.defaultValue = {};
//     }
//     // label unique 체크
//     for (var i = 0; i < dropdownList.length; i++) {
//       if (dropdownList[i]['label'] == null) {
//         throw '"label" must be initialized.';
//       }
//       for (var j = 0; j < dropdownList.length; j++) {
//         if (i != j) {
//           if (dropdownList[i]['label'] == dropdownList[j]['label']) {
//             throw 'label is duplicated. Labels have to be unique.';
//           }
//         }
//       }
//     }
//   }
//
//   @override
//   _CoolDropdownState createState() => _CoolDropdownState();
// }
//
// class _CoolDropdownState extends State<CoolDropdown>
//     with TickerProviderStateMixin {
//   GlobalKey<DropdownBodyState> dropdownBodyChild = GlobalKey();
//   GlobalKey inputKey = GlobalKey();
//   Offset triangleOffset = Offset(0, 0);
//   late OverlayEntry _overlayEntry;
//   late Map selectedItem;
//   late AnimationController rotationController;
//   late AnimationController sizeController;
//   late Animation<double> textWidth;
//   AnimationUtil au = AnimationUtil();
//   late bool isOpen = false;
//
//   void openDropdown() {
//     isOpen = true;
//     if (widget.onOpen != null) {
//       widget.onOpen!(isOpen);
//     }
//     this._overlayEntry = this._createOverlayEntry();
//     Overlay.of(inputKey.currentContext!)!.insert(this._overlayEntry);
//     rotationController.forward();
//   }
//
//   void closeDropdown() {
//     isOpen = false;
//     if (widget.onOpen != null) {
//       widget.onOpen!(isOpen);
//     }
//     this._overlayEntry.remove();
//     rotationController.reverse();
//   }
//
//   OverlayEntry _createOverlayEntry() {
//     return OverlayEntry(
//       builder: (BuildContext context) => DropdownBody(
//         key: dropdownBodyChild,
//         inputKey: inputKey,
//         onChange: widget.onChange,
//         dropdownList: widget.dropdownList,
//         dropdownItemReverse: widget.dropdownItemReverse,
//         isTriangle: widget.isTriangle,
//         resultWidth: widget.resultWidth,
//         resultHeight: widget.resultHeight,
//         dropdownWidth: widget.dropdownWidth,
//         dropdownHeight: widget.dropdownHeight,
//         dropdownItemHeight: widget.dropdownItemHeight,
//         resultAlign: widget.resultAlign,
//         dropdownAlign: widget.dropdownAlign,
//         triangleAlign: widget.triangleAlign,
//         dropdownItemAlign: widget.dropdownItemAlign,
//         dropdownItemPadding: widget.dropdownItemPadding,
//         dropdownPadding: widget.dropdownPadding,
//         selectedItemPadding: widget.selectedItemPadding,
//         resultBD: widget.resultBD,
//         dropdownBD: widget.dropdownBD,
//         selectedItemBD: widget.selectedItemBD,
//         selectedItemTS: widget.selectedItemTS,
//         unselectedItemTS: widget.unselectedItemTS,
//         dropdownItemGap: widget.dropdownItemGap,
//         dropdownItemTopGap: widget.dropdownItemTopGap,
//         dropdownItemBottomGap: widget.dropdownItemBottomGap,
//         gap: widget.gap,
//         labelIconGap: widget.labelIconGap,
//         triangleWidth: widget.triangleWidth,
//         triangleHeight: widget.triangleHeight,
//         triangleLeft: widget.triangleLeft,
//         isResultLabel: widget.isResultLabel,
//         closeDropdown: () {
//           closeDropdown();
//         },
//         getSelectedItem: (selectedItem) async {
//           sizeController = AnimationController(
//             vsync: this,
//             duration: au.isAnimation(
//                 status: widget.isAnimation,
//                 duration: Duration(milliseconds: 150)),
//           );
//           textWidth = CurvedAnimation(
//             parent: sizeController,
//             curve: Curves.fastOutSlowIn,
//           );
//           setState(() {
//             this.selectedItem = selectedItem;
//           });
//           await sizeController.forward();
//         },
//         selectedItem: selectedItem,
//         isAnimation: widget.isAnimation,
//         dropdownItemMainAxis: widget.dropdownItemMainAxis,
//         bodyContext: context,
//         isDropdownLabel: widget.isDropdownLabel,
//       ),
//     );
//   }
//
//   @override
//   void initState() {
//     rotationController = AnimationController(
//         duration: au.isAnimation(
//             status: widget.isAnimation, duration: Duration(milliseconds: 150)),
//         vsync: this);
//     sizeController = AnimationController(
//         vsync: this,
//         duration: au.isAnimation(
//             status: widget.isAnimation, duration: Duration(milliseconds: 150)));
//     textWidth = CurvedAnimation(
//       parent: sizeController,
//       curve: Curves.fastOutSlowIn,
//     );
//     // placeholder 셋팅
//     setDefaultValue();
//     super.initState();
//   }
//
//   void setDefaultValue() {
//     setState(() {
//       sizeController = AnimationController(
//         vsync: this,
//         duration: au.isAnimation(status: false),
//       );
//       textWidth = CurvedAnimation(
//         parent: sizeController,
//         curve: Curves.fastOutSlowIn,
//       );
//       this.selectedItem = widget.defaultValue;
//       sizeController.forward();
//     });
//   }
//
//   RotationTransition rotationIcon() {
//     return RotationTransition(
//         turns: Tween(begin: 0.0, end: widget.resultIconRotationValue).animate(
//             CurvedAnimation(parent: rotationController, curve: Curves.easeIn)),
//         child: widget.resultIcon);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         if (isOpen) {
//           await dropdownBodyChild.currentState!.animationReverse();
//           closeDropdown();
//           return Future.value(false);
//         } else {
//           return Future.value(true);
//         }
//       },
//       child: GestureDetector(
//         onTap: () {
//           openDropdown();
//         },
//         child: Stack(
//           children: [
//             Container(
//               key: inputKey,
//               width: widget.resultWidth,
//               height: widget.resultHeight,
//               padding: widget.resultPadding,
//               decoration: widget.resultBD,
//               child: Align(
//                 alignment: widget.resultAlign,
//                 child: widget.isResultIconLabel
//                     ? Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   verticalDirection: VerticalDirection.down,
//                   children: [
//                     Expanded(
//                       child: SizeTransition(
//                         sizeFactor: textWidth,
//                         axisAlignment: -1,
//                         child: Row(
//                           mainAxisAlignment: widget.resultMainAxis,
//                           children: [
//                             if (widget.isResultLabel)
//                               Flexible(
//                                 child: Container(
//                                   child: Text(
//                                     selectedItem['label'] ??
//                                         widget.placeholder,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: selectedItem['label'] != null
//                                         ? widget.resultTS
//                                         : widget.placeholderTS,
//                                   ),
//                                 ),
//                               ),
//                             if (widget.isResultLabel)
//                               SizedBox(
//                                 width: widget.labelIconGap,
//                               ),
//                             if (selectedItem['icon'] != null)
//                               selectedItem['icon'] as Widget,
//                           ].isReverse(widget.dropdownItemReverse),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: widget.resultIconLeftGap,
//                     ),
//                     widget.resultIconRotation
//                         ? rotationIcon()
//                         : widget.resultIcon
//                   ].isReverse(widget.resultReverse),
//                 )
//                     : rotationIcon(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// //Copy this CustomPainter code to the Bottom of the File
// class DropdownArrow extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Path path_0 = Path();
//     path_0.moveTo(size.width * 0.4178592, size.height * 0.7748810);
//     path_0.cubicTo(
//         size.width * 0.4404533,
//         size.height * 0.7974752,
//         size.width * 0.4702912,
//         size.height * 0.8087602,
//         size.width * 0.5001371,
//         size.height * 0.8087602);
//     path_0.cubicTo(
//         size.width * 0.5299831,
//         size.height * 0.8087602,
//         size.width * 0.5598290,
//         size.height * 0.7974752,
//         size.width * 0.5824151,
//         size.height * 0.7748810);
//     path_0.lineTo(size.width * 0.9639590, size.height * 0.3933371);
//     path_0.cubicTo(
//         size.width * 1.008325,
//         size.height * 0.3489715,
//         size.width * 1.013173,
//         size.height * 0.2755667,
//         size.width * 0.9704122,
//         size.height * 0.2295878);
//     path_0.cubicTo(
//         size.width * 0.9252400,
//         size.height * 0.1803824,
//         size.width * 0.8486085,
//         size.height * 0.1787691,
//         size.width * 0.8018311,
//         size.height * 0.2255546);
//     path_0.lineTo(size.width * 0.5566105, size.height * 0.4699685);
//     path_0.cubicTo(
//         size.width * 0.5251593,
//         size.height * 0.5014278,
//         size.width * 0.4743325,
//         size.height * 0.5014278,
//         size.width * 0.4428733,
//         size.height * 0.4699685);
//     path_0.lineTo(size.width * 0.1984593, size.height * 0.2255546);
//     path_0.cubicTo(
//         size.width * 0.1516657,
//         size.height * 0.1787691,
//         size.width * 0.07503428,
//         size.height * 0.1795757,
//         size.width * 0.02987013,
//         size.height * 0.2295878);
//     path_0.cubicTo(
//         size.width * -0.01288215,
//         size.height * 0.2755667,
//         size.width * -0.008848915,
//         size.height * 0.3489715,
//         size.width * 0.03632330,
//         size.height * 0.3933371);
//     path_0.lineTo(size.width * 0.4178592, size.height * 0.7748810);
//     path_0.close();
//
//     Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
//     paint_0_fill.color = Colors.grey.withOpacity(0.7);
//     canvas.drawPath(path_0, paint_0_fill);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
