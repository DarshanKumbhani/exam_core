import 'package:flutter/material.dart';

class Splash_ extends StatefulWidget {
  const Splash_({Key? key}) : super(key: key);

  @override
  _Splash_State createState() => _Splash_State();
}

class _Splash_State extends State<Splash_> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5) ,() async {
      return await  Navigator.pushNamed(context, '/');
    },);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Contact Dairy ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
               CircleAvatar(
                 backgroundImage: AssetImage("assets/images/call.png"),
               ),
              SizedBox(height: 30,),
              CircularProgressIndicator(backgroundColor: Colors.blue.shade50,color: Colors.blue, ),
            ],
          ),
        ),
      ),
    );
  }
}
