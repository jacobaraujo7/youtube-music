import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlayerWidget extends StatefulWidget {

  final AnimationController controller;

  const PlayerWidget({Key key, this.controller}) : super(key: key);


  @override
  _PlayerWidgetState createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {

  Animation<double> screenDown;
  Animation<double> thumbLessheight;
  Animation<double> thumbLesswidth;
  Animation<double> controllOpacity;


  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Size size = MediaQuery.of(context).size;
    screenDown = Tween<double>(begin: 0.0, end: size.height * 0.81).animate(widget.controller);
    screenDown.addListener((){
      setState(() {
      });
    });
    thumbLessheight = Tween<double>(begin: size.height * 0.60, end: size.height * 0.1).animate(widget.controller);
    
    thumbLesswidth = Tween<double>(begin: size.width, end: size.width * 0.2).animate(widget.controller);
    controllOpacity = Tween<double>(begin: 1.0, end: 0.0).animate(CurvedAnimation(
      parent: widget.controller,
      curve: Interval(0.4, 0.8),
    ));
    
    
  }

  _onTap(){

    if(widget.controller.value > 0.0){
      widget.controller.reverse();
    } else {
      widget.controller.forward();
    }

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Transform.translate(
              offset: Offset(0.0, screenDown.value),

          child: Material(
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: _onTap,
              onVerticalDragUpdate: (details) {
                          widget.controller.value += details.primaryDelta / (size.height * 0.81);
                        },
                        onVerticalDragEnd: (details) {
                          if (widget.controller.value > 0.5) {
                            widget.controller.forward();
                          } else {
                            widget.controller.reverse();
                          }
                        },
                          child: Container(
                  height: thumbLessheight.value,
                  width: size.width,
                  color: Colors.black,
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        width: thumbLesswidth.value,
                        child: Image.network(
                            "https://i.ytimg.com/vi/4N2iMmHcHys/maxresdefault.jpg"),
                      ),
                      Container(
                        color: Colors.grey[900],
                        padding: EdgeInsets.only(left: 10),
                        width: size.width * 0.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("MC WM - Fuleragem (KondZilla)",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 11)),
                            Text("Canal KondZilla",
                                style: TextStyle(fontSize: 11)),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.grey[900],
                        padding: EdgeInsets.only(left: 10),
                        child: IconButton(icon: Icon(Icons.play_arrow), onPressed: () {},),
                      ),
                      Container(
                        color: Colors.grey[900],
                        padding: EdgeInsets.only(left: 10),
                        child: IconButton(icon: Icon(Icons.close), onPressed: () {},),
                      ),
                    ],
                  )),
            ),
            widget.controller.value == 1.0 ? Container(color: Colors.white.withOpacity(0.7), height: 2,) : Container(),
            Expanded(
              child: Container(
                color: Colors.grey[900],
                child: Opacity(
                  opacity: controllOpacity.value,
                                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 10,
                      ),
                      Container(
                        width: size.width,
                        child: Row(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.info_outline),
                              onPressed: () {},
                            ),
                            Spacer(),
                            Column(
                              children: <Widget>[
                                Text("MC WM - Fuleragem (KondZilla)",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                                Text("Canal KondZilla",
                                    style: TextStyle(fontSize: 11)),
                              ],
                            ),
                            Spacer(),
                            IconButton(
                              icon: Icon(Icons.more_vert),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 20,
                      ),
                      Container(
                        width: size.width,
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 15,
                            ),
                            Text("0:20", style: TextStyle(fontSize: 11)),
                            Expanded(
                              child: Slider(
                                activeColor: Colors.white,
                                inactiveColor: Colors.white24,
                                onChanged: (double value) {},
                                value: 15,
                                min: 0,
                                max: 100,
                              ),
                            ),
                            Text("04:58", style: TextStyle(fontSize: 11)),
                            Container(
                              width: 15,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 20,
                      ),
                      Container(
                        width: size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Transform(
                                transform: Matrix4.identity()..rotateY(3),
                                alignment: Alignment.center,
                                child: IconButton(
                                  icon: Icon(FontAwesomeIcons.thumbsDown),
                                  onPressed: () {},
                                )),
                            Container(
                              width: 12,
                            ),
                            IconButton(
                              icon: Icon(Icons.skip_previous),
                              onPressed: () {},
                            ),
                            Container(
                              width: 12,
                            ),
                            Transform.scale(
                              scale: 2,
                              child: IconButton(
                                icon: Icon(Icons.play_arrow),
                                onPressed: () {},
                              ),
                            ),
                            Container(
                              width: 12,
                            ),
                            IconButton(
                              icon: Icon(Icons.skip_next),
                              onPressed: () {},
                            ),
                            Container(
                              width: 12,
                            ),
                            IconButton(
                              icon: Icon(Icons.thumb_up),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.black,
              width: size.width,
              height: 40,
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.queue_music),
                    onPressed: () {},
                  ),
                  Text(
                    "Próxima: made out de DotEXE",
                    style: TextStyle(fontSize: 11),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.keyboard_arrow_up),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
