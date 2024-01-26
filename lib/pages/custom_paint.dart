import 'package:flutter/material.dart';

class CustomPaintPage extends StatefulWidget {
  const CustomPaintPage({Key? key}) : super(key: key);


  @override
  _CustomPaintPageState createState() => _CustomPaintPageState();
}

class _CustomPaintPageState extends State<CustomPaintPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Custom Paint'),
      ),
      body: Center(
        child: CustomPaint(
          painter: MyPainter(),
        ),
      ),
    );
  }
}
class MyPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    var center = size/2;
    var paint = Paint()..color = Colors.yellow;

    canvas.drawCircle(Offset(center.width, center.height), 10.0, paint);
    }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }

}