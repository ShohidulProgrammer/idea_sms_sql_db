/*
 * rflutter_alert
 * Created by Ratel
 * https://ratel.com.tr
 *
 * Copyright (c) 2018 Ratel, LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'alert_style.dart';
import 'animation_transition.dart';

/// Main class to create alerts.
///
/// You must call the "show()" method to view the alert class you have defined.
class MyAlert {
  final BuildContext context;
  final AlertType type;
  final AlertStyle style;
  final Image image;
  final String title;
  final String desc;
  final Widget content;
  final List<DialogButton> buttons;
//  final Function closeFunction;

  /// Alert constructor
  ///
  /// [context], [title] are required.
  MyAlert({
    @required this.context,
    this.type,
    this.style = const AlertStyle(),
    this.image,
    @required this.title,
    this.desc,
    this.content,
    this.buttons,
//    this.closeFunction,
  });

  /// Displays defined alert window
  Future<bool> show() async {
    return await showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return _buildDialog();
      },

//      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: kAlertStyle.overlayColor,
      transitionDuration: kAlertStyle.animationDuration,
      transitionBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) =>
          _showAnimation(animation, secondaryAnimation, child),
    );
  }

// Will be added in next version.
  // void dismiss() {
  //   Navigator.pop(context);
  // }

  // Alert dialog content widget
  Widget _buildDialog() {
    return Center(
      child: ConstrainedBox(
        constraints: style.constraints ??
            BoxConstraints.expand(
                width: double.infinity, height: double.infinity),
        child: Center(
          child: SingleChildScrollView(
            child: AlertDialog(
              backgroundColor: style.backgroundColor ??
                  Theme.of(context).dialogBackgroundColor,
              shape: style.alertBorder ?? _defaultShape(),
              titlePadding: EdgeInsets.all(0.0),
              title: Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              title,
                              style: style.titleStyle,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: desc == null ? 5 : 10,
                            ),
                            desc == null
                                ? Container()
                                : Text(
                                    desc,
                                    style: style.descStyle,
                                    textAlign: TextAlign.center,
                                  ),
                            content == null ? Container() : content,
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              contentPadding: style.buttonAreaPadding,
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _getButtons(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Returns alert default border style
  ShapeBorder _defaultShape() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
      side: BorderSide(
        color: Colors.blueGrey,
      ),
    );
  }

  // Returns defined buttons. Default: Cancel Button
  List<Widget> _getButtons() {
    List<Widget> expandedButtons = [];
    if (buttons != null) {
      buttons.forEach(
        (button) {
          var buttonWidget = Padding(
            padding: const EdgeInsets.only(left: 2, right: 2),
            child: button,
          );
          if (button.width != null && buttons.length == 1) {
            expandedButtons.add(buttonWidget);
          } else {
            expandedButtons.add(Expanded(
              child: buttonWidget,
            ));
          }
        },
      );
    } else {
      expandedButtons.add(
        Expanded(
          child: DialogButton(
            child: Text(
              "CANCEL",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      );
    }

    return expandedButtons;
  }

// Shows alert with selected animation
  _showAnimation(animation, secondaryAnimation, child) {
    return AnimationTransition.grow(animation, secondaryAnimation, child);
  }
}
