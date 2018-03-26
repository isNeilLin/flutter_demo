import 'package:flutter/material.dart';
import 'package:flutter_study/models/company.dart';
import 'package:flutter_study/components/company_item_info.dart';

class CompanyListItem extends StatelessWidget {
  final Company company;
  CompanyListItem(this.company);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
      child: new SizedBox(
        child: new Card(
          elevation: 0.0,
          child: new Column(
            children: <Widget>[
              new CompanyItemInfo(company),
              new Divider(),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(
                        top: 5.0, left: 15.0, bottom: 15.0),
                    child: new Text(
                      "热招：" + company.hot + " 等" + company.count + "个职位",
                      style: new TextStyle(
                        fontSize: 13.0,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  new Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        new Padding(
                          padding: const EdgeInsets.only(bottom: 8.0,right:10.0),
                          child: const Icon(
                            Icons.keyboard_arrow_left,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
