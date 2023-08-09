import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:qizo_job_que/screens/homepage.dart';

class otpverfication_pg extends StatefulWidget {
  const otpverfication_pg({super.key});

  @override
  State<otpverfication_pg> createState() => _otpverfication_pgState();
}

class _otpverfication_pgState extends State<otpverfication_pg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color.fromARGB(255, 240, 236, 236),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                image: AssetImage("assets/images/phone1.png"),
                height: 120,
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "OTP Verification",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Enter the OTP Here", style: TextStyle(fontSize: 18)),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: OTPTextField(
                  length: 5,
                  width: MediaQuery.of(context).size.width,
                  fieldWidth: 20,
                  style: TextStyle(color: Colors.black, fontSize: 17),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.underline,
                  onCompleted: (pin) {
                    print("Completed: " + pin);
                  },
                ),
              ),
              Text("Didn't receive OTP? RESEND "),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 360,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      //  signInWithPhone();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const home_pg()),
                      );
                    },
                    style:
                        ElevatedButton.styleFrom(primary: Colors.blue.shade800),
                    child: Text(
                      "VERIFY & CONTINUE",
                    )),
              ),
              SizedBox(
                height: 120,
              ),
              Text(
                "---------------------------or---------------------------",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: InkWell(
                  onTap: () {
                    // signInWithGoogle();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/images/google.png",
                            height: 30,
                          ),
                        ),
                        Text("Google")
                      ],
                    ),
                  ),
                ),
              ),
              Text(
                "New user? Register Here",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
