import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Employer_reg extends StatefulWidget {
  @override
  _Employer_regState createState() => _Employer_regState();
}

class _Employer_regState extends State<Employer_reg> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  XFile? _cvFile; // The selected CV file

  void _pickCV() async {
    final ImagePicker _picker = ImagePicker();
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _cvFile = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue.shade900,
        title: Center(
            child: Text(
          'Employer Registration Form',
          style: GoogleFonts.aboreto(fontWeight: FontWeight.bold, fontSize: 16),
        )),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  // You can add email validation here
                  return null;
                },
              ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Company Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your company name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 80,),
              // ElevatedButton(
              //   onPressed: _pickCV,
              //   child: Text('Upload CV',style: GoogleFonts.aboreto(
              //           fontWeight: FontWeight.bold, fontSize: 18),),
              //           style: ElevatedButton.styleFrom(
              //       primary: Colors.lightBlue.shade900,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(10),
              //       ),)
              // ),
              if (_cvFile != null) Text('Selected CV: ${_cvFile!.name}'),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Perform registration logic here
                      String name = _nameController.text;
                      String email = _emailController.text;
                      String cvFilePath = _cvFile != null ? _cvFile!.path : '';

                      // You can proceed to send the data to your backend or store in a database
                    }
                  },
                  child: Text(
                    'Submit',
                    style: GoogleFonts.aboreto(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlue.shade900,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
