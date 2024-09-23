import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Biblioteca para manejar URLs

class Reto1Screen extends StatefulWidget {
  const Reto1Screen({Key? key}) : super(key: key);

  @override
  _Reto1ScreenState createState() => _Reto1ScreenState();
}

class _Reto1ScreenState extends State<Reto1Screen> {
  // Método para enviar un mensaje de texto a un número específico.
  void _sendMessage(String number) async {
    final Uri smsUri = Uri(
      scheme: 'sms',
      path: number,
    );
    if (await canLaunchUrl(smsUri)) {
      await launchUrl(smsUri);
    } else {
      throw 'No se pudo enviar el mensaje a $number';
    }
  }

  void _makeCall(String number) async {
    final Uri telUri = Uri(
      scheme: 'tel',
      path: number,
    );
    if (await canLaunchUrl(telUri)) {
      await launchUrl(telUri);
    } else {
      throw 'No se pudo realizar la llamada a $number';
    }
  }

  void _openRepository(String url) async {
    final Uri repoUri = Uri.parse(url);
    if (await canLaunchUrl(repoUri)) {
      await launchUrl(repoUri);
    } else {
      throw 'No se pudo abrir el repositorio en $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contactos'),
        backgroundColor: Colors.purple[300], // Color del AppBar cambiado a morado
      ),
      body: Container(
        color: Colors.purple[50], // Fondo de la pantalla en morado claro
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _buildContactItem(
              context,
              'Jorge Alexis Arredondo Juárez', // Nombre del alumno
              '221187',                  // Matrícula del alumno
              '9611426549',               // Teléfono del alumno
              'https://github.com/PedroPortillo0/reto2-movil.git',  // URL del repositorio de GitHub
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.purple[100], // Fondo de la barra inferior en un tono morado claro
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              color: Colors.black, // Color del icono de home
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.person),
              color: Colors.black, // Color del icono de usuario
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem(
      BuildContext context, String name, String id, String phone, String repoUrl) {
    return Card(
      color: Colors.white, // Fondo de la tarjeta
      elevation: 4, // Sombra de la tarjeta
      child: Column(
        children: [
          // Nombre y matrícula del alumno
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.purple[300], // Fondo del avatar en morado
              child: Text(
                name[0],
                style: const TextStyle(color: Colors.white), // Letra en el avatar
              ),
            ),
            title: Text(name),
            subtitle: Text('Matrícula: $id'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.message),
                  color: Colors.blue, // Color del icono de mensaje en azul
                  onPressed: () => _sendMessage(phone),
                  tooltip: 'Enviar mensaje',
                ),
                IconButton(
                  icon: const Icon(Icons.call),
                  color: Colors.blue, // Color del icono de llamada en azul
                  onPressed: () => _makeCall(phone),
                  tooltip: 'Llamar',
                ),
              ],
            ),
          ),
          // Botón para abrir el repositorio
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: ElevatedButton.icon(
              onPressed: () => _openRepository(repoUrl),
              icon: const Icon(Icons.link),
              label: const Text('Ver repositorio'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple[300],  // Color del botón en morado
                foregroundColor: Colors.white,        // Color del texto y los iconos
              ),
            ),
          ),
        ],
      ),
    );
  }
}
