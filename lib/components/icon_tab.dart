import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';

class IconTab extends StatelessWidget {
  final String icon;
  final String text;
  
  IconTab({
    Key key,
    this.icon,
    this.text
  }): assert(text != null || icon != null),
      super(key:key);
  
  Widget _buildText(){
    return new Text(text,softWrap: false,overflow: TextOverflow.fade);
  }

  @override
  Widget build(BuildContext context){
    assert(debugCheckHasMaterial(context));
    
    Widget label = new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Container(
          child: new Image(
           height: 30.0,
           width: 30.0,
           image: new AssetImage(icon), 
          ),
        ),
        _buildText()
      ],
    );

    return new SizedBox(
      height: 53.0,
      child: new Center(
        child: label,
        widthFactor: 1.0,
      ),
    );
  }
}