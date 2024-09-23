import 'package:flutter/material.dart';
import 'package:flutter_application/screens/reto1.dart';
import 'package:flutter_application/screens/reto2.dart';
import 'package:flutter_application/screens/reto3.dart';
import 'screens/contact.dart';
import 'screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UP Chiapas',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.purple[50],
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
        '/contact': (context) => const ContactScreen(),
        '/reto1': (context) => Reto1Screen(),
        '/reto2': (context) => const Reto2Screen(),
        '/reto3': (context) => const Reto3Screen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this); // Controlador para 5 tabs
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UP Chiapas'),
        backgroundColor: Colors.purple[700], // AppBar en color morado oscuro
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true, // Hace que las pestañas puedan desplazarse si no caben
          indicatorColor: Colors.orangeAccent, // Cambia el color del indicador
          indicatorWeight: 5.0, // Grosor del indicador
          labelStyle: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold), // Aumenta el tamaño del texto
          labelColor: Colors.orange, // Cambia el color del texto seleccionado
          unselectedLabelColor: Colors.white60, // Color del texto no seleccionado
          tabs: const [
            Tab(text: 'Home', icon: Icon(Icons.home, size: 30)), // Aumenta el tamaño de los íconos
            Tab(text: 'Contact', icon: Icon(Icons.contact_page, size: 30)),
            Tab(text: 'Reto 1', icon: Icon(Icons.assignment, size: 30)),
            Tab(text: 'Reto 2', icon: Icon(Icons.assignment_turned_in, size: 30)),
            Tab(text: 'Reto 3', icon: Icon(Icons.assignment_rounded, size: 30)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Center(child: Text('¡Bienvenido a la Página de Inicio!')),
          ContactScreen(),
          Reto1Screen(),
          Reto2Screen(),
          Reto3Screen(),
        ],
      ),
    );
  }
}
