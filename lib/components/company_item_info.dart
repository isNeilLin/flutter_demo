import 'package:flutter/material.dart';
import 'package:flutter_study/models/company.dart';

class CompanyItemInfo extends StatelessWidget {
  final Company company;
  CompanyItemInfo(this.company);
  @override
  Widget build(BuildContext context){
    return new Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Padding(
          padding: const EdgeInsets.only(
              top: 10.0, left: 15.0, right: 15.0),
          child: new Image.network(
            company.logo,
            width: 70.0,
            height: 70.0,
          ),
        ),
        new Expanded(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              new Container(
                child: new Text(
                  company.name,
                  style: new TextStyle(fontSize: 15.0),
                ),
                margin: const EdgeInsets.only(top: 10.0, bottom: 5.0),
              ),
              new Padding(
                padding: const EdgeInsets.only(
                    top: 5.0, bottom: 5.0, right: 5.0, left: 0.0),
                child: new Text(
                  company.location,
                  style: new TextStyle(
                      fontSize: 13.0, color: Colors.grey),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.only(
                    top: 5.0, bottom: 5.0, right: 5.0, left: 0.0),
                child: new Text(
                  company.type +
                      ' | ' +
                      company.size +
                      ' | ' +
                      company.employee,
                  style: new TextStyle(
                      fontSize: 13.0, color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}