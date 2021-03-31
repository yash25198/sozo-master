import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sozonew/model/ArticleModel.dart';
import 'package:sozonew/ArticlePage.dart';

class ArticleList extends StatefulWidget
{
  ArticleList({Key key, this.title}) : super(key:key);

  final String title;

  @override
  _ArticleListState createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList>
{
  List articles;

  @override
  void initState()
  {
    articles = getArticles();
    super.initState();
  }

  @override
  Widget build(BuildContext context)
  {
    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Colors.red,
      title: Text(widget.title),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.list),
          onPressed: (){},
        )
      ],
    );

    ListTile makeListTile(ArticleModel article) => ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: new BoxDecoration(
            border: new Border(
                right: new BorderSide(width: 1.0, color: Colors.white))),
        child: Icon(Icons.accessibility_new_sharp, color: Colors.white),
      ),
      title: Text(
        article.title,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),

      trailing:
      Icon(Icons.keyboard_arrow_right_rounded, color: Colors.white, size: 30.0),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticlePage(article: article)));
      },
    );

    Card makeCard(ArticleModel article) => Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.red),
        child: makeListTile(article),
      ),
    );

    final makeBody = Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: articles.length,
        itemBuilder: (BuildContext context, int index)
        {
          return makeCard(articles[index]);
        },
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: topAppBar,
      body: makeBody,

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
              IconButton(icon: Icon(Icons.map, size: 35.0),onPressed: (){},),
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