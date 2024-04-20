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

## Tugas 8

- [x] Membuat minimal satu halaman baru pada aplikasi, yaitu halaman formulir tambah item baru dengan ketentuan sebagai berikut:
- [x] Memakai minimal tiga elemen input, yaitu name, amount, description. Tambahkan elemen input sesuai dengan model pada aplikasi tugas Django yang telah kamu buat.
- [x] Memiliki sebuah tombol Save.
- [x] Setiap elemen input di formulir juga harus divalidasi dengan ketentuan sebagai berikut:
- [x] Setiap elemen input tidak boleh kosong.
- [x] Setiap elemen input harus berisi data dengan tipe data atribut modelnya.
- [x] Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol Tambah Item pada halaman utama.
- [x] Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru.
- [x] Membuat sebuah drawer pada aplikasi dengan ketentuan sebagai berikut:
- [x] Drawer minimal memiliki dua buah opsi, yaitu Halaman Utama dan Tambah Item.
- [x] Ketika memiih opsi Halaman Utama, maka aplikasi akan mengarahkan pengguna ke halaman utama.
- [x] Ketika memiih opsi Tambah Item, maka aplikasi akan mengarahkan pengguna ke halaman form tambah item baru.
- [x] Menjawab beberapa pertanyaan berikut pada README.md pada root folder (silakan modifikasi README.md yang telah kamu buat sebelumnya; tambahkan subjudul untuk setiap tugas).

- [x] Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!
      <br>
      <br>
      method push dengan pushReplacement memiliki perbedaan pada stack routenya, dimana untuk method .push() akan menambahkan route pada stack route yang sudah ada, sedangkan pushReplacement() akan mengganti stack route yang sudah dengan stack route yang baru

- [x] Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!
      <br>
      <br>

  1. Container: Widget ini digunakan untuk mengatur tata letak dan dekorasi widget lain.
  2. Row dan Column: Digunakan untuk mengatur widget secara horizontal (Row) atau vertikal (Column).
  3. Stack: Menggabungkan widget dalam tumpukan, memungkinkan penumpukan dan pengaturan tepat.
  4. Flex: Menggunakan sistem flex untuk mengatur proporsi ruang antara widget dalam arah tertentu.
  5. GridView dan ListView: Untuk menampilkan daftar atau grid widget dengan cara yang teratur.

- [x] Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
      <br>
      <br>

  1. TextFormField, aplikasi bird tracker akan menerima input nama burung, nama ilmiah burung, ordo burungnya, total spesies, dan asal burung yang mana tipe data adalah sehingga TextFormField digunakan. Untuk data total spesies burung data yang diterima adalah berbentu string yang mana akan diparsing menjadi inteeger.

- [x] Bagaimana penerapan clean architecture pada aplikasi Flutter?
      <br>
      <br>

  Penerapan Clean Architecture pada aplikasi Flutter melibatkan pemisahan kode menjadi beberapa lapisan yang terisolasi, seperti Presentasi (UI), Logika Bisnis (Domain), dan Data. Berikut adalah langkah-langkah umum untuk menerapkan Clean Architecture dalam aplikasi Flutter: 1. Domain Layer: Ini adalah lapisan inti dari aplikasi Anda yang berisi logika bisnis atau aturan bisnis. Di sini, Anda mendefinisikan model-data, aturan validasi, operasi bisnis, dan antarmuka repositori yang digunakan oleh lapisan Data. Lapisan ini harus bersih dari setiap ketergantungan pada platform tertentu seperti Flutter. 2. Data Layer: Lapisan ini bertanggung jawab atas komunikasi dengan sumber data eksternal seperti API, database lokal, atau penyimpanan berkas. Implementasi repositori yang didefinisikan di lapisan Domain dilakukan di sini. Namun, lapisan ini sendiri tidak boleh mengetahui detail platform tertentu seperti Flutter. Penggunaan konsep seperti Repository Pattern atau Data Provider adalah umum di sini. 3. Presentation Layer: Ini adalah lapisan yang berurusan langsung dengan UI dan interaksi pengguna. Di sini, Anda mengimplementasikan tampilan, widget, dan logika yang terkait dengan tampilan aplikasi. Presenter atau ViewModel bertanggung jawab untuk menerima input dari pengguna, memprosesnya menggunakan logika bisnis dari lapisan Domain, dan kemudian menampilkan hasilnya. Lapisan Presentasi harus terpisah dari detail implementasi platform seperti Flutter. 4. Dependency Injection (DI): Menggunakan pola injeksi ketergantungan adalah praktik yang baik dalam memisahkan lapisan-lapisan ini. Anda dapat menggunakan paket seperti get_it atau provider untuk mengelola ketergantungan. 5. Tes: Setiap lapisan harus dapat diuji secara terpisah dengan mudah. Lapisan Domain dan Logika Bisnis biasanya diuji secara unit, sedangkan lapisan Presentasi diuji secara widget atau integrasi. 6. Flutter Module: Biasanya, Anda akan memiliki modul Flutter terpisah yang bertanggung jawab atas tampilan dan navigasi antarmuka pengguna. Modul ini akan menggunakan lapisan Presentasi dari Clean Architecture Anda. 7. Implementasi Cross-cutting Concerns: Hal seperti logging, manajemen keadaan (state management), navigasi, dan validasi input adalah contoh dari kekhawatiran yang memotong lintas lapisan. Mereka harus diimplementasikan dengan cara yang memisahkan dari lapisan Domain dan Presentasi.
  <br><br>
  Penerapan Clean Architecture di Flutter memungkinkan untuk memisahkan logika bisnis dari detail implementasi platform, memfasilitasi pengujian yang lebih baik, dan meningkatkan ketahanan terhadap perubahan dalam teknologi atau kebutuhan aplikasi.

