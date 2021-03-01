import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Animation delayedCardAnimation,
      cardAnimation,
      infoAnimation,
      fabButtonAnimation;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);

    delayedCardAnimation = Tween(begin: 0.0, end: -0.05).animate(
        CurvedAnimation(
            curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
            parent: animationController));

    cardAnimation = Tween(begin: 0.0, end: -0.025).animate(CurvedAnimation(
        curve: Curves.fastOutSlowIn, parent: animationController));

    infoAnimation = Tween(begin: 0.0, end: 0.025).animate(CurvedAnimation(
        curve: Interval(0.7, 1.0, curve: Curves.fastOutSlowIn),
        parent: animationController));

    fabButtonAnimation = Tween(begin: 1.0, end: -0.0008).animate(
        CurvedAnimation(
            curve: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn),
            parent: animationController));
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    animationController.forward();
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          appBar: new AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.black,
            ),
            title: new Text(
              'Near by',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: FlutterLogo(size: 40.0),
              )
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // TODO Container 1
              Container(
                padding: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
                child: Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    // TODO Last Card
                    Positioned(
                      left: 20.0,
                      child: Container(
                        transform: Matrix4.translationValues(0.0,
                            delayedCardAnimation.value * deviceHeight, 0.0),
                        width: 260.0,
                        height: 400.0,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                    // TODO Middle Card
                    Positioned(
                      left: 10.0,
                      child: Container(
                        transform: Matrix4.translationValues(
                            0.0, cardAnimation.value * deviceHeight, 0.0),
                        width: 280.0,
                        height: 400.0,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                    // TODO Image
                    Container(
                      width: 300.0,
                      height: 400.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                            image: AssetImage('images/girl.jpg'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    // TODO Name Card
                    Positioned(
                      top: 320.0,
                      left: 15.0,
                      child: Container(
                        transform: Matrix4.translationValues(
                            0.0, infoAnimation.value * deviceHeight, 0.0),
                        width: 270.0,
                        height: 90.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 1.0,
                              color: Colors.black12,
                              spreadRadius: 2.0,
                            )
                          ],
                        ),
                        child: Container(
                          padding: EdgeInsets.all(7.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text('Nancy',
                                      style: TextStyle(fontSize: 20.0)),
                                  SizedBox(width: 4.0),
                                  Image.asset(
                                    'images/simbolo.png',
                                    height: 20.0,
                                    width: 20.0,
                                  ),
                                  SizedBox(width: 110.0),
                                  Text(
                                    '5.8km',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 9.0),
                              Row(
                                children: <Widget>[
                                  Text(
                                    'Fate is wonderful.',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.grey,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // TODO Container 2
              Container(
                transform: Matrix4.translationValues(
                    0.0, fabButtonAnimation.value * deviceHeight, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FloatingActionButton(
                      onPressed: () {},
                      elevation: 0.0,
                      child: Icon(Icons.close, color: Colors.black),
                      backgroundColor: Colors.white,
                    ),
                    Container(
                      height: 70.0,
                      width: 70.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35.0),
                        // border: Border.all(
                        //   color: Colors.transparent,
                        //   style: BorderStyle.solid,
                        //   width: 2.0,
                        // ),
                      ),
                      child: Center(
                        child: IconButton(
                          icon: Image.asset('images/chatBubble.png'),
                          color: Colors.lightBlueAccent[300],
                          onPressed: () {},
                        ),
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: () {},
                      elevation: 0.0,
                      child: Icon(Icons.favorite, color: Colors.pink),
                      backgroundColor: Colors.white,
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
