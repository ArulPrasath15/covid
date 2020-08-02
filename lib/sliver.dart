import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Expanding AppBar Example',
      theme: new ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: new AnimatedScaffold(),
    );
  }
}

class AnimatedScaffold extends StatefulWidget {
  @override
  createState() => new AnimatedScaffoldState();
}

class AnimatedScaffoldState extends State<AnimatedScaffold>
    with SingleTickerProviderStateMixin {
  AnimatedScaffoldState() {
    controller = new AnimationController(
        duration: new Duration(milliseconds: 500), vsync: this);
    animation = new CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  AnimationController controller;
  Animation animation;
  bool expanded = false;

  _animateAppBar() {
    expanded ? controller.reverse() : controller.forward();
    expanded = !expanded;
  }

  Widget build(BuildContext context) {
    return new AnimatedScaffoldBottom(
        animation: animation, onPress: _animateAppBar);
  }
}

class AnimatedScaffoldBottom extends AnimatedWidget {
  AnimatedScaffoldBottom({Key key, Animation<double> animation, this.onPress})
      : super(key: key, listenable: animation);

  final Function onPress;
  static final _sizeTween = new Tween<double>(begin: 0.0, end: 300.0);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
          child: new Text(
        'Hello World!',
        style: Theme.of(context).textTheme.display1,
      )),
      appBar: new AppBar(
        title: const Text('Expanding AppBar Example'),
        actions: [
          new IconButton(
            icon: new Icon(Icons.expand_more),
            onPressed: onPress,
          ),
        ],
        bottom: new PreferredSize(
          preferredSize: new Size.fromHeight(_sizeTween.evaluate(listenable)),
          child: new Container(
            height: _sizeTween.evaluate(listenable),
            child: const Center(
              child: const FlutterLogo(size: 300.0),
            ),
          ),
        ),
      ),
    );
  }
}