- [x] Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)

  1. untuk menambahkan pada aplikasi kita perlu menambahkan file dart baru untuk halaman formnya dengan nama trackerlist_form.dart dan kita perlu menambahkan drawer yang sudah kita buat sebelumnya

  ```
  Scaffold(
    appBar: AppBar(
        title: const Center(
            child: Text(
            'Form Tambah Burung',
            ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        ),
        drawer: const LeftDrawer(),
        body: Form(
        child: SingleChildScrollView(),
        ),
    );
  ```
  <br>
  <br>
  Untuk mempersiapkan drawer, kita perlu mengimport semua halaman yang sudah kita buat untuk melakukan navigasi

  ```
  import 'package:bird_tracker/screens/trackerlist_form.dart';
  import 'package:flutter/material.dart';
  import 'package:bird_tracker/screens/menu.dart';
  ```

  selanjutnya kita juga akan menambahkan widget Drawer untuk membuat drawer yang kita inginkan

  ```
  import 'package:flutter/material.dart';

  class LeftDrawer extends StatelessWidget {
    const LeftDrawer({super.key});

    @override
        Widget build(BuildContext context) {
        return Drawer(
            child: ListView(
                children: [
                    const DrawerHeader(
                    // TODO: Bagian drawer header
                    ),
                    // TODO: Bagian routing
                ],
            ),
        );
    }
  }
  ```


  kemudian kita perlu menambahkan setiap routing ke halaman yang telah kita buat yaitu tracker form page dan main page
  ```
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
            title: const Text('Tambah Burung'),
            // Bagian redirection ke TrackerFormPage
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const TrackerFormPage()));
            },
          ),
  ```
  kemudian kita juga perlu menghias drawer dengan menambahkan widget DrawerHeader pada widget Drawer yang sudah kita buat
  ```
  const DrawerHeader(
    decoration: BoxDecoration(
        color: Colors.indigo,
    ),
    child: Column(
        children: [
            Text(
                'Book Tracker',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Text("Catat seluruh progress membaca bukumu disini!",
                // TODO: Tambahkan gaya teks dengan center alignment, font ukuran 15, warna putih, dan weight biasa
            ),
        ],
    ),
  ),
  ```



  

  2. kemudian kita perlu menambahkan field form dengan membuat variabel yaitu \_name, \_sciname, \_total, \_ordo, \_origin dan juga menambahkan \_formkey

  ```
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  String _sciName = "";
  int _total = 0;
  String _ordo = "";
  String _origin = "";
  ```

  3. kemudian kita akan menambahkan widget Column sebagai child dari SingleChildScrollView()

  ```
  child: SingleChildScrollView(
        child: Column()
    ),
  ```

  4. kemudian kita akan menambahkan TextFormField sebagai children dari column yang sudah kita buat untuk masing-masing field yang akan kita buat, kemudian kita akan menambahkan validator agar inputan user sesuai dengan tipe data yang diminta dan tidak boleh kosong

  ```
  Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Nama Burung",
                  labelText: "Nama Burung",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    _name = value!;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Nama Burung tidak boleh kosong!";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Nama Ilmiah",
                  labelText: "Nama Ilmiah",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    _sciName = value!;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Nama Ilmiah tidak boleh kosong!";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Ordo Burung",
                  labelText: "Ordo Burung",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    _ordo = value!;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Ordo Burung tidak boleh kosong!";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Asal Daerah Burung",
                  labelText: "Asal Daerah Burung",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    _origin = value!;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Asal Daerah Burung tidak boleh kosong!";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Jumlah Spesies Burung",
                  labelText: "Jumlah Spesies Burung",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    _total = int.tryParse(value!) ?? 0;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Jumlah Spesies Burung tidak boleh kosong!";
                  }
                  if (int.tryParse(value)== null) {
                    return "Jumlah Spesies Burung harus berupa angka";
                  }

                  return null;
                },
              ),
            ),
  ```

  5. Untuk memunculkan data yang sudah diinput oleh user kita akan menambahkan sebuah pesan popup yang mana akan menampilkan seluruh data yang telah diinput user, dan kita juga perlu menambahkan tombol yang diperlukan untuk menyimpan data yang diinput oleh user, yaitu dengan menambahkan element Align yang akan berisi widget ElevatedButton .

  ```
  Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.indigo),
            ),
            onPressed: () {
                if (_formKey.currentState!.validate()) {}
            },
            child: const Text(
                "Save",
                style: TextStyle(color: Colors.white),
            ),
        ),
    ),
  ),
  ```

  6. Kemudian kita perlu menambahkan fungsi ketika tombol ditekan agar data yang dikirmmkan oleh form ditampilkan pada pesan popup pada halaman aplikasi, kemudian memunculkan value-value sebagai Widget Text, kita juga perlu menambahkan widget AlertDialog

  ```
  if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Burung berhasil tersimpan'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Nama Burung: $_name'),
                                    Text('Nama Ilmiah Burung: $_sciName'),
                                    Text('Ordo Burung: $_ordo'),
                                    Text('Asal Burung: $_origin'),
                                    Text('Jumlah Spesies : $_total')
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _formKey.currentState!.reset();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
  ```

  7. Agar dapat memunculkan pesan pada saat menekann tombol tracker card kita perlu menambahkan widget ScaffoldMessenger yang mana akan menavigasi route sesuai dengan nama item pada list yang sudah kita buat di bagian menu.dart
   ```
   InkWell(
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
   )
   ```

- [x] Melakukan add-commit-push ke GitHub.
