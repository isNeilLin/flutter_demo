import 'package:flutter/material.dart';
import 'package:flutter_study/models/job.dart';

class JobListItem extends StatelessWidget {
  final Job job;

  JobListItem(this.job);
  
  @override
  Widget build(BuildContext context){
    return new Padding(
      padding: const EdgeInsets.only(
        top: 3.0,
        left: 5.0,
        right: 5.0,
        bottom: 5.0
      ),
      child: new SizedBox(
        child: new Card(
          elevation: 0.0,
          child: new Column(
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      left: 10.0,
                      bottom: 5.0
                    ),
                    child: new Text(job.name),
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(
                      top: 5.0,
                      right: 10.0
                    ),
                    child: new Text(job.salary,
                      textAlign: TextAlign.right,
                      style: new TextStyle(color: Colors.red),
                    ),
                  )
                ],
              ),
              new Row(
                children: <Widget>[
                  new Container(
                    child: new Text(
                      job.cname+' '+job.size,
                      style: new TextStyle(
                        fontSize: 15.0,
                        color: Colors.grey,
                      ),
                    ),
                    margin: const EdgeInsets.only(
                      top: 5.0,
                      left: 10.0,
                      bottom: 5.0
                    )
                  )
                ],
              ),
              new Divider(),
              new Row(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(
                      top: 5.0,
                      left: 10.0,
                      bottom: 15.0,
                      right: 5.0
                    ),
                    child: new Text(
                      job.username+ ' | '+job.title,
                      style: new TextStyle(color: new Color.fromRGBO(0,215,198,1.0))
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