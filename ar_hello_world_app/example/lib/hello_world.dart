import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:arkit_plugin/arkit_plugin.dart';

class HelloWorld extends StatefulWidget {
  @override
  _HelloWorldState createState() => _HelloWorldState();
}

class _HelloWorldState extends State<HelloWorld> {
  ARKitController _arKitController;

  @override
  void dispose() {
    super.dispose();
    _arKitController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ARKitSceneView(
          onARKitViewCreated: createARView,
        ),
      ),
    );
  }

  void createARView(ARKitController arKitController) {
    this._arKitController = arKitController;
    this._arKitController.add(createText());
  }

  createText() {
    final text = ARKitText(text: "Hello World", extrusionDepth: 1, materials: [
      ARKitMaterial(
          diffuse: ARKitMaterialProperty(
        color: Colors.blue,
      ))
    ]);

    return ARKitNode(
        geometry: text,
        position: vector.Vector3(-0.3, 0.3, -1),
        scale: vector.Vector3(0.02, 0.02, 0.02)
        );
  }
}
