import 'package:flutter/material.dart';
import 'package:flutter_study/models/company.dart';
import 'package:flutter_study/components/company_item_info.dart';
import 'package:flutter_study/components/indicator_viewpager.dart';

class CompanyDetail extends StatefulWidget {
  final Company _company;

  CompanyDetail(this._company);

  @override
  CompanyDetailState createState()=> new CompanyDetailState();
}

class CompanyDetailState extends State<CompanyDetail> with TickerProviderStateMixin {
  List<Tab> _tabs;
  List<Widget> _imagePages;
  List<String> _urls = [
    'https://img.bosszhipin.com/beijin/mcs/chatphoto/20170725/861159df793857d6cb984b52db4d4c9c.jpg',
    'https://img2.bosszhipin.com/mcs/chatphoto/20151215/a79ac724c2da2a66575dab35384d2d75532b24d64bc38c29402b4a6629fcefd6_s.jpg',
    'https://img.bosszhipin.com/beijin/mcs/chatphoto/20180207/c15c2fc01c7407b98faf4002e682676b.jpg'
  ];
  TabController _controller;
  Widget _companyTabContent;
  VoidCallback onChanged;
  int _currentIndex = 0;

  @override
  initState(){
    super.initState();

    // init imagePages
    if(_urls.isNotEmpty){
      _imagePages = <Widget>[];
      _urls.forEach((String url){
        _imagePages.add(
          new Container(
            color: Colors.black.withAlpha(900),
            child: new ConstrainedBox(
                constraints: const BoxConstraints.expand(),
                child: new Image.network(
                  url,
                  fit: BoxFit.cover,
                  height: 256.0,
                ),
            ),
          )
        );
      });
    }
    // init tabs
    _tabs = [
      new Tab(text: '公司概况',),
      new Tab(text: '热招职位',)
    ];
    _companyTabContent = new CompanyInc(widget._company);
    _controller = new TabController(length: _tabs.length, vsync: this);
    onChanged = (){
      setState((){
        if(_currentIndex==0){
          _companyTabContent = new CompanyInc(widget._company);
        }else{
          _companyTabContent = new CompanyHot(widget._company);
        }
        _currentIndex = _controller.index;
      });
    };

    _controller.addListener(onChanged);
  }

  @override
  dispose(){
    _controller.removeListener(onChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      backgroundColor: new Color.fromRGBO(242, 242, 245, 1.0),
      body: new Stack(
        children: <Widget>[
          new SingleChildScrollView(
            child: new Column(
              children: <Widget>[
                new SizedBox.fromSize(
                  size: const Size.fromHeight(256.0),
                  child: new IndicatorViewPager(_imagePages),
                ),
                new Container(
                  color: Colors.white,
                  child: new Column(
                    children: <Widget>[
                      new CompanyItemInfo(widget._company),
                      new Divider(),
                      new TabBar(
                          indicatorWeight: 3.0,
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelStyle: new TextStyle(fontSize: 16.0),
                          labelColor: Colors.black,
                          controller: _controller,
                          tabs: _tabs,
                          indicatorColor: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
                _companyTabContent
              ],
            ),
          ),
          new Positioned(
              left: 10.0,
              top: 10.0,
              child: new BackButton(color: Colors.white,)
          )
        ],
      )
    );
  }
}

class CompanyHot extends StatelessWidget {
  final Company company;
  CompanyHot(this.company);
  @override
  Widget build(BuildContext context){
    return new Padding(
        padding: const EdgeInsets.all(10.0),
        child: new Column(
          children: <Widget>[
            new Text('热招职位', style: new TextStyle(fontSize: 15.0),),
            new Text(company.hot, style: new TextStyle(fontSize: 13.0,color: Colors.blueGrey),)
          ],
        ),
    );
  }
}

class CompanyInc extends StatelessWidget {
  final Company _company;
  CompanyInc(this._company);
  @override
  Widget build(BuildContext context){
    return new Padding(
        padding: const EdgeInsets.all(25.0),
        child: new Column(
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              child: new Text('公司介绍',style: new TextStyle(fontSize: 15.0),),
            ),
            new Text(_company.inc,style: new TextStyle(fontSize: 13.0,color: Colors.black))
          ],
        ),
    );
  }
}
