import 'package:flutter/material.dart';
import 'package:bird_tracker/screens/trackerlist_form.dart';


class TrackerCard extends StatelessWidget {
  final TrackerItem item;

  const TrackerCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.indigo,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          // ScaffoldMessenger.of(context)
          //   ..hideCurrentSnackBar()
          //   ..showSnackBar(SnackBar(
          //       content: Text("Kamu telah menekan tombol ${item.name}!")));
          if (item.name == "Tambah Burung") {
             ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(const SnackBar(
                content: Text("Kamu telah menekan tombol Tambah Burung!")));
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const TrackerFormPage()));
          } 
          if (item.name == "Lihat Burung") {
            ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(const SnackBar(
                content: Text("Kamu telah menekan tombol Lihat Burung!")));
          }
          if (item.name == "Logout") {
            ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(const SnackBar(
                content: Text("Kamu telah menekan tombol Logout!")));
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
