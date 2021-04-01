import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class signUpPage extends StatefulWidget {
  @override
  _MyState createState() => _MyState();
}

class _MyState extends State<signUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController bloodTypeController = TextEditingController();
  TextEditingController allergiesController = TextEditingController();
  TextEditingController contact1Controller = TextEditingController();
  TextEditingController contact2Controller = TextEditingController();
  TextEditingController contact3Controller = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  String _UserName = '';
  String _Password ='';
  String _Allergies='';
  String _BloodType ='';
  String  _Contact1='';
  String  _Contact2='';
  String  _Contact3='';
  String _Email='';
  String _Gender='';
  String initValue="Select your Birth Date";
  bool isDateSelected= false;
  DateTime birthDate; // instance of DateTime
  String birthDateInString;


  String validator(String svalue){
    if (svalue.trim().isEmpty) {
      return "";
    }
    return svalue;
  }
  Future<void> _createUserWithMail() async{
    try{
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _Email, password: _Password);
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
                      style: TextStyle(fontWeight: FontWeight.bold,color: Colors.redAccent, fontSize: 45,),
                    ),
                  ),
                  Container(
                    height: 150.0,
                    width: 150.0,
                    padding: EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                    ),
                    child: Center(
                      child: Image(
                        image:AssetImage ('assets/sos.png'),
                        height: 140,
                        width : 140,
                      ),

                    ),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(20,20,20,0),
                      child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Name',
                          ),
                          onChanged: (text) {
                            setState(() {
                              _UserName = validator(text);

                            });
                          },
                          onSubmitted: (text){
                            _UserName = text;
                          }
                      )),
                  Container(
                      margin: EdgeInsets.all(20),
                      child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'EmailID',
                          ),
                          onChanged: (text) {
                            setState(() {
                              _Email = validator(text);

                            });
                          },
                          onSubmitted: (text){
                            _Email = text;
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





                        onChanged: (text) {
                          setState(() {
                            _Password = validator(text);


                          });
                        },
                        onSubmitted: (text){
                          _Password = text;
                        },
                      )),
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.fromLTRB(20,0,20,20),
                          height: 60,
                          width: 160,
                          child: TextField(
                              controller: dateController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Date of Birth',
                              ),
                              onTap: ()async{
                                final datePick= await showDatePicker(
                                    context: context,
                                    initialDate: new DateTime.now(),
                                    firstDate: new DateTime(1900),
                                    lastDate: new DateTime(2100),
                                    builder: (BuildContext context, Widget child) {
                                      return Theme(
                                        data: ThemeData.light().copyWith(
                                          colorScheme: ColorScheme.light().copyWith(
                                            primary: Colors.redAccent,
                                          ),
                                        ),
                                        child: child,
                                      );
                                    }
                                );
                                if(datePick!=null && datePick!=birthDate){
                                  setState(() {
                                    birthDate=datePick;
                                    isDateSelected=true;
                                    birthDateInString = "${birthDate.month}/${birthDate.day}/${birthDate.year}";
                                    dateController.text=birthDateInString;
                                  });
                                }
                              }
                          )),
                      Container(
                          margin: EdgeInsets.fromLTRB(0,0,20,20),
                          // margin: EdgeInsets.only(left: 20,bottom: 20),
                          height: 60,
                          width: 160,
                          child: TextField(
                            controller: genderController,

                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Gender',
                            ),





                            onChanged: (text) {
                              setState(() {
                                _Gender = validator(text);


                              });
                            },
                            onSubmitted: (text){
                              _Gender = text;
                            },
                          )),
                    ],
                  ),

                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.fromLTRB(20,0,20,20),
                         // margin: EdgeInsets.only(left: 20,bottom: 20),
                          height: 60,
                          width: 160,
                          child: TextField(
                            controller: bloodTypeController,

                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Blood Group',
                            ),





                            onChanged: (text) {
                              setState(() {
                                _BloodType = validator(text);


                              });
                            },
                            onSubmitted: (text){
                              _BloodType = text;
                            },
                          )),

                  Container(
                      margin: EdgeInsets.fromLTRB(0,0,20,20),
                      // margin: EdgeInsets.only(left: 20,bottom: 20),
                      height: 60,
                      width: 160,
                      child: TextField(
                        controller: allergiesController,

                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Allergies(if any)',
                        ),





                        onChanged: (text) {
                          setState(() {
                            _Allergies = validator(text);


                          });
                        },
                        onSubmitted: (text){
                          _Allergies = text;
                        },
                      )),



                    ],
                  ),
                  Container(

                    child: Center(child: Text("Enter 3 Emergency Contacts",
                      style: TextStyle( fontSize: 15),),
                  ),),
                  Container(
                      margin: EdgeInsets.fromLTRB(20,20,20,20),
                      // margin: EdgeInsets.only(left: 20,bottom: 20),

                      child: TextField(
                        controller: contact1Controller,

                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Contact 1',
                        ),





                        onChanged: (text) {
                          setState(() {
                            _Contact1 = validator(text);


                          });
                        },
                        onSubmitted: (text){
                          _Contact1 = text;
                        },
                      )),
                  Container(
                      margin: EdgeInsets.fromLTRB(20,0,20,20),
                      // margin: EdgeInsets.only(left: 20,bottom: 20),

                      child: TextField(
                        controller: contact2Controller,

                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Contact 2',
                        ),





                        onChanged: (text) {
                          setState(() {
                            _Contact2 = validator(text);


                          });
                        },
                        onSubmitted: (text){
                          _Contact2 = text;
                        },
                      )),
                  Container(
                      margin: EdgeInsets.fromLTRB(20,0,20,20),
                      // margin: EdgeInsets.only(left: 20,bottom: 20),

                      child: TextField(
                        controller: contact3Controller,

                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Contact 3',
                        ),





                        onChanged: (text) {
                          setState(() {
                            _Contact3 = validator(text);


                          });
                        },
                        onSubmitted: (text){
                          _Contact3 = text;
                        },
                      )),





                  Center(
                    child:
                    Container(
                      height: 40,
                      width: 200,
                      margin: EdgeInsets.fromLTRB(0,0,0,20),
                      decoration: BoxDecoration(
                          color: Colors.redAccent, borderRadius: BorderRadius.circular(20)),
                      child: FlatButton(
                        onPressed: (){
                          _createUserWithMail;
                        Navigator.pop(context,'/signUpPage');},

                        child: Text(
                          'Sign Up',
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
