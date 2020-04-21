import 'package:app_distribuida2/utils/navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

alertConfirm(BuildContext context, String title, Function callback, [IconData icon = Icons.info]) {
  showDialog(
      barrierDismissible: false,
      context: context,
      child: new CupertinoAlertDialog(
        title: new Column(
          children: <Widget>[
            new Icon(
              icon,
              color: Colors.red,
            ),
          ],
        ),
        content: new Text(title),
        actions: <Widget>[
          new FlatButton(onPressed: callback, child: new Text("Sim")),
          new FlatButton(
              onPressed: () {
                popPage(context);
              },
              child: new Text("Não"))
        ],
      ));
}
