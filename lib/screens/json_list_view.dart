import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class JsonListView extends StatefulWidget {
  const JsonListView({super.key});

  @override
  State<JsonListView> createState() => _JsonListViewState();
}

class _JsonListViewState extends State<JsonListView> {
  bool loadFromInternet = false; // Flag untuk memilih sumber data

  Future<List<String>> _loadJson() async {
    if (loadFromInternet) {
      // Ambil JSON dari Internet
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      if (response.statusCode == 200) {
        final parsed = json.decode(response.body) as List<dynamic>;
        return parsed
            .map((e) => e['title'].toString())
            .toList(); // Hanya mengambil judul
      } else {
        throw Exception('Failed to load JSON from internet');
      }
    } else {
      // Ambil JSON dari lokal
      final data = await rootBundle.loadString('assets/data.json');
      final parsed = json.decode(data) as List<dynamic>;
      return parsed.map((e) => e.toString()).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON ListView'),
        actions: [
          Switch(
            value: loadFromInternet,
            onChanged: (value) {
              setState(() {
                loadFromInternet = value;
              });
            },
          ),
        ],
      ),
      body: FutureBuilder<List<String>>(
        future: _loadJson(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(snapshot.data![index]));
              },
            );
          }
        },
      ),
    );
  }
}
