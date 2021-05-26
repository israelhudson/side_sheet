library side_sheet;

import 'package:flutter/material.dart';

class SheetSide {
  final Widget body;
  final bool rightSide;

  SheetSide({
    required this.body,
    this.rightSide = true,
  });

  void show({required BuildContext? context}) async {
    final sheet = await showGeneralDialog(
      barrierLabel: "Sheet Horizontal",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.3),
      transitionDuration: Duration(milliseconds: 300),
      context: context!,
      pageBuilder: (context, animation1, animation2) {
        return Align(
          alignment:
              (this.rightSide ? Alignment.centerRight : Alignment.centerLeft),
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
              Tween(begin: Offset((this.rightSide ? 1 : -1), 0), end: Offset(0, 0))
                  .animate(animation1),
          child: child,
        );
      },
    );
  }
}
