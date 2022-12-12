import 'package:flutter/material.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset('assets/images/splash.jpg'),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Text(
                "Rent high end cars",
                style: TextStyle(
                  color: Color(0xFF00A368)
                ),
              ),
            ),
            SizedBox(height: 50),
            InkWell(
              onTap: (){
                //Navigator.pushReplacementNamed(context, 'home');
              },
              child: Ink(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xFF00A368),
                ),
                child: Text(
                  "Get started",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
              )
            ),
          ]
        ),
      ),
    );
  }
}
