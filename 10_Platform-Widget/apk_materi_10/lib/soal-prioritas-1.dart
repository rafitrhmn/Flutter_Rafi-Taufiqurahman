import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

//class material app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

//class scaffold
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App'),
      ),
      drawer: Drawer(
          child: ListView(
        children: const <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Color.fromARGB(47, 37, 37, 37)),
            child: Text('Home'),
          ),
          ListTile(
            title: Text('Settings'),
          )
        ],
      )),
      body: const Center(child: Text('This is Material App')),
      //battom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
      ),
    );
  }
}
