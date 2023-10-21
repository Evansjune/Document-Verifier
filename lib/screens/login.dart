import 'package:doc_verify/screens/home_screen.dart';
import 'package:doc_verify/screens/signup.dart';
import 'package:doc_verify/util/gen_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:doc_verify/util/helper.dart';
import '../database_handler/DbHelper.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _formKey = new GlobalKey<FormState>();
  //controllers
  final _conUserID = TextEditingController();
  final _conPassword = TextEditingController();
  var dbHelper;

  @override
  void initState(){
    super.initState();
    dbHelper = DbHelper();
  }

  login() async {
    String uid = _conUserID.text;
    String passwd = _conPassword.text;
    if (uid.isEmpty){
      alertDialog(context, 'User ID is required');
    }else if (passwd.isEmpty){
      alertDialog(context, 'Password is required');
    }else{
      await dbHelper.getLoginUser(uid, passwd).then((UserData){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>HomeScreen()));
      }).catchError((error){
        print(error);
        alertDialog(context, 'Failed to login');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF65B0B4),
        title: Text('Sign In'),

      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50.0,),
                Text(
                    "Login",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF65B0B4),
                    fontSize: 30.0,
                  ),
                ),
                SizedBox(height: 30.0,),

                // Container(
                //   child: TextFormField(
                //     controller: _conUserID,
                //     decoration: InputDecoration(
                //       enabledBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(30.0)),
                //         borderSide: BorderSide(
                //           color: Colors.transparent,
                //         )
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

                GenTextFormField(
                    controller: _conUserID,
                    hintName: 'Email',
                    icon: Icons.person,
                    isObscureText: false,
                    inputType: TextInputType.text,
                    ),

                SizedBox(height: 15.0,),

                GenTextFormField(
                  controller: _conPassword,
                  hintName: 'Password',
                  icon: Icons.lock,
                  isObscureText: true,
                  inputType: TextInputType.text,
                ),

                // Container(
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
                //       prefixIcon: Icon(Icons.person),
                //       hintText: 'Password',
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
                //     onpressed: (){},
                //   ),
                //   decoration: BoxDecoration(
                //     color: Colors.blue,
                //     borderRadius: BorderRadius.circular(30.0),
                //   ),
                // ),

                SizedBox(height: 10.0,),

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
                          "Sign In",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                ),

                // ElevatedButton(
                //   child: Text('login'),
                //   onPressed: () {
                //     login();
                //   },
                //   style: ElevatedButton.styleFrom(
                //       primary: Colors.pink,
                //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                //       textStyle: TextStyle(
                //           fontSize: 15,
                //           fontWeight: FontWeight.bold)),
                // ),
                SizedBox(height: 5.0,),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Do not have an account?'),
                      TextButton(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Color(0xFF65B0B4)
                          ),
                        ),
                        onPressed: (){
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute (builder: (_)=>
                              SignUp()), (Route<dynamic>route) => false);
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
    );
  }
}
