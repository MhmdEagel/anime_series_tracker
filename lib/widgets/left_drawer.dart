import 'package:anime_series_tracker/screens/trackerlist_form.dart';
import 'package:flutter/material.dart';
import 'package:anime_series_tracker/screens/menu.dart';
import 'package:anime_series_tracker/screens/list_anime.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Column(
              children: [
                Text(
                  'Anime Tracker',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text("Temukan seluruh anime yang kamu sukai disini!",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    textAlign: TextAlign.center),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_box),
            title: const Text('Tambah Anime'),
            // Bagian redirection ke TrackerFormPage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TrackerFormPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.library_books_rounded),
            title: const Text('Daftar Anime'),
            onTap: () {
              // Route menu ke halaman buku
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AnimePage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
