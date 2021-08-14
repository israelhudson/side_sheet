import 'package:flutter/material.dart';

class SideSheet {

  static Future<String> left({required body, required context}) async {
    dynamic data =
        await _showSheetSide(body: body, rightSide: false, context: context);
    if (data == null) return '';

    return data;
  }

  static Future<String> right({required body, required context}) async {
    dynamic data =
        await _showSheetSide(body: body, rightSide: true, context: context);
    if (data == null) return '';

    return data;
  }

  static _showSheetSide({
    required Widget body,
    required bool rightSide,
    required BuildContext context,
    String barrierLabel: "Sheet Horizontal",
    bool barrierDismissible: true,
    Color barrierColor = const Color(0xFF66000000),
    Duration transitionDuration = const Duration(milliseconds: 300),
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
                width: MediaQuery.of(context).size.width / 2.4,
                child: Column(
                  children: [
                    body,
                    IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          Navigator.pop(context, 'ssss');
                          //Navigator.pop(context);
                        })
                  ],
                )),
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
