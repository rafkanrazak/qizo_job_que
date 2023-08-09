import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';

class Student_reg extends StatefulWidget {
  @override
  _Student_regState createState() => _Student_regState();
}

class _Student_regState extends State<Student_reg> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _collegenamecontroller = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  String? _selectedGender;
  String? _selectedQualification;
  String? _selectedCVFile;



  Future<void> _pickCVFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx'],
      );

      if (result != null) {
        PlatformFile file = result.files.first;

        setState(() {
          _selectedCVFile = file.name;
        });
      } else {
        print('File picking canceled');
      }
    } on PlatformException catch (e) {
      print('Error picking file: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.lightBlue.shade900,
        title: Center(child: Text('Student Registration Form',
        style: TextStyle(fontWeight: FontWeight.bold),)),
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
                  'Full Name*',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    hintText: 'Enter your first name',
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 5),
                Text(
                  'Email*',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _dobController,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1890),
                                lastDate: DateTime(2100));
                            if (pickedDate != null) {
                              _dobController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
                            }
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.date_range),
                            hintText: "DOB",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Address*',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
                SizedBox(height: 5),
                Text(
                  'Phone-no*',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: _phoneController,
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
                SizedBox(height: 5),
                Text(
                  'Choose Your Gender*',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
                SizedBox(height: 5),
                Text(
                  'College Name*',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: _collegenamecontroller,
                  decoration: InputDecoration(
                    hintText: 'Enter your college name',
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your college name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.upload_file),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        _pickCVFile();
                      },
                      child: Text(
                        'Choose Your CV',
                        style: TextStyle(
                          color: Colors.red.shade900,
                          fontWeight: FontWeight.bold
                          // decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    if (_selectedCVFile != null) SizedBox(width: 10),
                    if (_selectedCVFile != null) Text(_selectedCVFile ?? ''),
                  ],
                ),
                SizedBox(height: 40),
               ElevatedButton(
  onPressed: () {
    if (_formKey.currentState?.validate() ?? false) {
      // Perform registration logic here
      // You can send the form data to a server, save to a database, etc.
    }
  },
  child: Text('Submit'),
  style: ElevatedButton.styleFrom(
    primary: Colors.lightBlue.shade900,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    padding: EdgeInsets.symmetric(vertical: 15),
    minimumSize: Size(50, 50), // Adjust the size of the button
  ),
)

              ],
            ),
          ),
        ),
      ),
    //   floatingActionButton: Container(height: 40,width: double.maxFinite,
    //     child: FloatingActionButton(onPressed: () {  },
    //     child: Container(height: 40,width: double.maxFinite,
    //       child: ElevatedButton(
    //       onPressed: () {
    //         if (_formKey.currentState?.validate() ?? false) {
    //           // Perform registration logic here
    //           // You can send the form data to a server, save to a database, etc.
    //         }
    //       },
    //       child: Text('Submit'),
    //       style: ElevatedButton.styleFrom(
    //         primary: Colors.blue,
    //         padding: EdgeInsets.symmetric(vertical: 15),
    //       ),
    // ),
    //     ),
    //     ),
    //   ),
    //   floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );

  }
}

