import 'package:flutter/material.dart';

class SideSheet {
  /// Open End side sheet
  /// ```dart
  ///onPressed: () => SideSheet.end(body: Text("Body"), context: context)
  /// ```
  static Future<dynamic> end(
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

      /// Use transitionDuration to set the duration of the animation when the side sheet is opened or closed
      Duration transitionDuration = const Duration(milliseconds: 300)}) async {
    dynamic data = await _showSheetSide(
        body: body,
        width: width,
        fromStart: false,
        context: context,
        barrierLabel: barrierLabel,
        barrierDismissible: barrierDismissible,
        barrierColor: barrierColor,
        transitionDuration: transitionDuration);
    if (data == null) return '';

    return data;
  }

  /// Open Start side sheet
  /// ```dart
  ///onPressed: () => SideSheet.start(body: Text("Body"), context: context)
  /// ```
  static Future<dynamic> start(
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

      /// Use transitionDuration to set the duration of the animation when the side sheet is opened or closed
      Duration transitionDuration = const Duration(milliseconds: 300)}) async {
    dynamic data = await _showSheetSide(
        body: body,
        width: width,
        fromStart: true,
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
    required bool fromStart,
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
          alignment: (fromStart
              ? AlignmentDirectional.centerStart
              : AlignmentDirectional.centerEnd),
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
        final isRTL = Directionality.of(context) == TextDirection.rtl;
        final animationBeginningSide =
            _determineAnimationBeginningSide(isRTL, fromStart);
        return SlideTransition(
          position:
              Tween(begin: Offset(animationBeginningSide, 0), end: Offset(0, 0))
                  .animate(animation1),
          child: child,
        );
      },
    );
  }

  static double _determineAnimationBeginningSide(
      bool isRTL, bool sheetComesFromStart) {
    if (isRTL && sheetComesFromStart || !isRTL && !sheetComesFromStart) {
      return 1;
    }
    return -1;
  }
}
