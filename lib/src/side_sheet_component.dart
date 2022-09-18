import 'package:flutter/material.dart';

enum SideSheetAlign {
  right,
  left
}

class SideSheet {
  /// Open Left or Right side sheet
  /// ```dart
  /// By Directionality
  ///onPressed: () => SideSheet.show(sideSheetAlign: Directionality.of(context) == TextDirection.rtl ? SideSheetAlign.left : SideSheetAlign.right, body: Text("Body"), context: context)
  // or right
  ///onPressed: () => SideSheet.show(sideSheetAlign: SideSheetAlign.right, body: Text("Body"), context: context)
  /// or left
  ///onPressed: () => SideSheet.show(sideSheetAlign: SideSheetAlign.left, body: Text("Body"), context: context)
  /// ```
  static Future<dynamic> show(
      {

      ///Use this to pass any widget you want to display in the side sheet
      required SideSheetAlign sideSheetAlign,
      required Widget body,
      required BuildContext context,

      /// Use this to set the width of the side sheet
      double? width,
      String barrierLabel: "Side Sheet",

      /// Use barrierDismissible to dismiss the side sheet by tapping outside of it
      bool barrierDismissible: true,

      /// Use barrierColor to set the outside color of the side sheet when opened
      Color barrierColor = const Color(0xFF66000000),

      /// Use transitionDuration to set the duration of the animation when the side sheet is opened or closed
      Duration transitionDuration = const Duration(milliseconds: 300)}) async {
    dynamic data = await _showSheetSide(
        body: body,
        width: width,
        rightSide: sideSheetAlign == SideSheetAlign.right ? true : false,
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
    double? width,
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
        return Align(
          alignment: (rightSide ? Alignment.centerRight : Alignment.centerLeft),
          child: Material(
            elevation: 15,
            color: Colors.transparent,
            child: Container(
                color: Colors.white,
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
