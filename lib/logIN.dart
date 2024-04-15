import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parking/homePage.dart';
import 'package:parking/signUP.dart';

// import 'package:modal_progress_hud/modal_progress_hud.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({Key? key}) : super(key: key);

  @override
  _NameScreenState createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  bool passToggle = true;

  TextEditingController emailController = TextEditingController();
  bool showEmailError = false;

  TextEditingController passwordController = TextEditingController();
  bool showPasswordError = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Center(
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  FadeInUp(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage('images/login.png'),
                      ),
                    ),
                  ),
                  FadeInUp(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        'Welcome',
                        style: TextStyle(
                            fontFamily: 'Pacifico',
                            fontSize: 40,
                            color: Color.fromRGBO(88, 80, 141, 1)),
                      ),
                    ),
                  ),
                  FadeInUp(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: SizedBox(
                        height: 30,
                        width: 80,
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  FadeInUp(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Container(
                        width: 300,
                        // height: 50,
                        child: Column(
                          children: <Widget>[
                            FadeInUp(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                              ),
                            ),
                            FadeInUp(
                              child: TextFormField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white70),
                                decoration: InputDecoration(
                                  // border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 0.7),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 0.7),
                                  ),
                                  prefixIcon: Icon(Icons.account_circle,
                                      color: Color.fromRGBO(88, 80, 141, 1)),
                                  hintText: "Email",
                                  labelText: 'Email',
                                  errorText: showEmailError
                                      ? 'Please enter email'
                                      : null,
                                  labelStyle: TextStyle(
                                      fontSize: 18.0, color: Colors.grey),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                                onChanged: (text) {
                                  setState(() {
                                    showEmailError = false;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  FadeInUp(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: 300,
                        // height: 50,
                        child: Column(
                          children: <Widget>[
                            FadeInUp(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                              ),
                            ),
                            FadeInUp(
                              child: TextFormField(
                                obscureText: passToggle ? true : false,
                                controller: passwordController,
                                enableSuggestions: false,
                                autocorrect: false,
                                keyboardType: TextInputType.visiblePassword,
                                style:
                                    TextStyle(fontSize: 18, color: Colors.grey),
                                decoration: InputDecoration(
                                  // border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 0.7),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 0.7),
                                  ),
                                  prefixIcon: Icon(Icons.key,
                                      color: Color.fromRGBO(88, 80, 141, 1)),
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      if (passToggle == true) {
                                        passToggle = false;
                                      } else {
                                        passToggle = true;
                                      }

                                      setState(() {});
                                    },
                                    child: passToggle
                                        ? const Icon(
                                            CupertinoIcons.eye_slash_fill,
                                            color: Colors.grey)
                                        : const Icon(CupertinoIcons.eye_fill,
                                            color: Colors.grey),
                                  ),

                                  labelText: 'Password',
                                  labelStyle: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.grey,
                                  ),

                                  errorText: showPasswordError
                                      ? 'Please enter Password'
                                      : null,
                                ),
                                onChanged: (text) {
                                  setState(() {
                                    showPasswordError = false;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  FadeInUp(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            showEmailError = emailController.text.isEmpty;
                            showPasswordError = passwordController.text.isEmpty;

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          });
                        },

                        child: Text(
                          ' LOG IN ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(
                              color: Color.fromRGBO(88, 80, 141, 1),
                              width: 1.0),
                        ),
                        color: Color.fromRGBO(88, 80, 141, 1),
                        textColor: Colors.black,
                        padding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 40.0),
                        // minWidth: double.infinity,
                      ),
                    ),
                  ),
                  FadeInUp(
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignIn(),
                            ),
                          );
                        },
                        child: Text(
                          "Don't have an account? Sign UP",
                          style: TextStyle(color: Colors.blueGrey),
                        )),
                  ),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
