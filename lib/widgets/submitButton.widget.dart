import 'package:app_distribuida2/theme/colors.theme.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final String _text;
  final Function _onPressed;
  final bool showProgress;

  SubmitButton(this._text, this._onPressed, {this.showProgress = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.maxFinite,
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: RaisedButton(
        highlightColor: ColorTheme.buttonsClick,
        color: ColorTheme.buttonsColor,
        splashColor: ColorTheme.buttonsClick,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(5),
        ),
        child: showProgress
            ? _progressCircle()
            : Text(
                _text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
        onPressed: showProgress? null : _onPressed,
      ),
    );
  }

  // Indicador de progresso em formato de circulo
  _progressCircle() {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      ),
    );
  }
}
