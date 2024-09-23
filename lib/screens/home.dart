import 'package:flutter/material.dart';
import 'package:flutter_application/screens/reto1.dart';  
import 'package:flutter_application/screens/reto2.dart';  
import 'package:flutter_application/screens/reto3.dart';  
import 'package:flutter_application/screens/contact.dart';  

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Menú de Retos',
    initialRoute: '/home',
    routes: {
      '/home': (context) => const HomeScreen(),
      '/reto1': (context) => const Reto1Screen(),
      '/reto2': (context) => const Reto2Screen(),
      '/reto3': (context) => const Reto3Screen(),
      '/contact': (context) => const ContactScreen(),
    },
  ));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Center(child: Text('Reto 1', style: TextStyle(fontSize: 24, color: Colors.purple))),
    Center(child: Text('Reto 2', style: TextStyle(fontSize: 24, color: Colors.purple))),
    Center(child: Text('Reto 3', style: TextStyle(fontSize: 24, color: Colors.purple))),
    Center(child: Text('Contacto', style: TextStyle(fontSize: 24, color: Colors.purple))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/reto1');
        break;
      case 1:
        Navigator.pushNamed(context, '/reto2');
        break;
      case 2:
        Navigator.pushNamed(context, '/reto3');
        break;
      case 3:
        Navigator.pushNamed(context, '/contact');
        break;
      default:
        Navigator.pushNamed(context, '/home');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.deepPurple, // Cambiado a un tono púrpura
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.widgets, color: Colors.deepPurpleAccent),
            label: 'Reto 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.touch_app, color: Colors.deepPurpleAccent),
            label: 'Reto 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.text_fields, color: Colors.deepPurpleAccent),
            label: 'Reto 3',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.deepPurpleAccent),
            label: 'Contacto',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,  // Color seleccionado
        unselectedItemColor: Colors.blueGrey,  // Color no seleccionado
        onTap: _onItemTapped,
        backgroundColor: Colors.deepPurple[50],  // Fondo del BottomNavigationBar
      ),
    );
  }
}
