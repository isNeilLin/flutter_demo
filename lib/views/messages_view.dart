import 'package:flutter/material.dart';
import 'package:flutter_study/models/message.dart';
import 'package:flutter_study/components/message_list_item.dart';

class MessageTab extends StatefulWidget {
  @override
  MessageList createState() => new MessageList();
}

class MessageList extends State<MessageTab> {
  List<Message> _messages = [];

  @override
  void initState(){
    super.initState();
    getList();
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      backgroundColor: new Color.fromRGBO(242, 242, 245, 1.0),
      appBar: new AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: new Text('消息',style: new TextStyle(color:Colors.white),),
      ),
      body: new ListView.builder(
        itemCount: _messages.length,
        itemBuilder: _buildItem,
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index){
    Message message = _messages[index];
    return new GestureDetector(
      onTap: (){
        print('tapped ${message.msg}');
      },
      child: new MessageListItem(message),
    );
  }

  void getList(){
    setState((){
      _messages = Message.fromJson("""
        {
            "list": [
              {
                "avatar": "https://img.bosszhipin.com/beijin/mcs/useravatar/20180301/17aefca1b3d0dd6c5f94409e4c1e42a2cfcd208495d565ef66e7dff9f98764da_s.jpg",
                "name": "小可爱",
                "company": "百度",
                "position": "HR",
                "msg": "你好"
              }
            ]
        }
      """);
    });
  }
}