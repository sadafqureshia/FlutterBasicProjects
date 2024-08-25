import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  final String dayys = "sadafff";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Center(
        child: Container(
          child: Text("Hello $dayys here"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}