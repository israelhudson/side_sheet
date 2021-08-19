import 'package:flutter/material.dart';

class SideSheet {
  static Future<String> left(
      {required Widget body,
      required BuildContext context,
      String barrierLabel: "Side Sheet",
      bool barrierDismissible: true,
      Color barrierColor = const Color(0xFF66000000),
      Duration transitionDuration = const Duration(milliseconds: 300)}) async {
    dynamic data = await _showSheetSide(
        body: body,
        rightSide: false,
        context: context,
        barrierLabel: barrierLabel,
        barrierDismissible: barrierDismissible,
        barrierColor: barrierColor,
        transitionDuration: transitionDuration);
    if (data == null) return '';

    return data;
  }

  static Future<String> right(
      {required Widget body,
      required BuildContext context,
      String barrierLabel: "Side Sheet",
      bool barrierDismissible: true,
      Color barrierColor = const Color(0xFF66000000),
      Duration transitionDuration = const Duration(milliseconds: 300)}) async {
    dynamic data = await _showSheetSide(
        body: body,
        rightSide: true,
        context: context,
        barrierLabel: barrierLabel,
        barrierDismissible: barrierDismissible,
        barrierColor: barrierColor,
        transitionDuration: transitionDuration);
    if (data == null) return '';

    return data;
  }

  static _showSheetSide({
    required Widget body,
    required bool rightSide,
    required BuildContext context,
    required String barrierLabel,
    required bool barrierDismissible,
    required Color barrierColor,
    required Duration transitionDuration,
  }) {
    return showGeneralDialog(
      barrierLabel: barrierLabel,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      transitionDuration: transitionDuration,
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return SafeArea(
          child: Align(
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
