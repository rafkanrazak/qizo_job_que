import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:qizo_job_que/screens/otp_verification.dart';

class signup_pg extends StatefulWidget {
  const signup_pg({super.key});

  @override
  State<signup_pg> createState() => _signup_pgState();
}

class _signup_pgState extends State<signup_pg> {
//  TextEditingController phoneNumber = TextEditingController();
  var phoneNumber = TextEditingController();

  signInWithPhone() async {
    /// The `verifyPhoneNumber` method is used to initiate the phone number verification process using
    /// Firebase Authentication.
    /// The `verifyPhoneNumber` method is used to initiate the phone number verification process using
    /// Firebase Authentication.
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber.text,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {},
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    // print(phoneNumber.text);
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                "Enter your Phone Number",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(
                height: 20,
              ),
              Text("We will send you the 4 digit verification code",
                  style: TextStyle(fontSize: 18)),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFormField(
                  controller: phoneNumber,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Phone No:", border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                width: 360,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      // signInWithPhone();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const otpverfication_pg()),
                      );
                    },
                    style:
                        ElevatedButton.styleFrom(primary: Colors.blue.shade800),
                    child: Text(
                      "GENERATE OTP",
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
                    signInWithGoogle();
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
              SizedBox(
                height: 20,
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
