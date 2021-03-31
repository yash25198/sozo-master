import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class loginpage extends StatefulWidget {
  @override
  _MyState createState() => _MyState();
}

class _MyState extends State<loginpage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  String _UserName = '';
  String _Password ='';

String validator(String svalue){
   if (svalue.trim().isEmpty) {
     return "empty";
   }
   return svalue;
 }
  Future<void> _createUserWithMail() async{
    try{
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _UserName, password: _Password);
    } on FirebaseAuthException catch(e){
      print("error : $e");
    }
    catch(e){
      print("error : $e");
    }
  }
  Future<void> _loginUserWithMail() async{
    try{
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _UserName, password: _Password);
    } on FirebaseAuthException catch(e){
      print("error : $e");
    }
    catch(e){
      print("error : $e");
    }
  }

  Future<void> _createUser() async{
    try{
      UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
    } on FirebaseAuthException catch(e){
      print("error : $e");
    }
    catch(e){
      print("error : $e");
    }
  }

/* Future<void> _createActUser() async{

    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.verifyPhoneNumber(
      phoneNumber: '+44 7123 123 456',
        verificationCompleted: (PhoneAuthCredential credential) async {
          // ANDROID ONLY!

          // Sign the user in (or link) with the auto-generated credential
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            print('The provided phone number is not valid.');
          };
          codeSent: (String verificationId, int resendToken) async {
            // Update the UI - wait for the user to enter the SMS code
            String smsCode = 'xxxx';

            // Create a PhoneAuthCredential with the code
            PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);

            // Sign the user in (or link) with the credential
            await auth.signInWithCredential(phoneAuthCredential);
          },
          timeout: const Duration(seconds: 60),
    codeAutoRetrievalTimeout: (String verificationId) {
    // Auto-resolution timed out...
    },
    );
      //codeAutoRetrievalTimeout: (String verificationId) {},

  }}*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: true,
        body: SafeArea(
      child:





                 Center(
                   child: SingleChildScrollView(
                      child: Container(

                        child: Column(

                            children: [



                              SizedBox(
                                child: Text("SOZO",
                                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.redAccent, fontSize: 65,),
                                ),
                              ),
                              Container(
                                height: 250.0,
                                width: 250.0,
                                padding: EdgeInsets.only(top: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(200),
                                ),
                                child: Center(
                                  child: Image(
                                      image:AssetImage ('assets/sos.png'),
                                    height: 240,
                                    width : 240,
                                  ),

                                ),
                              ),
                            Container(
                                margin: EdgeInsets.all(20),
                                child: TextField(
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'EmailID',
                                  ),
                                  onChanged: (text) {
                                    setState(() {
                                      _UserName = validator(text);
                                      //print(UserName);
                                      //you can access nameController in its scope to get
                                      // the value of text entered as shown below
                                      //UserName = nameController.text;
                                    });
                                  },
                                  onSubmitted: (text){
                                    _UserName = text;
                            }
                                )),
                              Container(
                                  margin: EdgeInsets.fromLTRB(20,0,20,20),
                                  child: TextField(
                                    controller: passController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Password',
                                    ),

                                   /* TextFormField(
                                      obscureText: true,
                                      decoration: const InputDecoration(
                                        labelText: 'Password',
                                      ),*/



                                    onChanged: (text) {
                                      setState(() {
                                        _Password = validator(text);

                                        //print(UserName);
                                        //you can access nameController in its scope to get
                                        // the value of text entered as shown below
                                        //UserName = nameController.text;
                                      });
                                    },
                                    onSubmitted: (text){
                                      _Password = text;
                                    },
                                  )),

                            Center(
                                child:
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 150,
                                          decoration: BoxDecoration(
                                              color: Colors.redAccent, borderRadius: BorderRadius.circular(20)),
                                          child: FlatButton(
                                            onPressed:(){
                                              _loginUserWithMail();
                                            },

                                            child: Text(
                                              'Login',
                                              style: TextStyle(color: Colors.white, fontSize: 15),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          height: 40,
                                          width: 150,
                                          decoration: BoxDecoration(
                                              color: Colors.redAccent, borderRadius: BorderRadius.circular(20)),
                                          child: FlatButton(
                                            onPressed:(){
                                              _createUserWithMail();
                                            },

                                            child: Text(
                                              'Sign Up',
                                              style: TextStyle(color: Colors.white, fontSize: 15),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),



                                ),
                              Container(
                                height: 20,
                                width: 20,
                                child: Center(child: Text("or")),
                              ),
                              Center(
                                child:
                                Container(
                                  height: 40,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      color: Colors.redAccent, borderRadius: BorderRadius.circular(20)),
                                  child: FlatButton(
                                    onPressed: _createUser,

                                    child: Text(
                                      'Login Anonymously',
                                      style: TextStyle(color: Colors.white, fontSize: 15),
                                    ),
                                  ),
                                ),



                              ),

                          ],
                ),
                      ),
                    ),
                 ),
                  ),






    );
  }
}
