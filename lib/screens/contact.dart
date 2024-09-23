import 'package:flutter/material.dart';

void main() => runApp(const ContactApp());

class ContactApp extends StatelessWidget {
  const ContactApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple, // Cambio a tonos morados
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF9C27B0), // Botón flotante en morado
        ),
      ),
      home: const ContactScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> with SingleTickerProviderStateMixin {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<Map<String, String>> _names = [];
  final List<Map<String, String>> _predefinedNames = [
    {'name': 'Jorge Alexis Arredondo Juárez', 'matricula': '221187'}
  ];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < _predefinedNames.length; i++) {
      _names.add(_predefinedNames[i]);
      _listKey.currentState?.insertItem(i, duration: const Duration(milliseconds: 500));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Contactos', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.purple[300], // AppBar en morado
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Fondo degradado en morado y azul
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFE1BEE7), Color(0xFFBBDEFB)], // Gradiente en morado y azul
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Lista animada de contactos
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: AnimatedList(
              key: _listKey,
              initialItemCount: _names.length,
              itemBuilder: (context, index, animation) {
                return _buildItem(_names[index], animation);
              },
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        color: Colors.purple[100], // Fondo del BottomAppBar en morado suave
        elevation: 10,
        child: Container(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.home, color: Colors.black),
                onPressed: () {
                    Navigator.pushNamed(context, '/home');
                },
              ),
              const SizedBox(width: 30),
              IconButton(
                icon: const Icon(Icons.person, color: Colors.black),
                onPressed: () {
                   Navigator.pushNamed(context, '/contact');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem(Map<String, String> contact, Animation<double> animation) {
    return FadeTransition(
      opacity: animation,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 6,
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.purple, // Avatar en morado
            child: Text(
              contact['name']![0],
              style: const TextStyle(color: Colors.white),
            ),
          ),
          title: Text(contact['name']!),
          subtitle: Text('Matrícula: ${contact['matricula']}'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.call, color: Colors.blue), // Icono de llamada en azul
                onPressed: () {
                  _showSnackbarMessage('Llamando a ${contact['name']}');
                },
              ),
              IconButton(
                icon: const Icon(Icons.message, color: Colors.blue),
                onPressed: () {
                  _showSnackbarMessage('Enviando mensaje a ${contact['name']}');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSnackbarMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
