import 'package:flutter/material.dart';
import 'package:mobile/screens/home.dart';

class Success extends StatelessWidget {
  const Success({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 70),
            Center(
              child: Image.asset(
                'assets/images/success.png',
                width: size.width * .30,
                fit: BoxFit.fill,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text("Success!",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w800)),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text("Hire created",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        )),
              ),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00A368)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Home()),
                );
              },
              child: const Text(
                'Go Home',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
