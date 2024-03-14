import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:localllllll/Profile_in.dart';
import 'package:localllllll/setting_screen.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.blue,
              // backgroundImage: NetworkImage('url'),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Mark Adam',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          const Text(
            'Sunny_koelpin45@hotmail.com',
            style: TextStyle(color: Colors.black45),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Profile
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Profilescreen(),
                        ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200]),
                    child: const ListTile(
                      leading: Icon(
                        Icons.person,
                        size: 40,
                      ),
                      title: Text('Profile',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //Setting
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingScreen(),
                        ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200]),
                    child: const ListTile(
                      leading: Icon(
                        Icons.settings,
                        size: 40,
                      ),
                      title: Text('Setting',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //Contact
                GestureDetector(
                  onTap: () {
                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ,))
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200]),
                    child: const ListTile(
                      leading: Icon(
                        Icons.mail,
                        size: 40,
                      ),
                      title: Text('Contact',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //Share app
                GestureDetector(
                  onTap: () {
                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ,))
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200]),
                    child: const ListTile(
                      leading: Icon(
                        Icons.share,
                        size: 40,
                      ),
                      title: Text('Share App',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //Help
                GestureDetector(
                  onTap: () {
                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ,))
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200]),
                    child: const ListTile(
                      leading: Icon(
                        Icons.help,
                        size: 40,
                      ),
                      title: Text('Help',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),
                // const SizedBox(
                //   height: 20,
                // ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.13,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ,))
                  },
                  child: Text(
                    "Sign out",
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 20,
                      color: Colors.redAccent[700],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
