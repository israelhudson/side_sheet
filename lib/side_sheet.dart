library side_sheet;

import 'package:flutter/material.dart';

class SheetSide {
  final Widget body;
  final BuildContext context;

  SheetSide.right({
    required this.body,
    required this.context
  }){
    showSheetSide(rightSide: true);
  }

  SheetSide.left({
    required this.body,
    required this.context
  }){
    showSheetSide(rightSide: false);
  }

  void showSheetSide({required rightSide}) {
    showGeneralDialog(
      barrierLabel: "Sheet Horizontal",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.3),
      transitionDuration: Duration(milliseconds: 300),
      context: this.context,
      pageBuilder: (context, animation1, animation2) {
        return Align(
          alignment:
          (rightSide ? Alignment.centerRight : Alignment.centerLeft),
          child: Material(
            elevation: 15,
            color: Colors.transparent,
            child: Container(
                color: Colors.white,
                height: double.infinity,
                width: MediaQuery.of(context).size.width / 1.4,
                child: body),
          ),
        );
      },
      transitionBuilder: (context, animation1, animation2, child) {
        return SlideTransition(
          position:
          Tween(begin: Offset((rightSide ? 1 : -1), 0), end: Offset(0, 0))
              .animate(animation1),
          child: child,
        );
      },
    );
  }
}
