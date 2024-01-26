import 'package:flutter/material.dart';

import '../builder/pizza_builder.dart';

class BuilderPattern extends StatefulWidget {
  const BuilderPattern({Key? key}) : super(key: key);

  @override
  _BuilderPatternState createState() => _BuilderPatternState();
}

class _BuilderPatternState extends State<BuilderPattern> {
  @override
  Widget build(BuildContext context) {
    List<Shape>items=[];
    var shapeBuilder = ShapBuilder(8);

    // Add some attributes to the builder.
    shapeBuilder.text = " first Item";
    shapeBuilder.color=Colors.blue;
    shapeBuilder.icons = [
      Icons.add,
    ];

    // Let's make a pizza!
    var firstShape = Shape(shapeBuilder);
    items.add(firstShape);
    shapeBuilder.text = "second Item";
    shapeBuilder.raduis = 100;
    shapeBuilder.color=Colors.yellow;

    shapeBuilder.icons =[
      Icons.add,
      Icons.home,

    ];

    var seconedShape = shapeBuilder.build();
    items.add(seconedShape);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Builder'),
      ),
      body: Column(
        children: [
...items.map((e) => Container(
  decoration: BoxDecoration(
    color: e.color,
    borderRadius: BorderRadius.circular(e.raduis??10)
  ),
  child: Column(crossAxisAlignment: CrossAxisAlignment.center,children: [
    Text('${e.text}'),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      ...e.icons!.map((e) => Icon(e))
    ],),
    SizedBox(height: 10,)

  ],),
))
          
        ],
      ),
    );
  }
}
