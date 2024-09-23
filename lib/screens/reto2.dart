import 'package:flutter/material.dart';

class Reto2Screen extends StatefulWidget {
  const Reto2Screen({Key? key}) : super(key: key);

  @override
  _Reto2ScreenState createState() => _Reto2ScreenState();
}

class _Reto2ScreenState extends State<Reto2Screen> {
  final TextEditingController _controller = TextEditingController();
  String _statusMessage = "";
  Color? _btnColor = Colors.grey[400];
  String _inputEmail = "";

  // Método para validar el correo electrónico solo al presionar el botón
  void _checkEmail() {
    final email = _controller.text;
    setState(() {
      if (email.endsWith('@gmail.com')) {
        _statusMessage = "¡Correo válido!";
        _btnColor = Colors.green;
        _inputEmail = email; // Guardar el correo electrónico ingresado
      } else if (email.endsWith('@hotmail.com')) {
        _statusMessage = "¡Correo válido para Hotmail!";
        _btnColor = Colors.green;
        _inputEmail = email;
      } else {
        _statusMessage = "Correo inválido. Debe terminar en '@gmail.com' o '@hotmail.com'.";
        _btnColor = Colors.red;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reto 2 - Validador de Email'),
        backgroundColor: Colors.deepPurple,
        elevation: 10, // Eliminar la propiedad `shape`
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 50), // Espacio vertical
            Text(
              'Introduce tu email:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.deepPurple[800],
              ),
            ),
            const SizedBox(height: 20), // Espacio vertical
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.deepPurple[600]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                prefixIcon: Icon(Icons.email, color: Colors.deepPurple[600]),
                filled: true,
                fillColor: Colors.deepPurple[50],
              ),
              style: TextStyle(
                color: Colors.deepPurple[900],
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20), // Espacio vertical
            ElevatedButton(
              onPressed: _checkEmail, // Validar solo al presionar el botón
              style: ElevatedButton.styleFrom(
                backgroundColor: _btnColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 8,
                shadowColor: Colors.black54,
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              child: const Text('Verificar Email'),
            ),
            const SizedBox(height: 20), // Espacio vertical
            Text(
              'Email ingresado es: $_inputEmail',
              style: TextStyle(
                fontSize: 18,
                color: Colors.deepPurple[800],
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20), // Espacio vertical
            Text(
              _statusMessage,
              style: TextStyle(
                fontSize: 18,
                color: _statusMessage.startsWith('¡') ? Colors.green : Colors.red,
                fontWeight: FontWeight.w600,
                shadows: const [
                  Shadow(
                    blurRadius: 5.0,
                    color: Colors.black45,
                    offset: Offset(2.0, 2.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
