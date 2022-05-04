import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LogIn with Facebook"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: (){
              logInWithFb();
            },
            child: Text("LogIn with Facebook")
        ),
      ),
    );
  }

  void logInWithFb() async{
    final LoginResult loginResult =  await FacebookAuth.i.login();
    if(loginResult.status == LoginStatus.success){
      var userData = await FacebookAuth.i.getUserData();
      print(userData);
    }
  }
}

