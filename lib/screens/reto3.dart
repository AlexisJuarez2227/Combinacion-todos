import 'package:flutter/material.dart';
import 'dart:convert'; 
import 'package:http/http.dart' as http;
import 'dart:async'; 

class Reto3Screen extends StatefulWidget {
  const Reto3Screen({Key? key}) : super(key: key);

  @override
  _Reto3ScreenState createState() => _Reto3ScreenState();
}

class _Reto3ScreenState extends State<Reto3Screen> {
  final String apiUrl = 'https://pokeapi.co/api/v2/pokemon/ditto';

  Future<Map<String, dynamic>>? _pokemonData;

  @override
  void initState() {
    super.initState();
    _loadPokemon();
  }

  void _loadPokemon() {
    setState(() {
      _pokemonData = fetchPokemon();
    });
  }

  Future<Map<String, dynamic>> fetchPokemon() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error al obtener información del Pokémon');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reto 3 - API PokeAPI'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: FutureBuilder<Map<String, dynamic>>(
          future: _pokemonData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              final data = snapshot.data!;
              final name = data['name'];
              final height = data['height'];
              final weight = data['weight'];
              final imageUrl = data['sprites']['front_default'];

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    imageUrl,
                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const CircularProgressIndicator();
                    },
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Nombre: $name',
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Altura: $height',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Peso: $weight',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              );
            }
            return const Text('Sin datos');
          },
        ),
      ),
    );
  }
}
