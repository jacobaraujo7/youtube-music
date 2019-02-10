import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:musicyoutube/src/home/PlayerWidget.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget>
    with SingleTickerProviderStateMixin {
  Widget _appBar() {
    return Container(
      height: 80,
      child: AppBar(
        centerTitle: false,
        title: Text(
          "Music",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: Stack(
          alignment: Alignment.centerRight,
          children: <Widget>[
            Container(
              width: 20,
              height: 10,
              color: Colors.white,
            ),
            Icon(
              FontAwesomeIcons.youtube,
              color: Colors.red,
              size: 30,
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () {},
          ),
          Container(
            child: CircleAvatar(
              child: const Text(
                'J',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.blue,
            ),
            width: 32.0,
            height: 32.0,
            padding: const EdgeInsets.all(2.0), // borde width
            decoration: BoxDecoration(
              color: Colors.red, // border color
              shape: BoxShape.circle,
            ),
          ),
          Container(
            width: 15,
          )
        ],
      ),
    );
  }

  AnimationController controller;
  Animation<double> animBottom;
  Animation<double> animOpacity;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 500));
    animBottom = Tween<double>(begin: 80.0, end: 0.0).animate(controller);
    animOpacity = Tween<double>(begin: 1.0, end: 0.0).animate(controller);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          BodyHomeWidget(),
          Align(
            alignment: Alignment.topCenter,
            child: _appBar(),
          ),

          //animação do player

          AnimatedBuilder(
            animation: animOpacity,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black,
            ),
            builder: (BuildContext context, Widget child) {
              return IgnorePointer(
                              child: Opacity(
                  opacity: animOpacity.value,
                  child: child,),
              );
            },
          ),

          PlayerWidget(controller: controller),

          //fim da animação do player

          Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedBuilder(
                animation: animBottom,
                builder: (BuildContext context, Widget child) {
                  return Transform.translate(
                    offset: Offset(0.0, animBottom.value),
                    child: BottomNavigationBar(
                      fixedColor: Colors.white,
                      items: <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                            icon: Icon(Icons.home), title: Text("Home")),
                        BottomNavigationBarItem(
                            icon: Icon(FontAwesomeIcons.hotjar),
                            title: Text("Hotlist")),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.library_music),
                            title: Text("Biblioteca")),
                      ],
                    ),
                  );
                },
              )),
        ],
      ),
    );
  }
}

class BodyHomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 90, left: 10, bottom: 10),
            child: Text("Lançamento",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Container(
            height: 250,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                CardLow(),
                CardLow(
                  url: "https://i.ytimg.com/vi/IOuUZJ0sy2I/maxresdefault.jpg",
                  title: "Problema Sério",
                  subtitle: "Single - McTic",
                ),
                CardLow(
                  url:
                      "http://www.mkmusic.com.br/wp-content/uploads/2015/11/CAPA-DELINO.jpg",
                  title: "Delino Marçal",
                  subtitle: "Album - Nada Além...",
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("OUVIR NOVAMENTE", style: TextStyle(fontSize: 11)),
                Text(
                  "Música para ouvir de noite",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
          ),
          Container(
            height: 250,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                CardHigh(
                  url: "https://i.ytimg.com/vi/4N2iMmHcHys/maxresdefault.jpg",
                  title: "MC WM - Fuleragem (KondZilla)",
                  subtitle: "Canal KondZilla",
                ),
                CardHigh(
                  url: "https://i.ytimg.com/vi/q6Lw6k7k9Rk/maxresdefault.jpg",
                  title:
                      "Corpo Sensual (feat. Mateus Carrilho) (Videoclipe Oficial)",
                  subtitle: "Pabllo Vittar",
                ),
              ],
            ),
          ),

          Container(height: 200,),

        ],
      ),
    );
  }
}

class CardLow extends StatelessWidget {
  final String url;
  final String title;
  final String subtitle;

  const CardLow({
    Key key,
    this.url =
        "https://bemsertanejo.net/wp-content/uploads/2019/02/CD-Gabriel-Diniz-%C3%80-Vontade-2019.jpg",
    this.title = "A Vontade",
    this.subtitle = "Album * Gabriel Diniz",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 170,
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 170,
            width: 170,
            child: Image.network(
              url,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 4,
          ),
          Text(title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
          Text(subtitle, style: TextStyle(fontSize: 11)),
        ],
      ),
    );
  }
}

class CardHigh extends StatelessWidget {
  final String url;
  final String title;
  final String subtitle;

  const CardHigh({
    Key key,
    this.url =
        "https://bemsertanejo.net/wp-content/uploads/2019/02/CD-Gabriel-Diniz-%C3%80-Vontade-2019.jpg",
    this.title = "A Vontade",
    this.subtitle = "Album * Gabriel Diniz",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 300,
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 170,
            width: 300,
            child: Image.network(
              url,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 4,
          ),
          Text(title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
          Text(subtitle, style: TextStyle(fontSize: 11)),
        ],
      ),
    );
  }
}
