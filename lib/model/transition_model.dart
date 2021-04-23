import 'package:custom_transition_001/config/palette.dart';
import 'package:flutter/cupertino.dart';

class TransitionModel with ChangeNotifier {
  int _index = 0;
  get index => _index;
  set index(value) {
    _index = value;
    notifyListeners();
  }

  bool _isHafWay = false;
  get isHalfWay => _isHafWay;
  set isHalfWay(value) {
    _isHafWay = value;
    notifyListeners();
  }

  bool _isToggled = false;
  get isToggled => _isToggled;
  set isToggled(value) {
    _isToggled = value;
    notifyListeners();
  }

  Color _backGroundColor = Palette.palette[0];
  get backGroundColor => _backGroundColor;
  set backGroundColor(value) {
    _backGroundColor = value;
    notifyListeners();
  }

  Color _foreGroundColor = Palette.palette[1];
  get foreGroundColor => _foreGroundColor;
  set foreGroundColor(value) {
    _foreGroundColor = value;
    notifyListeners();
  }

  void swapColors() {
    if (_isToggled) {
      _backGroundColor = Palette.palette[1];
      _foreGroundColor = Palette.palette[0];
    } else {
      _backGroundColor = Palette.palette[0];
      _foreGroundColor = Palette.palette[1];
    }
    notifyListeners();
  }
}
