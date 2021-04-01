//import 'dart:js';

//import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sozonew/ArticleList.dart';
import 'package:sozonew/Map.dart';
import 'package:sozonew/loginpage.dart';
import 'package:sozonew/signUpPage.dart';
import 'home_page.dart';
import 'user_profile.dart';


void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MaterialApp(

      initialRoute: '/land',
      debugShowCheckedModeBanner: false,
      routes: {
        '/land':(context)=>landingclass(),
        '/signUpPage':(context)=>signUpPage(),
        '/':(context)=>loginpage(),
        '/first':(context)=>Homepage(),
        '/second':(context)=>UserProfile(),
        //'/third':(context)=>ArticlePage(),
        '/third':(context)=>ArticleList(title: "Safety Tips"),
        '/map':(context)=>MapPage(),
      },

    ),
  );
}
class landingclass extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context,snapshot){
          if(snapshot.hasError){
            return Scaffold(
              body: Center(
                child:Text("Error :${snapshot.error}"),
              )
            );


          }
          if(snapshot.connectionState == ConnectionState.done){
            return StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),

                builder: (context,snapshot){
                if(snapshot.connectionState == ConnectionState.active){
                  User user = snapshot.data;
                  if(user == null){
                    return loginpage();

                  }

                  else{
                    return Homepage();

                  }}
                  return Scaffold(
                  body:Center(
                  child: Text("Checking Authentication...."),
                  )

                  );


                }

            );

          }
          return Scaffold(
            body:Center(
              child: Text("Connecting to the app...."),
            )

          );

        }
    );
  }
}

