import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:qizo_job_que/screens/employee_registration.dart';
import 'package:qizo_job_que/screens/employer_registration.dart';
import 'package:qizo_job_que/screens/homepage.dart';
import 'package:qizo_job_que/screens/sign_up.dart';
import 'package:qizo_job_que/screens/splashscreen.dart';
import 'package:qizo_job_que/screens/student_profile.dart';
import 'package:qizo_job_que/screens/student_registration.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: home_pg (),
  ));
}
