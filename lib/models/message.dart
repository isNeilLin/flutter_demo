import 'dart:convert';
import 'package:meta/meta.dart';

class Message {
  final String name;
  final String avator;
  final String position;
  final String company;
  final String msg;

  Message({
    @required this.name,
    @required this.avator,
    @required this.position,
    @required this.company,
    @required this.msg
  });

  static List<Message> fromJson(String json){
    return JSON.decode(json)['list']
            .map((obj)=>Message.fromMap(obj))
            .toList();
  }

  static Message fromMap(Map map){
    return new Message(
      name: map['name'],
      avator: map['avatar'],
      position: map['position'],
      company: map['company'],
      msg: map['msg']
    );
  }
}