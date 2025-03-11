import 'package:flutter/material.dart';
void main() {
  runApp(ProfileApp());
}

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
          centerTitle: true,
        ),
        body: const ProfilePage()
      )
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage(
                'https://avatars.githubusercontent.com/u/33576285?v=4')
            ),
          const SizedBox(height: 20),
          Text("Username",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
          ),
          const SizedBox(height: 10),
          Text(
            'I love teaching students and helping them to achieve their dreams.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 20),
          Card(
            elevation: 4.0,
            child: Column(
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.cake),
                  title: Text("Birthdate"),
                  subtitle: Text("2004-12-01"),
                ),
                ListTile(
                  leading: const Icon(Icons.web),
                  title: const Text('Website'),
                  subtitle: const Text('brp.com.np'),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Clicked"),
                            duration: Duration(seconds: 1)));
                  }
                ),
                const ListTile(
                  leading: Icon(Icons.email),
                  title: Text('Email'),
                  subtitle: Text('bishworajpoudelofficial@gmail.com'),
                ),
                const ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text('Address'),
                  subtitle: Text('Pokhara, Nepal'),
                ),
              ]
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 10,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.facebook),
                color: Colors.blue,
                onPressed: (){},
                tooltip: "Facebook",
              ),
              IconButton(
                icon: const Icon(Icons.link),
                onPressed: () {},
                color: Colors.blue,
                tooltip: 'LinkedIn',
              ),
              IconButton(
                icon: const Icon(Icons.code),
                onPressed: () {},
                color: Colors.black,
                tooltip: 'GitHub',
              ),
            ],
          )
        ],
      ),
    ); // SingleChildScrollView
  }
}
