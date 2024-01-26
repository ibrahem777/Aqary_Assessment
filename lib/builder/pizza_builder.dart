import 'package:flutter/cupertino.dart';

class ShapBuilder {
  String? _text;
  double? _radius;
  Color? _color;
  List<IconData>? _icons;

  ShapBuilder(this._radius);

  String? get text => _text;
  set text(String? newtext) {
    _text = newtext;
  }

  double? get raduis => _radius;
  set raduis(double? newRaduis) {
    _radius = newRaduis;
  }

  Color? get color => _color;
  set color(Color? newcolor) {
    _color = newcolor;
  }
  List<IconData>? get icons => _icons;
  set icons(List<IconData>? newIcons) {
    _icons = newIcons;
  }


  Shape build() {
    return Shape(this);
  }
}

class Shape {
  String? _text;
  double? _raduis;
  Color? _color;
  List<IconData>? _icons;

  Shape(ShapBuilder builder) {
    _text = builder.text;
    _raduis = builder.raduis;
    _icons = builder.icons;
    _color=builder._color;
  }

  String? get text => _text;
  double? get raduis => _raduis;
  Color? get color => _color;
  List<IconData>? get icons => _icons;
  int get iconsCount => _icons?.length??0;


  @override
  String toString() {
    return " Raduis = $_raduis\"  text = $_text color = $_color Icons Count $iconsCount";
  }
}