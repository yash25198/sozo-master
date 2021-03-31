import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  onPressed: (){Navigator.pop(context,'/second');},
                ),
                IconButton(icon: Icon(Icons.map, size: 35.0),onPressed: (){Navigator.pushNamed(context, '/map');},),
                IconButton(icon: Icon(Icons.article, size: 35.0),onPressed: (){Navigator.pop(context,'/second');
                  Navigator.pushNamed(context,'/third');}),
                IconButton(icon: Icon(Icons.info_outline, size: 35.0),onPressed: (){}),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
                height: 200.0,
                /*decoration:BoxDecoration(
               border: Border(
                 bottom: BorderSide(width:1.0,color:Colors.black12),
               )
             ),*/
                child:Column(
                  children: <Widget>[
                    SizedBox(
                      height: 42.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children:<Widget>[Text('  Profile Data:'),
                          Icon(Icons.admin_panel_settings_rounded),]),
                        Row(children: <Widget>[Text('Edit:',),
                          Icon(Icons.edit,size: 20.0,),],)

                      ],),
                    SizedBox(height: 35.0,),
                    Icon(

                      Icons.article_rounded,size: 60.0,
                    ),
                    SizedBox(height:5.0,),
                    Text('Susan Simmons'),
                    Text('14 January 1982'),
                  ],
                )
            ),

            Column(
                children:<Widget>[
                  Row(children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 1.0),
                            bottom: BorderSide(width:1.0),
                            right: BorderSide(width: 1.0),
                          )
                      ),
                      height:140,
                      width:180,
                      child: Center(child: Text('Age:\n28 years'),),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 1.0),
                            bottom: BorderSide(width:1.0),
                          )
                      ),
                      height:140,
                      width:180,
                      child: Center(child: Text('Blood Type:\n0Rh+'),),
                    ),
                  ],),
                  Row(children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width:1.0),
                            right: BorderSide(width: 1.0),
                          )
                      ),
                      height:140,
                      width:180,
                      child: Center(child: Text('Height:\n185 cm'),),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width:1.0),
                          )
                      ),
                      height:140,
                      width:180,
                      child: Center(child: Text('Weight:\n85 kg'),),
                    ),
                  ],)
                ]
            ),
            SizedBox(height:5.0),
            Text('Allergies and reactions'),
            Text('Food:'),
            Column(
                children: <Widget>[
                  Row(children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 1.0),
                            bottom: BorderSide(width:1.0),
                            right: BorderSide(width: 1.0),
                          )
                      ),
                      width:150,
                      height:50,
                      child: Row(children: <Widget>[Icon(Icons.food_bank),Text('Grape'),],),
                    ),
                    Container(
                        width:210,
                        height:50,
                        decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(width:1.0),
                            )
                        ),
                        child:Center(child: Text('Blocked nose'))),
                  ],),
                  Row(children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width:1.0),
                            right: BorderSide(width: 1.0),
                          )
                      ),
                      width:150,
                      height:50,
                      child: Row(children: <Widget>[Icon(Icons.food_bank),Text('Orange'),],),
                    ),
                    Container(
                        width:210,
                        height:50,
                        decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(width:1.0),
                            )
                        ),
                        child:Center(child: Text('Watering eyes'))),
                  ],),
                  Row(children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width:1.0),
                            right: BorderSide(width: 1.0),
                          )
                      ),
                      width:150,
                      height:50,
                      child: Row(children: <Widget>[Icon(Icons.food_bank),Text('Pear'),],),
                    ),
                    Container(
                        width:210,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(width:1.0),
                              bottom: BorderSide(width:1.0),
                            )
                        ),
                        child:Center(child: Text('Rush'))),
                  ],),

                RaisedButton.icon(
                  icon: Icon(Icons.logout,
                      size: 30.0,
                  color: Colors.white,),
                  label : Text("Logout"),
                  textColor: Colors.white,
                  color: Colors.redAccent,
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pop(context,'/second');

                  },
                ),
              ]
            )
          ],
        )
    );
  }
}