library side_sheet;

import 'package:flutter/material.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}

class SheetHorizontal {
  final Widget title;
  final Widget body;
  final Widget? actionIcon;
  final Function? onTapAction;

  SheetHorizontal(
      {required this.title,
        required this.body,
        this.actionIcon,
        this.onTapAction});

  void show({
    required BuildContext? context,
    bool rightSide = true,
  }) async {
    final sheet = await showGeneralDialog(
      barrierLabel: "Menu Horizontal",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 300),
      context: context!,
      pageBuilder: (context, animation1, animation2) {
        return Align(
          alignment: (rightSide ? Alignment.centerRight : Alignment.centerLeft),
          child: Material(
            color: Colors.transparent,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
              child: Container(
                color: Colors.white,
                height: double.infinity,
                width: MediaQuery.of(context).size.width / 1.27,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Stack(
                          children: [
                            Align(alignment: Alignment.topLeft, child: title),
                            Align(
                              alignment: Alignment.topRight,
                              child: actionIcon ??
                                  ClipOval(
                                    child: Material(
                                      color: Colors.grey[350], // button color
                                      child: InkWell(
                                        splashColor: Colors.grey,
                                        onTap: () {
                                          if (onTapAction != null) {
                                            onTapAction!();
                                          } else {
                                            Navigator.pop(context, 'back');
                                          }
                                        }, // inkwell color
                                        child: Container(
                                            width: 28,
                                            height: 28,
                                            child: Icon(Icons.close)),
                                      ),
                                    ),
                                  ),
                            ),
                          ],
                        ),
                      ),
                      body,
                    ],
                  ),
                ),
              ),
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

    print("result " + sheet.toString());
  }
}