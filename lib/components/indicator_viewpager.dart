import 'dart:math';
import 'package:flutter/material.dart';

class IndicatorViewPager extends StatefulWidget {
  final List<Widget> _pages;
  IndicatorViewPager(this._pages);

  @override
  IndicatorViewPagerState createState()=> new IndicatorViewPagerState();
}

class IndicatorViewPagerState extends State<IndicatorViewPager> {
  final _controller = new PageController();

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new PageView.builder(
              controller: _controller,
              physics: new AlwaysScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index){
                return widget._pages[index%widget._pages.length];
              },
          ),
          new Positioned(
              bottom: 0.0,
              right: 0.0,
              child: new Container(
                padding: const EdgeInsets.all(15.0),
                child: new DotsIndicator(
                  controller: _controller,
                  itemCount: widget._pages.length,
                  onPageSelected: (int page){
                    _controller.animateToPage(
                        page,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease
                    );
                  },
                ),
              )
          )
        ],
      ),
    );
  }
}

class DotsIndicator extends AnimatedWidget {
  final PageController controller;
  final int itemCount;
  final Color color;
  final ValueChanged<int> onPageSelected;

  DotsIndicator({
    this.controller,
    this.itemCount,
    this.onPageSelected,
    this.color: Colors.white
  }):super(listenable: controller);

  Widget _buildDot(int index){
    double selectedness = Curves.ease.transform(
      max(0.0, 1.0-((controller.page ?? controller.initialPage)-index).abs())
    );
    double zoom = 1.0 + 1.0 * selectedness;
    return new Container(
      width: 15.0,
      child: new Material(
        color: color,
        type: MaterialType.circle,
        child: new Container(
          width: 5.0 * zoom,
          height: 5.0 * zoom,
          child: new InkWell(
            onTap: ()=>onPageSelected(index),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return new Row(
      children: new List.generate(itemCount, _buildDot)
    );
  }
}