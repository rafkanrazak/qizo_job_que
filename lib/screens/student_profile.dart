import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qizo_job_que/screens/homepage.dart';

class student_prof extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          backgroundColor: Colors.lightBlue.shade900,
        ),
        drawer: Theme(
          data: Theme.of(context).copyWith(canvasColor: const Color.fromARGB(255, 102, 151, 173)),
          child: Drawer(
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('icon/123.jpg'))),
                  accountName: Text('Rafkan Razak'),
                  accountEmail: Text('rafkanrazak700@gmail.com'),
                  currentAccountPicture: GestureDetector(
                    child: CircleAvatar(
                      backgroundImage: (AssetImage('assets/images/photo1.jpg')),
                    ),
                  ),
                  otherAccountsPictures: [
                    // CircleAvatar(
                    //   backgroundImage: (AssetImage('icon/red.png')),
                    // ),
                    // CircleAvatar(
                    //   backgroundImage: (AssetImage('icon/gold.png')),
                    // ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => home_pg()));
                  },
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text("My Account"),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => home_pg()));
                  },
                  child: ListTile(
                    leading: Icon(Icons.people),
                    title: Text("Students"),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Faculty"),
                  trailing: Icon(Icons.arrow_forward),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Attendence"),
                  trailing: Icon(Icons.arrow_forward),
                ),
                ListTile(
                  leading: Icon(Icons.notifications),
                  title: Text("Notification"),
                  trailing: Icon(Icons.arrow_forward),
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text("Logout"),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ),
        ));
  }
}
