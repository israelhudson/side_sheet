import 'dart:math';

import 'package:flutter/material.dart';

class SideSheet {

  /// Open Left or Right side sheet
  static Future<dynamic> show({
    required Widget body,
    required BuildContext context,
    bool rightSide = false,
    double? width = 300, // Valor padrão para width
    SideSheetWidthMode widthMode = SideSheetWidthMode.fixed,
    String barrierLabel = "Side Sheet",
    bool barrierDismissible = true,
    Color barrierColor = const Color(0xFF66000000),
    double sheetBorderRadius = 0,
    Color sheetColor = Colors.white,
    Duration transitionDuration = const Duration(milliseconds: 300),
    Curve animationCurve = Curves.easeInOut, // Curva de animação personalizada
    double elevation = 15.0, // Elevation personalizável
    // Callbacks para eventos de abrir e fechar
    VoidCallback? onOpen,
    Function(dynamic)? onClose, // Modificado para aceitar um parâmetro
  }) async {
    // Chama o callback onOpen se não for nulo
    if (onOpen != null) onOpen();

    dynamic data = await _showNewSheetSide(
      body: body,
      width: width,
      widthMode: widthMode,
      rightSide: rightSide,
      context: context,
      barrierLabel: barrierLabel,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      sheetBorderRadius: sheetBorderRadius,
      sheetColor: sheetColor,
      transitionDuration: transitionDuration,
      animationCurve: animationCurve,
      elevation: elevation,
    );

    // Chama o callback onClose se não for nulo
    if (onClose != null) onClose(data);

    if (data == null) return '';

    return data;
  }

  static Future<dynamic> _showNewSheetSide({
    required Widget body,
    double? width,
    required SideSheetWidthMode widthMode,
    required bool rightSide,
    required BuildContext context,
    String barrierLabel = "Side Sheet",
    bool barrierDismissible = true,
    Color barrierColor = const Color(0xFF66000000),
    double sheetBorderRadius = 0,
    Color sheetColor = Colors.white,
    Duration transitionDuration = const Duration(milliseconds: 300),
    Curve animationCurve = Curves.easeInOut,
    double elevation = 15.0,
  }) {
    final originalWidth = width ?? 300;
    final screenSizeWidth = MediaQuery.of(context).size.width;

    return showGeneralDialog(
      barrierLabel: barrierLabel,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      transitionDuration: transitionDuration,
      context: context,
      pageBuilder: (context, animation1, animation2) => LayoutBuilder(
        builder: (context, constraints) {
          var sheetWidth = originalWidth;
          if (widthMode == SideSheetWidthMode.flexible) {
            sheetWidth = max(originalWidth,
                constraints.maxWidth * (originalWidth / screenSizeWidth));
          }

          return Align(
            alignment: rightSide ? Alignment.centerRight : Alignment.centerLeft,
            child: Material(
              elevation: elevation,
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                topLeft: rightSide
                    ? Radius.circular(sheetBorderRadius)
                    : Radius.zero,
                bottomLeft: rightSide
                    ? Radius.circular(sheetBorderRadius)
                    : Radius.zero,
                topRight: !rightSide
                    ? Radius.circular(sheetBorderRadius)
                    : Radius.zero,
                bottomRight: !rightSide
                    ? Radius.circular(sheetBorderRadius)
                    : Radius.zero,
              ),
              child: Container(
                width: sheetWidth,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: sheetColor,
                  borderRadius: BorderRadius.only(
                    topLeft: rightSide
                        ? Radius.circular(sheetBorderRadius)
                        : Radius.zero,
                    bottomLeft: rightSide
                        ? Radius.circular(sheetBorderRadius)
                        : Radius.zero,
                    topRight: !rightSide
                        ? Radius.circular(sheetBorderRadius)
                        : Radius.zero,
                    bottomRight: !rightSide
                        ? Radius.circular(sheetBorderRadius)
                        : Radius.zero,
                  ),
                ),
                child: body,
              ),
            ),
          );
        },
      ),
      transitionBuilder: (context, animation1, animation2, child) {
        return SlideTransition(
          position: Tween(
            begin: Offset(rightSide ? 1 : -1, 0),
            end: Offset(0, 0),
          ).animate(CurvedAnimation(parent: animation1, curve: animationCurve)),
          child: child,
        );
      },
    );
  }

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
      String barrierLabel = "Side Sheet",

      /// Use barrierDismissible to dismiss the side sheet by tapping outside of it
      bool barrierDismissible = true,

      /// Use barrierColor to set the outside color of the side sheet when opened
      Color barrierColor = const Color(0xFF66000000),

      /// Use sheetBorderRadius to set the outside border radius of the side sheet when opened
      double sheetBorderRadius = 0,

      /// Use sheetColor to set the color of the side sheet when opened
      /// Default is white
      Color sheetColor = Colors.white,

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
      sheetBorderRadius: sheetBorderRadius,
      sheetColor: sheetColor,
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
      String barrierLabel = "Side Sheet",

      /// Use barrierDismissible to dismiss the side sheet by tapping outside of it
      bool barrierDismissible = true,

      /// Use barrierColor to set the outside color of the side sheet when opened
      Color barrierColor = const Color(0xFF66000000),

      /// Use sheetBorderRadius to set the outside border radius of the side sheet when opened
      double sheetBorderRadius = 0,

      /// Use sheetColor to set the color of the side sheet when opened
      /// Default is white
      Color sheetColor = Colors.white,

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
      sheetBorderRadius: sheetBorderRadius,
      sheetColor: sheetColor,
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
    required double sheetBorderRadius,
    required Color sheetColor,
    required Duration transitionDuration,
  }) {
    BorderRadius borderRadius = BorderRadius.only(
      topLeft: rightSide ? Radius.circular(sheetBorderRadius) : Radius.zero,
      bottomLeft: rightSide ? Radius.circular(sheetBorderRadius) : Radius.zero,
      topRight: !rightSide ? Radius.circular(sheetBorderRadius) : Radius.zero,
      bottomRight:
          !rightSide ? Radius.circular(sheetBorderRadius) : Radius.zero,
    );

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
            borderRadius: borderRadius,
            child: Container(
                decoration: BoxDecoration(
                    color: sheetColor, borderRadius: borderRadius),
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

enum SideSheetWidthMode {
  fixed,
  flexible,
}
