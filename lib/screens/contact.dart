import 'package:flutter/material.dart';
import 'package:contactus/contactus.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
      appBar: AppBar(
        title: const Text('My Hires'),
        backgroundColor: Color(0xFF00A368),
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
        body: ContactUs(
          logo: AssetImage('assets/images/car-logo.png'),
          email: 'ainea@carhire.co.ke',
          companyName: 'Carhire',
          phoneNumber: '+25471634578',
          dividerThickness: 2,
          website: 'https://carhire.com',
          //githubUserName: 'ainea-obura',
          //linkedinURL: 'https://www.linkedin.com/',
          tagLine: 'Carhire',
          twitterHandle: 'ainea-obura',
          companyColor: Colors.teal,
          textColor: Colors.black,
          cardColor: Colors.white,
          taglineColor: Colors.black,
        ),
    );
  }
}
