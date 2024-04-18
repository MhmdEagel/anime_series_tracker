# bird_tracker

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Tugas 7
- [x] Membuat sebuah program Flutter baru dengan tema tracker seperti tugas-tugas sebelumnya.
- [x] Membuat tiga tombol sederhana dengan masing-masing warna berbeda yang memiliki ikon dan teks untuk:
- [x] Melihat daftar item (Lihat Item)
- [x] Menambah item (Tambah Item)
- [x] Logout (Logout)
- [x] Memunculkan Snackbar dengan tulisan:
- [x] "Kamu telah menekan tombol Lihat Item" ketika tombol Lihat Item ditekan.
- [x] "Kamu telah menekan tombol Tambah Item" ketika tombol Tambah Item ditekan.
- [x] "Kamu telah menekan tombol Logout" ketika tombol Logout ditekan.
- [x] Menjawab beberapa pertanyaan berikut pada README.md pada root folder.

- [x] Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
    <br>
    <br>
    Stateless Widget adalah widget yang mempunyai sifat tidak akan berubah, ketika disebabkan oleh interaksi user maupun variabel dan nilai yang ditemukan. Stateful Widget adalah widget yang mempunyai sifat dinamis. Widget dapat berubah dengan adanya interaksi user maupun variabel dan nilai yang ditemukan.

- [x] Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
    <br>
    <br>

    - Padding, menambahkan ruang kosong di sekeliling widget tertentu. Ini memungkinkan kita untuk mengontrol jarak antara widget tersebut dan widget lain di sekitarnya. Dengan menggunakan padding, kita dapat menyesuaikan tata letak dan penampilan antarmuka pengguna kita dengan lebih baik.
    - ScaffoldMessenger, mengelola pesan (misalnya, snackbar, bottom sheet, atau dialog) di dalam widget Scaffold secara global. Ini memungkinkan kita untuk menampilkan pesan di seluruh halaman aplikasi tanpa harus memiliki akses langsung ke BuildContext tempat pesan tersebut diperlukan.
    - Icon, digunakan untuk menampilkan ikon dari berbagai ikon yang telah disediakan oleh Flutter atau ikon kustom kita sendiri.
    - Text, digunakan untuk menampilkan teks di antarmuka pengguna aplikasi. Ini adalah salah satu widget paling dasar dan paling umum digunakan dalam pengembangan aplikasi Flutter karena hampir setiap aplikasi memerlukan tampilan teks.

    
- [x] Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)
    <br>
    <br>
    1. Untuk membuat sebuah aplikasi flutter kita hanya perlu menjalankan perintah pada terminal yaitu
    ```
    flutter create <nama aplikasi>
    ```
    2. Untuk menambahkan tombol pada aplikasi flutter kita perlu mendefinisikan tipe item untuk masing-masing card melalui constructor class yang akan kita buat, yang akan berisi data nama dari tombolnya, iconnya, dan juga warna dari tombolnya
    ```
    class TrackerItem {
        final String name;
        final IconData icon;
        final Color? color;

        TrackerItem(this.name, this.icon, this.color);
    }
    ```
    3. kemudian kita akan membuat tombol-tombolnya menjadi sebuah list yang nantinya akan kita map sebagai children dari widget GridView
    ```
    final List<TrackerItem> items = [
    TrackerItem("Lihat Burung", Icons.radar, Colors.brown[800]),
    TrackerItem("Tambah Burung", Icons.add_box, Colors.purple[800]),
    TrackerItem("Logout", Icons.logout, Colors.red[800]),
  ];
    ```
    4. kemudian untuk menampilkan semua tombol pada halaman kita perlu menambahkan widget scaffold, yang di dalamnya memiliki grid view yang akan menampilkan setiap item didalam list TrackerItem
    ```
    Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bird Tracker',
        ),
      ),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'PBP\'s Tracker', // Text yang menandakan tracker
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((TrackerItem item) {
                  // Iterasi untuk setiap item
                  return TrackerCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
      drawer: const LeftDrawer(),
    );
    ```
    5. kita perlu membuat custom widget TrackerCard untuk menampilkan item pada list yang sudah kita buat
    ```
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
            ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        child: Container(
            // Container untuk menyimpan Icon dan Text
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
    ```
- [x] Melakukan add-commit-push ke GitHub.