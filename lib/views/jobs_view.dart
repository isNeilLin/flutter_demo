import 'package:flutter/material.dart';
import 'package:flutter_study/models/job.dart';
import 'package:flutter_study/components/job_list_item.dart';

class JobTab extends StatefulWidget {
  @override
  JobList createState()=> new JobList();
}

class JobList extends State<JobTab> {
  List<Job> _jobs = [];

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
        title: new Text('Android',style: new TextStyle(color: Colors.white))
      ),
      body: new ListView.builder(
        itemCount: _jobs.length,
        itemBuilder: buildJobItem,
      ),
    );
  }

  Widget buildJobItem(BuildContext context, int index){
    Job job = _jobs[index];
    return new GestureDetector(
      onTap: (){
        showDialog(context: context,
          child: new AlertDialog(
            content: new Text('See u soon', 
              style: new TextStyle(fontSize: 20.0),
            ),
          )
        );
      },
      child: new JobListItem(job),
    );
  }

  void getList(){
    setState((){
      _jobs = Job.fromJson("""
        {
            "list": [
              {
                "name": "架构师（Android）",
                "cname": "蚂蚁金服",
                "size": "B轮",
                "salary": "25k-45k",
                "username": "Claire",
                "title": "HR"
              },
              {
                "name": "资深Android架构师",
                "cname": "今日头条",
                "size": "D轮",
                "salary": "40k-60k",
                "username": "Kimi",
                "title": "HRBP"
              }
            ]
          }
      """);
    });
  }
}