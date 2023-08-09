import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qizo_job_que/screens/student_registration.dart';

void main() {
  runApp(MaterialApp(
    home: Employee_reg(),
  ));
}

class Employee_reg extends StatefulWidget {
  @override
  _Employee_regState createState() => _Employee_regState();
}

class _Employee_regState extends State<Employee_reg> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneNumberController =
      TextEditingController(); // Updated controller name
  String? _selectedGender;
  String? _selectedQualification;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue.shade900,
        title: Center(
            child: Text(
          'Employee Registration Form',
          style: GoogleFonts.aboreto(fontWeight: FontWeight.bold),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 5),
                Text(
                  'Name*',
                  style: GoogleFonts.aboreto(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text(
                  'Email-id*',
                  style: GoogleFonts.aboreto(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Enter your mail address',
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 5),
                Text(
                  'Address*',
                  style: GoogleFonts.aboreto(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(
                    hintText: 'Enter your address',
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text(
                  'Phone-no*',
                  style: GoogleFonts.aboreto(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: _phoneNumberController,
                  decoration: InputDecoration(
                    hintText: 'Enter your phone number',
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                Text(
                  'Choose Your Gender*',
                  style: GoogleFonts.aboreto(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                DropdownButtonFormField<String>(
                  value: _selectedGender,
                  items: ['Male', 'Female', 'Other'].map((String gender) {
                    return DropdownMenuItem<String>(
                      value: gender,
                      child: Text(gender),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please choose your gender';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 5),
                Text(
                  'Qualification*',
                  style: GoogleFonts.aboreto(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                DropdownButtonFormField<String>(
                  value: _selectedQualification,
                  items: ['High School', 'Bachelor\'s', 'Master\'s', 'Ph.D.']
                      .map((String qualification) {
                    return DropdownMenuItem<String>(
                      value: qualification,
                      child: Text(qualification),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedQualification = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please choose your qualification';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  child: Text(
                    'Submit',
                    style: GoogleFonts.aboreto(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Perform registration logic here
                      // You can send the form data to a server, save to a database, etc.
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Student_reg()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlue.shade900,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    minimumSize: Size(50, 50), // Adjust the size of the button
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
