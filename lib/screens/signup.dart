import 'package:doc_verify/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import '../database_handler/DbHelper.dart';
import '../model/user_model.dart';
import '../util/gen_text_form_field.dart';
import '../util/helper.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _formKey = new GlobalKey<FormState>();

  //controllers
  final _conUserID = TextEditingController();
  final _conUserName = TextEditingController();
  final _conEmail = TextEditingController();
  final _conPassword = TextEditingController();
  final _conCPassword = TextEditingController();
  var dbHelper;

  @override
  void initState(){
    super.initState();
    dbHelper = DbHelper();
  }

  signUp() async {
    final form = _formKey.currentState;
    String uid = _conUserID.text;
    String uname = _conUserName.text;
    String email = _conEmail.text;
    String passwd = _conPassword.text;
    String cpasswd = _conCPassword.text;

    if (_formKey.currentState!.validate()){
      if (passwd != cpasswd){
        alertDialog(context, 'Password Mismatch');
      }else{
        _formKey.currentState?.save();
        UserModel uModel = UserModel(uid, uname, email, passwd);
        await dbHelper.saveData(uModel).then((userData){
          alertDialog(context, 'Successfully saved');
          Navigator.push(context, MaterialPageRoute(builder: (_)=>HomeScreen()));
        }).catchError((error){
          // print(error);
          alertDialog(context, 'Failed to save data');
        });

      }
    }
    // if (uid.isEmpty){
    //   Toast.show("Please enter User ID", duration: Toast.lengthLong, gravity:  Toast.bottom);
    // }else if(uname.isEmpty){
    //   Toast.show("Please enter User Name", duration: Toast.lengthLong, gravity:  Toast.bottom);
    // }else if(email.isEmpty){
    //   Toast.show("Please enter Email", duration: Toast.lengthLong, gravity:  Toast.bottom);
    // }else if(passwd.isEmpty){
    //   Toast.show("Please enter Password", duration: Toast.lengthLong, gravity:  Toast.bottom);
    // }else if(cpasswd.isEmpty){
    //   Toast.show("Please confirm Password", duration: Toast.lengthLong, gravity:  Toast.bottom);
    // }

  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF65B0B4),
        title: Text(
          'Sign Up',
          style: TextStyle(color: Colors.white),
        ),

      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50.0,),
                  Text(
                    "Create an account",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF65B0B4),
                      fontSize: 30.0,
                    ),
                  ),
                  SizedBox(height: 20.0,),

                  // GenTextFormField(
                  //   controller: _conUserID,
                  //   hintName: 'User id',
                  //   icon: Icons.person,
                  //   isObscureText: false,
                  //   inputType: TextInputType.text,
                  // ),

                  SizedBox(height: 5.0,),

                  GenTextFormField(
                    controller: _conUserName,
                    hintName: 'User Name',
                    icon: Icons.person_outline,
                    isObscureText: false,
                    inputType: TextInputType.name,
                  ),

                  SizedBox(height: 5.0,),

                  GenTextFormField(
                    controller: _conEmail,
                    hintName: 'Email',
                    icon: Icons.email,
                    isObscureText: false,
                    inputType: TextInputType.emailAddress,
                  ),

                  SizedBox(height: 5.0,),

                  GenTextFormField(
                    controller: _conPassword,
                    hintName: 'Password',
                    icon: Icons.lock,
                    isObscureText: true,
                    inputType: TextInputType.text,
                  ),

                  SizedBox(height: 5.0,),

                  GenTextFormField(
                    controller: _conCPassword,
                    hintName: ' Confirm Password',
                    icon: Icons.lock,
                    isObscureText: true,
                    inputType: TextInputType.text,
                  ),


                  // Container(
                  //   margin: EdgeInsets.only(top: 10.0),
                  //   child: TextFormField(
                  //     decoration: InputDecoration(
                  //       enabledBorder: OutlineInputBorder(
                  //           borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  //           borderSide: BorderSide(
                  //             color: Colors.transparent,
                  //           )
                  //       ),
                  //       focusedBorder: OutlineInputBorder(
                  //           borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  //           borderSide: BorderSide(
                  //             color: Colors.blue,
                  //           )
                  //       ),
                  //       prefixIcon: Icon(Icons.person),
                  //       hintText: 'User ID',
                  //       fillColor: Colors.grey[200],
                  //       filled: true,
                  //     ),
                  //   ),
                  // ),

                  // Container(
                  //   margin: EdgeInsets.only(top: 10.0),
                  //   child: TextFormField(
                  //     decoration: InputDecoration(
                  //       enabledBorder: OutlineInputBorder(
                  //           borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  //           borderSide: BorderSide(
                  //             color: Colors.transparent,
                  //           )
                  //       ),
                  //       focusedBorder: OutlineInputBorder(
                  //           borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  //           borderSide: BorderSide(
                  //             color: Colors.blue,
                  //           )
                  //       ),
                  //       prefixIcon: Icon(Icons.person_outline),
                  //       hintText: 'User Name',
                  //       fillColor: Colors.grey[200],
                  //       filled: true,
                  //     ),
                  //   ),
                  // ),

                  // Container(
                  //   margin: EdgeInsets.only(top: 10.0),
                  //   child: TextFormField(
                  //     decoration: InputDecoration(
                  //       enabledBorder: OutlineInputBorder(
                  //           borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  //           borderSide: BorderSide(
                  //             color: Colors.transparent,
                  //           )
                  //       ),
                  //       focusedBorder: OutlineInputBorder(
                  //           borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  //           borderSide: BorderSide(
                  //             color: Colors.blue,
                  //           )
                  //       ),
                  //       prefixIcon: Icon(Icons.email),
                  //       hintText: 'Email',
                  //       fillColor: Colors.grey[200],
                  //       filled: true,
                  //     ),
                  //   ),
                  // ),


                  // Container(
                  //   margin: EdgeInsets.only(top: 10.0),
                  //   child: TextFormField(
                  //     obscureText: true,
                  //     decoration: InputDecoration(
                  //       enabledBorder: OutlineInputBorder(
                  //           borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  //           borderSide: BorderSide(
                  //             color: Colors.transparent,
                  //           )
                  //       ),
                  //       focusedBorder: OutlineInputBorder(
                  //           borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  //           borderSide: BorderSide(
                  //             color: Colors.blue,
                  //           )
                  //       ),
                  //       prefixIcon: Icon(Icons.lock),
                  //       hintText: 'Password',
                  //       fillColor: Colors.grey[200],
                  //       filled: true,
                  //     ),
                  //   ),
                  // ),

                  // Container(
                  //   margin: EdgeInsets.only(top: 10.0),
                  //   child: TextFormField(
                  //     obscureText: true,
                  //     decoration: InputDecoration(
                  //       enabledBorder: OutlineInputBorder(
                  //           borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  //           borderSide: BorderSide(
                  //             color: Colors.transparent,
                  //           )
                  //       ),
                  //       focusedBorder: OutlineInputBorder(
                  //           borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  //           borderSide: BorderSide(
                  //             color: Colors.blue,
                  //           )
                  //       ),
                  //       prefixIcon: Icon(Icons.lock),
                  //       hintText: 'Confirm Password',
                  //       fillColor: Colors.grey[200],
                  //       filled: true,
                  //     ),
                  //   ),
                  // ),

                  // Container(
                  //   margin: EdgeInsets.all(30.0),
                  //   width: double.infinity,
                  //   child: FlatButton(
                  //     child: Text('Sign Up', style: TextStyle(color: Colors.white),),
                  //     onpressed: (){
                  //       signUp(),
                  //     },
                  //   ),
                  //   decoration: BoxDecoration(
                  //     color: Colors.blue,
                  //     borderRadius: BorderRadius.circular(30.0),
                  //   ),
                  // ),
                  SizedBox(height: 15.0,),
                  Container(
                    height: 55.0,
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute (builder: (_)=>
                            HomeScreen()), (Route<dynamic>route) => false);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        elevation: 0.0,
                        minimumSize: Size(screenWidth, 150),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0)),
                        ),
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Color(0xFF65B0B4),
                                  offset: const Offset(1.1, 1.1),
                                  blurRadius: 10.0),
                            ],
                            color: Color(0xFF65B0B4),
                            borderRadius: BorderRadius.circular(12.0)),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Sign Up",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // ElevatedButton(
                  //   child: Text('Sign Up'),
                  //   onPressed: () {
                  //     signUp;
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //       primary: Colors.pink,
                  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                  //       textStyle: TextStyle(
                  //           fontSize: 15,
                  //           fontWeight: FontWeight.bold)),
                  // ),

                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account?'),
                        TextButton(
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                                color: Color(0xFF65B0B4)
                            ),
                          ),
                          onPressed: (){
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute (builder: (_)=>
                                Login()), (Route<dynamic>route) => false);
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
