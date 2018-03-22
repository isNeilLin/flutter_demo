import 'package:flutter/material.dart';

class MineTab extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      backgroundColor: new Color.fromRGBO(242, 242, 245, 1.0),
      appBar: new AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: new Text('我的', style: new TextStyle(color: Colors.white),),
      ),
      body: new Text('我的'),
    );
  }
}