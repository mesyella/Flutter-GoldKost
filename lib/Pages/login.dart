import 'package:flutter/material.dart';
import 'package:goldkost/Template/colors.dart';
import 'package:goldkost/Pages/homePage.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  final key = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: navy,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 100, 0, 50),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: white,
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height -
                    0.31 * MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(150),
                  ),
                ),
                child: Form(
                  key: key,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 40, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Text(
                            'Username',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: navy,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 40),
                          child: TextFormField(
                            maxLines: 1,
                            decoration: InputDecoration(
                              hintText: 'Username',
                              hintStyle: (TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20,
                                color: Colors.grey,
                              )),
                              icon: Icon(
                                Icons.person,
                                color: navy,
                              ),
                            ),
                            validator: (value) {
                              if (value.length < 0)
                                return 'Invalid Username';
//                              else if (value != 'goldKost1')
//                                return 'Username not found';
                              else
                                return null;
                            },
                            onSaved: (value) {},
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Text(
                            'Password',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: navy,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 40),
                          child: TextFormField(
                            maxLines: 1,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: (TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20,
                                color: Colors.grey,
                              )),
                              icon: Icon(
                                Icons.lock,
                                color: navy,
                              ),
                            ),
                            validator: (value) {
                              if (value.length < 0)
                                return 'Invalid Password';
//                              else if (value != 'goldKost123')
//                                return 'Password incorrect';
                              else
                                return null;
                            },
                            onSaved: (value) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => homePage()),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(180, 50, 0, 0),
                          child: FlatButton(
                            child: Container(
                              height: 40,
                              width: 130,
                              decoration: BoxDecoration(
                                  color: navy,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  'sign in',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: white,
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                if (key.currentState.validate()) {
                                  key.currentState.save();
                                }
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
