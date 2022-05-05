import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Alexendrea Baruah'),
            accountEmail: Text('alexendreaSwagat@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                // Image.network(
                //   'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                child: Image.asset(
                  'assets/images/girl_Trialprofile.png',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 231, 34, 54),
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage('assets/images/bloodimg1n.jpg')),
              // NetworkImage(
              // 'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
            ),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Blood Requests'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Blood Donors'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Share'),
            onTap: () => null,
          ),

          // ListTile(
          //   leading: Icon(Icons.notifications),
          //   title: Text('Notifications'),
          // ),
          // Divider(),

          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Policies'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            title: Text('Log Out'),
            leading: Icon(Icons.exit_to_app),
            onTap: () => () {
              //not working
              Navigator.pushNamed(context, "/login");
            },
          ),
        ],
      ),
    );
  }
}
