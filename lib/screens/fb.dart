import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class Fb extends StatefulWidget {
  const Fb({super.key});

  @override
  State<Fb> createState() => _FbState();
}

class _FbState extends State<Fb> {
  bool _isLoggedIn = false;
  Map _userObj = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("fb"),
      ),
      body: Container(
          child: _isLoggedIn == true
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(_userObj["name"]),
                    Text(_userObj["email"]),
                    TextButton(
                        onPressed: () {
                          FacebookAuth.instance.logOut().then((value) {
                            setState(() {
                              _isLoggedIn = false;
                              _userObj = {};
                            });
                          });
                        },
                        child: Text("Logout")),
                  ],
                )
              : Center(
                  child: ElevatedButton(
                      onPressed: () async {
                        FacebookAuth.instance.login(permissions: [
                          "public_profile",
                          "email"
                        ]).then((value) {
                          FacebookAuth.instance
                              .getUserData()
                              .then((userData) async {
                            setState(() {
                              _isLoggedIn = true;
                              _userObj = userData;
                            });
                          });
                        });
                      },
                      child: Text("Login With Facebook")),
                )),
    );
  }
}
// the firebase connectivity is now correct with androidMetaDeveloper but there is some issue in AndroidXMl file