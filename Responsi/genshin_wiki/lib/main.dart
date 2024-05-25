// 123210196
// Nasywa Nadya Nur Hafizhah

import 'package:flutter/material.dart';
import 'api_service.dart';
import 'detail_char_model.dart';
import 'detail_weapon_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Genshin Impact Wiki',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiService apiService = ApiService();
  String lastAccessedName = '';
  String lastAccessedIcon = '';

  void updateLastAccessed(String name, String icon) {
    setState(() {
      lastAccessedName = name;
      lastAccessedIcon = icon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Genshin Impact Wiki'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CharacterListPage(apiService: apiService, updateLastAccessed: updateLastAccessed),
                      ),
                    ),
                    child: Text('Characters'),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WeaponListPage(apiService: apiService, updateLastAccessed: updateLastAccessed),
                      ),
                    ),
                    child: Text('Weapons'),
                  ),
                ],
              ),
            ),
          ),
          if (lastAccessedName.isNotEmpty && lastAccessedIcon.isNotEmpty)
            Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Image.network(lastAccessedIcon, width: 50, height: 50),
                  SizedBox(width: 10),
                  Text(lastAccessedName, style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class CharacterListPage extends StatelessWidget {
  final ApiService apiService;
  final Function(String, String) updateLastAccessed;

  CharacterListPage({required this.apiService, required this.updateLastAccessed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Characters'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: apiService.fetchCharacters(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No characters found'));
          } else {
            final characters = snapshot.data!;
            return ListView.builder(
              itemCount: characters.length,
              itemBuilder: (context, index) {
                final character = characters[index];
                return ListTile(
                  title: Text(character),
                  onTap: () async {
                    final detail = await apiService.fetchCharacterDetail(character);
                    updateLastAccessed(detail.name!, 'https://genshin.jmp.blue/characters/${detail.name}/card');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CharacterDetailPage(detail: detail),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

class CharacterDetailPage extends StatelessWidget {
  final DetailCharModel detail;

  CharacterDetailPage({required this.detail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(detail.name!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network('https://genshin.jmp.blue/characters/${detail.name}/card'),
            Text(detail.name!, style: TextStyle(fontSize: 24)),
            Text('Nation: ${detail.nation}'),
            // Display other character details as needed
          ],
        ),
      ),
    );
  }
}

class WeaponListPage extends StatelessWidget {
  final ApiService apiService;
  final Function(String, String) updateLastAccessed;

  WeaponListPage({required this.apiService, required this.updateLastAccessed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Weapons'),
    ),
      body: FutureBuilder<List<dynamic>>(
        future: apiService.fetchWeapons(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No weapons found'));
          } else {
            final weapons = snapshot.data!;
            return ListView.builder(
              itemCount: weapons.length,
              itemBuilder: (context, index) {
                final weapon = weapons[index];
                return ListTile(
                  title: Text(weapon),
                  onTap: () async {
                    final detail = await apiService.fetchWeaponDetail(weapon);
                    updateLastAccessed(detail.name!, 'https://genshin.jmp.blue/weapons/${detail.name}/icon');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WeaponDetailPage(detail: detail),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

class WeaponDetailPage extends StatelessWidget {
  final DetailWeaponModel detail;

  WeaponDetailPage({required this.detail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(detail.name!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network('https://genshin.jmp.blue/weapons/${detail.name}/icon'),
            Text(detail.name!, style: TextStyle(fontSize: 24)),
            Text('Type: ${detail.type}'),
            Text('Rarity: ${detail.rarity}'),
            // Display other weapon details as needed
          ],
        ),
      ),
    );
  }
}