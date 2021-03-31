import 'package:sozonew/model/ArticleModel.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticlePage extends StatelessWidget {
  final ArticleModel article;

  ArticlePage({Key key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 120.0),
        Icon(
          Icons.accessibility_new_sharp,
          color: Colors.white,
          size: 40.0,
        ),
        Expanded(
            child: Container(
              width: 90.0,
              child: new Divider(color: Colors.white70),
            )),
        //SizedBox(height: 10.0),
        Expanded(
            flex: 10,
            child: Text(
              article.title,
              style: TextStyle(color: Colors.white, fontSize: 45.0, fontWeight: FontWeight.bold),
            )),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/staysafe.jpg"),
                fit: BoxFit.cover,
              ),
            )),

        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(
              234, 8, 8, 0.9019607843137255)),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 20.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );

    final bottomContentText = Text(
      article.content,
      style: TextStyle(fontSize: 18.0),
    );

    final readButton = Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
          onPressed: () => {launch(article.url)},
          color: Color.fromRGBO(239, 49, 49, 1.0),
          child:
          Text("Go to the link", style: TextStyle(color: Colors.white)),
        ));

    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[
            bottomContentText, readButton
          ],
        ),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              topContent, bottomContent
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.home,
                  size: 38.0,
                ),
                onPressed: (){
                  Navigator.pop(context,'/third');
                },
              ),
              IconButton(icon: Icon(Icons.map, size: 35.0),onPressed: (){Navigator.pushNamed(context, '/map');},),
              IconButton(icon: Icon(Icons.article, size: 35.0),onPressed: (){}),
              IconButton(icon: Icon(Icons.info_outline, size: 35.0),onPressed: (){Navigator.pop(context,'/third');
              Navigator.pushNamed(context,'/second');}),
            ],
          ),
        ),
      ),
    );
  }
}