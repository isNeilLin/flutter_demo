import 'package:flutter/material.dart';
import 'package:flutter_study/models/message.dart';

class MessageListItem extends StatelessWidget {
  final Message message;

  MessageListItem(this.message);

  @override
  Widget build(BuildContext context){
    return new Card(
      elevation: 0.0,
      child: new Row(
        children: <Widget>[
          new Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0
              ),
              child: new CircleAvatar(
                  radius: 30.0,
                  backgroundImage: new NetworkImage(message.avator)
              )
          ),
          new Column(
            children: <Widget>[
              new Container(
                  child: new Text(
                      message.name,
                      style: new TextStyle(fontSize: 15.0),
                  ),
                  margin: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 5.0
                  ),
              ),
              new Container(
                child: new Text(
                    message.company + ' | ' + message.position,
                    style: new TextStyle(
                        fontSize: 13.0,
                        color: Colors.grey
                    ),
                ),
                margin: const EdgeInsets.symmetric(vertical: 5.0),
              ),
              new Container(
                child: new Text(
                    message.msg,
                    style: new TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey
                    ),
                ),
                margin: const EdgeInsets.only(
                  top: 5.0,
                  bottom: 5.0
                ),
              )
            ],
          )
        ],
      )
    );
  }
}