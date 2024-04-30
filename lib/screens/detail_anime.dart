import 'package:anime_series_tracker/screens/list_anime.dart';
import 'package:flutter/material.dart';
import 'package:anime_series_tracker/models/anime.dart';
import 'package:anime_series_tracker/widgets/left_drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class DetailAnime extends StatefulWidget {
  const DetailAnime({super.key, this.id});

  final int? id;
  @override
  State<DetailAnime> createState() => _DetailAnimeState();
}

class _DetailAnimeState extends State<DetailAnime> {
  Future<List<Anime>> fetchAnime() async {
    // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
    var url = Uri.parse('http://127.0.0.1:8000/json/${widget.id}');
    var response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );
    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    // melakukan konversi data json menjadi object Anime
    List<Anime> listAnime = [];
    for (var d in data) {
      if (d != null) {
        listAnime.add(Anime.fromJson(d));
      }
    }
    return listAnime;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anime'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
          future: fetchAnime(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return const Column(
                  children: [
                    Text(
                      "Tidak ada data Anime.",
                      style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) => Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${snapshot.data![index].fields.name}",
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text("${snapshot.data![index].fields.episodes}"),
                        const SizedBox(height: 10),
                        Text("${snapshot.data![index].fields.synopsis}"),
                        const SizedBox(height: 10),
                        Text("${snapshot.data![index].fields.rating}"),
                        const SizedBox(height: 10),
                        Text("${snapshot.data![index].fields.studio}"),
                        const SizedBox(height: 10),
                        Text("${snapshot.data![index].fields.genre}"),
                        const SizedBox(height: 10),
                        Text(convertDateTimeDisplay(snapshot
                            .data![index].fields.releaseDate
                            .toString())),
                        const SizedBox(height: 10),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const AnimePage(),
                                  ));
                            
                            },
                            child: const Text("Back to all items"))
                      ],
                    ),
                  ),
                );
              }
            }
          }),
    );
  }
}

String convertDateTimeDisplay(String date) {
  final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
  final DateFormat serverFormater = DateFormat('dd-MM-yyyy');
  final DateTime displayDate = displayFormater.parse(date);
  final String formatted = serverFormater.format(displayDate);
  return formatted;
}
