import 'package:flutter/material.dart';
import 'package:qizo_job_que/screens/sign_up.dart';

class SplashScreen_pg extends StatefulWidget {
  @override
  _SplashScreen_pgState createState() => _SplashScreen_pgState();
}

class _SplashScreen_pgState extends State<SplashScreen_pg> {
  @override
  void initState() {
    super.initState();
    // Simulate some loading time, for example, you can load data or assets here.
    Future.delayed(Duration(seconds: 3), () {
      // After the splash screen, navigate to the desired screen
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => signup_pg()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset("assets/images/phone1.png"),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
