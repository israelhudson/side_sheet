import 'package:flutter/material.dart';

class SideSheet {
  /// Open Left side sheet
  /// ```dart
  ///onPressed: () => SideSheet.left(body: Text("Body"), context: context)
  /// ```
  static Future<dynamic> left(
      {
      ///Use this to pass any widget you want to display in the side sheet
      required Widget body,
      required BuildContext context,

      /// Use this to set the width of the side sheet
      double? width,
      String barrierLabel: "Side Sheet",

      /// Use barrierDismissible to dismiss the side sheet by tapping outside of it
      bool barrierDismissible: true,

      /// Use barrierColor to set the outside color of the side sheet when opened
      Color barrierColor = const Color(0xFF66000000),

      /// Use barrierBorderRadius to set the outside border radius of the side sheet when opened
      double barrierBorderRadius = 0,

      /// Use transitionDuration to set the duration of the animation when the side sheet is opened or closed
      Duration transitionDuration = const Duration(milliseconds: 300)}) async {
    dynamic data = await _showSheetSide(
      body: body,
      width: width,
      rightSide: false,
      context: context,
      barrierLabel: barrierLabel,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      barrierBorderRadius: barrierBorderRadius,
      transitionDuration: transitionDuration,
    );
    if (data == null) return '';

    return data;
  }

  /// Open Right side sheet
  /// ```dart
  ///onPressed: () => SideSheet.right(body: Text("Body"), context: context)
  /// ```
  static Future<dynamic> right(
      {
      ///Use this to pass any widget you want to display in the side sheet
      required Widget body,
      required BuildContext context,

      /// Use this to set the width of the side sheet
      double? width,
      String barrierLabel: "Side Sheet",

      /// Use barrierDismissible to dismiss the side sheet by tapping outside of it
      bool barrierDismissible: true,

      /// Use barrierColor to set the outside color of the side sheet when opened
      Color barrierColor = const Color(0xFF66000000),

      /// Use barrierBorderRadius to set the outside border radius of the side sheet when opened
      double barrierBorderRadius = 0,

      /// Use transitionDuration to set the duration of the animation when the side sheet is opened or closed
      Duration transitionDuration = const Duration(milliseconds: 300)}) async {
    dynamic data = await _showSheetSide(
      body: body,
      width: width,
      rightSide: true,
      context: context,
      barrierLabel: barrierLabel,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      barrierBorderRadius: barrierBorderRadius,
      transitionDuration: transitionDuration,
    );
    if (data == null) return '';

    return data;
  }

  static _showSheetSide({
    required Widget body,
    required bool rightSide,
    double? width,
    required BuildContext context,
    required String barrierLabel,
    required bool barrierDismissible,
    required Color barrierColor,
    required double barrierBorderRadius,
    required Duration transitionDuration,
  }) {
    return showGeneralDialog(
      barrierLabel: barrierLabel,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      transitionDuration: transitionDuration,
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return Align(
          alignment: (rightSide ? Alignment.centerRight : Alignment.centerLeft),
          child: Material(
            elevation: 15,
            color: Colors.transparent,
            child: Container(
                color: Colors.white,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: rightSide
                        ? Radius.circular(barrierBorderRadius)
                        : Radius.zero,
                    bottomRight: rightSide
                        ? Radius.circular(barrierBorderRadius)
                        : Radius.zero,
                    topLeft: !rightSide
                        ? Radius.circular(barrierBorderRadius)
                        : Radius.zero,
                    bottomLeft: !rightSide
                        ? Radius.circular(barrierBorderRadius)
                        : Radius.zero,
                  ),
                ),
                height: double.infinity,
                width: width ?? MediaQuery.of(context).size.width / 1.4,
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
