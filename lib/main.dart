import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'FLUTTER AR'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ARKitSceneView(
        onARKitViewCreated: (controller) => arView(controller),
      ),
    );
  }
}

void arView(ARKitController controller) {
  final nodeAr = ARKitNode(
    geometry: ARKitSphere(materials: [
      ARKitMaterial(
        diffuse: ARKitMaterialProperty.image("images/image.jpg"),
        doubleSided: true,
      ),
    ], radius: 1),
    position: Vector3(0, 0, 0),
  );
  controller.add(nodeAr);
}
