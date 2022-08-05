import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/singin.dart';
import 'package:flutter_application_1/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignIn(),
    );
  }
}


class HomeScrenn extends StatefulWidget {
  const HomeScrenn({Key? key}) : super(key: key);

  @override
  State<HomeScrenn> createState() => _HomeScrennState();
}

class _HomeScrennState extends State<HomeScrenn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:Drawer(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 246, 240, 66),
        title: Text("الصفحة الرئيسية"),
        actions: [
     Column(children: [
           CircleAvatar(radius: 12,
          child: IconButton(
            onPressed: (){},
            icon: Icon(Icons.search,
            size: 17,
            color: Colors.black
            ),
          ),
          ),

            CircleAvatar(radius: 12,
          child: IconButton(
            onPressed: (){},
            icon: const Icon(Icons.mark_chat_read,
            size: 17,
            color: Colors.black,),
          ),
          ),
        ]),

        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(""),
                 fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
              color: Colors.red,
              
            ),
            child: Row(children: [
            Expanded(
              child: Container(
                color: Colors.blue,
                 child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 120,bottom: 10,),
                      child: CircleAvatar(
                        radius: 20,
                        
                      ),
                    )
                  ],
                 ),
              ),
            ),
            ]),
            ),
        ],
      ),
    );
  }
}