import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../Componants/ColumnSpace.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Future<void> googlesinginUp() async {
    try {
      final GoogleSignIn _googleSigin = GoogleSignIn(
        scopes: ['email'],
      );
      //auth firebase
      final FirebaseAuth _auth = FirebaseAuth.instance;
      //pachage google_sign_in
      final GoogleSignInAccount? googleUser = await _googleSigin.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final User ?user = (await _auth.signInWithCredential(credential)).user;
      print("siningn");
      print("sigin ");
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              //image full screen
              fit: BoxFit.cover,
              image: AssetImage("images/background.png"),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: double.infinity,
                height: 400,
                //  color: Colors.grey[200],
                child: Column(children: [
                  Container(
                    child: const Text("تسجيل الدخول "),
                  ),
                  ColumnDivider(
                    space: 10,
                  ),
                  Container(
                    child: const Text(
                      "FoodFast",
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                          shadows: [
                            BoxShadow(
                                color: Color.fromARGB(255, 23, 112, 23),
                                blurRadius: 5,
                                spreadRadius: 5,
                                offset: Offset(3, 3)),
                          ]),
                    ),
                  ),
                  SignInButton(Buttons.Google,
                      text: "تسجيل الدخول باستخدام قوقل", onPressed: () {}),
                  ColumnDivider(
                    space: 10,
                  ),
                  SignInButton(Buttons.Email,
                      text: "تسجيل الدخول باستخدام الايميل",
                      onPressed: () async {
                    await googlesinginUp().then((value) =>
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => home())));
                  }),
                  ColumnDivider(
                    space: 10,
                  ),
                  SignInButton(Buttons.Facebook,
                      text: "تسجيل الدخول باستخدام فيس بوك", onPressed: () {}),
                  ColumnDivider(space: 20),
                  Container(
                      child: Text(
                    "بمجرد تسجيل الدخول في التطبيق فانك توافق على سياسة التطبيق",
                    style: TextStyle(color: Colors.grey[500]),
                  )),
                  InkWell(
                      child: Container(
                          child: Text(
                    " معرفة سياسة التطبيق ",
                    style: TextStyle(color: Colors.blue, fontSize: 14),
                  ))),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
