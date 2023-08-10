import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qizo_job_que/screens/employee_registration.dart';
import 'package:qizo_job_que/screens/employer_registration.dart';
import 'package:qizo_job_que/screens/student_registration.dart';

class home_pg extends StatefulWidget {
  const home_pg({super.key});

  @override
  State<home_pg> createState() => _home_pgState();
}

class _home_pgState extends State<home_pg> {
  List<String> imagePaths = [
    "assets/images/emplyee.jpg",
    "assets/images/emplyr.jpg",
    "assets/images/students.jpg",
    "assets/images/tchr.jpg"
  ];

  List<String> buttonTexts = ['Employee', 'Employer', 'Student', 'Teacher'];

  void navigateToScreen(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Employee_reg()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) =>Employer_reg()));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) =>Student_reg ()));
        break;
      // case 3:
      //   Navigator.push(context, MaterialPageRoute(builder: (context) => ()));
      //   break;
      default:
        print('Invalid index');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: imagePaths.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              elevation: 3, // Set elevation to 3
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(15), // Circular rounded edges
              ),
              child: Stack(
                children: [
                  Container(
                    height: 170,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    clipBehavior: Clip
                        .hardEdge, // Ensure the image does not overflow the rounded corners
                    child: Image.asset(
                      imagePaths[index],
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: ElevatedButton(
                      onPressed: () {
                        print('${buttonTexts[index]} Button Pressed!');
                        navigateToScreen(index, context);
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(140, 10),
                        primary: Colors.lightBlue.shade900,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        buttonTexts[index],
                        style: GoogleFonts.aboreto(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
