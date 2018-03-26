import 'package:flutter/material.dart';

class MineTab extends StatelessWidget {

  final Map mine = {
    'name': 'Neil Lin',
    'avatar': 'https://img.bosszhipin.com/beijin/mcs/useravatar/20171211/4d147d8bb3e2a3478e20b50ad614f4d02062e3aec7ce2519b427d24a3f300d68_s.jpg',
    'inclination': '在职-考虑机会',
    'talked': '590',
    'communicated': '71',
    'waitInterview': '0'
  };

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      backgroundColor: new Color.fromRGBO(242, 242, 245, 1.0),
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            expandedHeight: 150.0,
            flexibleSpace: new FlexibleSpaceBar(
              background: new Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  const DecoratedBox(
                    decoration: const BoxDecoration(
                      gradient: const LinearGradient(
                        begin: const Alignment(0.0,-1.0),
                        end: const Alignment(0.0,-0.4),
                        colors: const <Color>[
                          const Color(0x00000000), const Color(0x00000000)
                        ]
                      )
                    ),
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Padding(
                        padding: const EdgeInsets.only(
                          top: 20.0,
                          left: 30.0,
                          right: 20.0,
                        ),
                        child: new CircleAvatar(
                          radius: 35.0,
                          backgroundImage: new NetworkImage(mine['avatar'])
                        )
                      ),
                      new Row(
                        children: <Widget>[
                          new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                child: new Text(mine['name'],
                                  style: new TextStyle(fontSize: 18.0,color: Colors.white),
                                ),
                              ),
                              new Text(mine['inclination'],style: new TextStyle(
                                fontSize: 12.0, color: Colors.white
                              ),)
                            ],
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          new SliverList(
            delegate: new SliverChildListDelegate(<Widget>[
              new Container(
                color: Colors.white,
                child: new Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      new _ContactItem(
                        onPressed: (){
                          _showDialog(context,'沟通过');
                        },
                        count: mine['talked'],
                        title: '沟通过'
                      ),
                      new _ContactItem(
                          onPressed: (){
                            _showDialog(context,'已沟通');
                          },
                          count: mine['communicated'],
                          title: '已沟通'
                      ),
                      new _ContactItem(
                          onPressed: (){
                            _showDialog(context,'待面试');
                          },
                          count: mine['waitInterview'],
                          title: '待面试'
                      )
                    ],
                  ),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }

  void _showDialog(BuildContext context,String title){
    showDialog(context: context, child: new AlertDialog(
      content: new Text(title,style: new TextStyle(fontSize: 20.0))
    ));
  }
}

class _ContactItem extends StatelessWidget {
  _ContactItem({Key key, this.count, this.title, this.onPressed})
      : super(key:key);

  final String count;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context){
    return new GestureDetector(
      onTap: onPressed,
      child: new Column(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: new Text(count, style: new TextStyle(fontSize: 22.0),),
          ),
          new Text(title)
        ],
      ),
    );
  }
}