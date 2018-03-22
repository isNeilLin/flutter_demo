import 'package:flutter/material.dart';
import 'package:flutter_study/components/icon_tab.dart';
import 'package:flutter_study/views/companies_view.dart';
import 'package:flutter_study/views/jobs_view.dart';
import 'package:flutter_study/views/messages_view.dart';
import 'package:flutter_study/views/mine_view.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Boss直聘',
    theme: new ThemeData(
      primaryIconTheme: const IconThemeData(color: Colors.white),
      brightness: Brightness.light,
      primaryColor: new Color.fromRGBO(0, 215, 198, 1.0),
      accentColor: Colors.cyan[300],
    ),
    home: new BossApp()
  ));
}

class BossApp extends StatefulWidget {
  @override
  HomeState createState()=> new HomeState();
}

class HomeState extends State<BossApp> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  TabController _controller;
  VoidCallback onChanged;

  @override
  void initState(){
    super.initState();
    _controller = new TabController(initialIndex: _currentIndex,length: 4,vsync: this);
    onChanged = () {
      setState((){
        _currentIndex = _controller.index;
      });
    };
    _controller.addListener(onChanged);
  }

  @override
  void dispose(){
    _controller.removeListener(onChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body: new TabBarView(
        children: <Widget>[
          new JobTab(), new CompanyTab(), new MessageTab(), new MineTab()
        ],
        controller: _controller,
      ),
      bottomNavigationBar: new Material(
        color: Colors.white,
        child: new TabBar(
          controller: _controller,
          indicatorSize: TabBarIndicatorSize.label,
          labelStyle: new TextStyle(fontSize: 11.0),
          tabs: <IconTab>[
            new IconTab(
              icon: _currentIndex == 0 
                    ? "assets/images/ic_main_tab_company_pre.png"
                    : "assets/images/ic_main_tab_company_nor.png",
              text: "职位"
            ),
            new IconTab(
              icon: _currentIndex == 1
                    ? "assets/images/ic_main_tab_contacts_pre.png"
                    : "assets/images/ic_main_tab_contacts_nor.png",
              text: "公司"
            ),
            new IconTab(
              icon: _currentIndex == 2
                    ? "assets/images/ic_main_tab_find_pre.png"
                    : "assets/images/ic_main_tab_find_nor.png",
              text: "消息"
            ),
            new IconTab(
              icon: _currentIndex == 3
                    ? "assets/images/ic_main_tab_my_pre.png"
                    : "assets/images/ic_main_tab_my_nor.png",
              text: "我的"
            )
          ],
        ),
      ),
    );
  }
}