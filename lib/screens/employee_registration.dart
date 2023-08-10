import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';

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
          style: GoogleFonts.aboreto(fontWeight: FontWeight.bold, fontSize: 18),
        )),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                SizedBox(height: 10),
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
                    'Save and Continue',
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
                      MaterialPageRoute(builder: (context) => Employee2_reg()),
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

class Employee2_reg extends StatefulWidget {
  @override
  _Employee2_regState createState() => _Employee2_regState();
}

class _Employee2_regState extends State<Employee2_reg> {
  final _formKey = GlobalKey<FormState>();
  final _skillsController = TextEditingController();
  List<String> _selectedSkills = [];
  String? _selectedLocation;
  double? _expectedSalary;
  String? _selectedQualification;
  String? _selectedCVFile;

  void _addSkill() {
    if (_skillsController.text.isNotEmpty) {
      setState(() {
        _selectedSkills.add(_skillsController.text);
        _skillsController.clear();
      });
    }
  }

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

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Perform form submission here
      print('Form submitted');
      print('Skills: $_selectedSkills');
      print('Location: $_selectedLocation');
      print('Expected Salary: $_expectedSalary');
      print('Qualification: $_selectedQualification');
      print('CV File: $_selectedCVFile');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue.shade900,
        title: Center(
            child: Text(
          'Additional Details',
          style: GoogleFonts.aboreto(fontWeight: FontWeight.bold, fontSize: 18),
        )),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
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
                        style: GoogleFonts.aboreto(
                            color: Colors.blue.shade900,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    if (_selectedCVFile != null) SizedBox(width: 10),
                    if (_selectedCVFile != null) Text(_selectedCVFile ?? ''),
                  ],
                ),

                SizedBox(height: 15),
                TextFormField(
                  controller: _skillsController,
                  decoration: InputDecoration(labelText: 'Add Skills'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _addSkill,
                  child: Text(
                    'ADD SKILLS',
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlue.shade900,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    minimumSize: Size(50, 50), // Adjust the size of the button
                  ),
                ),
                SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  children: _selectedSkills
                      .map((skill) => Chip(
                            label: Text(skill),
                            onDeleted: () {
                              setState(() {
                                _selectedSkills.remove(skill);
                              });
                            },
                          ))
                      .toList(),
                ),

                // TextFormField(
                //   readOnly: true,
                //   initialValue: _selectedCVFile ?? '',
                //   decoration: InputDecoration(
                //     labelText: 'Selected CV',
                //     suffixIcon: IconButton(
                //       onPressed: _pickCVFile,
                //       icon: Icon(Icons.upload_file), // Changed icon here
                //     ),
                //   ),
                //   validator: (value) {
                //     if (_selectedCVFile == null) {
                //       return 'Please upload your CV';
                //     }
                //     return null;
                //   },
                // ),
                // Text(
                //   'Qualification*',
                //   style: GoogleFonts.aboreto(
                //       fontSize: 14, fontWeight: FontWeight.bold),
                // ),
                // // SizedBox(height: 5),
                // DropdownButtonFormField<String>(
                //   value: _selectedQualification,
                //   items: ['High School', "Bachelor's", "Master's", 'Ph.D.']
                //       .map((String qualification) {
                //     return DropdownMenuItem<String>(
                //       value: qualification,
                //       child: Text(qualification),
                //     );
                //   }).toList(),
                //   onChanged: (value) {
                //     setState(() {
                //       _selectedQualification = value;
                //     });
                //   },
                //   validator: (value) {
                //     if (value == null) {
                //       return 'Please choose your qualification';
                //     }
                //     return null;
                //   },
                // ),
                SizedBox(height: 20),
                Text(
                  'Expected salary*',
                  style: GoogleFonts.aboreto(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter salary',
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your expectation';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _expectedSalary = double.tryParse(value);
                  },
                ),
                // SizedBox(height: 20),

                SizedBox(
                  height: 180,
                ),
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
                      MaterialPageRoute(builder: (context) => Employee2_reg()),
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
