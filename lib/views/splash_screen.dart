import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
 
import 'package:yo_event/views/onboarding.dart';

// ignore: camel_case_types
class splashpage extends StatefulWidget {
  const splashpage({super.key});
  @override
   State<splashpage> createState() =>  _splashpageState();
}

// ignore: camel_case_types
class _splashpageState extends State<splashpage> 
with SingleTickerProviderStateMixin{
  @override
  void initState() {
     
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  
  Future.delayed(const Duration(seconds: 4),(){
    Navigator. of(context).pushReplacement(MaterialPageRoute(
      builder: (_)=> OnBoardingScreen(),
      ));
  });
  
  }

  

  @override
  void dispose() {
     
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }
  @override
  Widget build(BuildContext context){
    return(  Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.white10, Colors.blueGrey, Colors.lightBlueAccent ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          )
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Icon(Icons.event,
          size: 150,
          color: Colors.yellow,
          ),
          SizedBox(height: 20,),
          Text('YoEvent', style: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.white,
            fontSize: 32,
             
          ),)
        ]
        ),
      ),
    ));
  }
}