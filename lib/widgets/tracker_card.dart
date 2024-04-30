import 'package:flutter/material.dart';
import 'package:anime_series_tracker/screens/trackerlist_form.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:anime_series_tracker/screens/list_anime.dart';
import 'package:anime_series_tracker/screens/login.dart';

class TrackerCard extends StatelessWidget {
  final TrackerItem item;

  const TrackerCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Material(
      color: Colors.indigo,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () async {
          // Memunculkan SnackBar ketika diklik
          // ScaffoldMessenger.of(context)
          //   ..hideCurrentSnackBar()
          //   ..showSnackBar(SnackBar(
          //       content: Text("Kamu telah menekan tombol ${item.name}!")));
          if (item.name == "Tambah Anime") {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(const SnackBar(
                  content: Text("Kamu telah menekan tombol Tambah Anime!")));
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const TrackerFormPage()));
          } else if (item.name == "Lihat Anime") {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(const SnackBar(
                  content: Text("Kamu telah menekan tombol Lihat Anime!")));
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AnimePage()),
            );
          }
          if (item.name == "Logout") {
            final response = await request.logout(
                // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                "http://127.0.0.1:8000/auth/logout/");
            String message = response["message"];
            if (context.mounted) {
              if (response['status']) {
                String uname = response["username"];
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("$message Sampai jumpa, $uname."),
                ));
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                  ),
                );
              }
            }
          }
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          color: item.color,
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TrackerItem {
  final String name;
  final IconData icon;
  final Color? color;

  TrackerItem(this.name, this.icon, this.color);
}
