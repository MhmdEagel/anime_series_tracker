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

  Penerapan Clean Architecture pada aplikasi Flutter melibatkan pemisahan kode menjadi beberapa lapisan yang terisolasi, seperti Presentasi (UI), Logika Bisnis (Domain), dan Data. Berikut adalah langkah-langkah umum untuk menerapkan Clean Architecture dalam aplikasi Flutter: 1. Domain Layer: Ini adalah lapisan inti dari aplikasi Anda yang berisi logika bisnis atau aturan bisnis. Di sini, Anda mendefinisikan model-data, aturan validasi, operasi bisnis, dan antarmuka repositori yang digunakan oleh lapisan Data. Lapisan ini harus bersih dari setiap ketergantungan pada platform tertentu seperti Flutter. 2. Data Layer: Lapisan ini bertanggung jawab atas komunikasi dengan sumber data eksternal seperti API, database lokal, atau penyimpanan berkas. Implementasi repositori yang didefinisikan di lapisan Domain dilakukan di sini. Namun, lapisan ini sendiri tidak boleh mengetahui detail platform tertentu seperti Flutter. Penggunaan konsep seperti Repository Pattern atau Data Provider adalah umum di sini. 3. Presentation Layer: Ini adalah lapisan yang berurusan langsung dengan UI dan interaksi pengguna. Di sini, Anda mengimplementasikan tampilan, widget, **dan** logika yang terkait dengan tampilan aplikasi. Presenter atau ViewModel bertanggung jawab untuk menerima input dari pengguna, memprosesnya menggunakan logika bisnis dari lapisan Domain, dan kemudian menampilkan hasilnya. Lapisan Presentasi harus terpisah dari detail implementasi platform seperti Flutter. 4. Dependency Injection (DI): Menggunakan pola injeksi ketergantungan adalah praktik yang baik dalam memisahkan lapisan-lapisan ini. Anda dapat menggunakan paket seperti get_it atau provider untuk mengelola ketergantungan. 5. Tes: Setiap lapisan harus dapat diuji secara terpisah dengan mudah. Lapisan Domain dan Logika Bisnis biasanya diuji secara unit, sedangkan lapisan Presentasi diuji secara widget atau integrasi. 6. Flutter Module: Biasanya, Anda akan memiliki modul Flutter terpisah yang bertanggung jawab atas tampilan dan navigasi antarmuka pengguna. Modul ini akan menggunakan lapisan Presentasi dari Clean Architecture Anda. 7. Implementasi Cross-cutting Concerns: Hal seperti logging, manajemen keadaan (state management), navigasi, dan validasi input adalah contoh dari kekhawatiran yang memotong lintas lapisan. Mereka harus diimplementasikan dengan cara yang memisahkan dari lapisan Domain dan Presentasi.
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
                'Bird Tracker',
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


## Tugas 9

- [x] Memastikan deployment ke PWS proyek tugas Django kamu telah berjalan dengan baik.
- [x] Membuat halaman login pada proyek tugas Flutter.
  <br>
  <br>
  - untuk membuat login, kita perlu membuat file baru pada direktori screens dengan nama login.dart, yang mana nanti akan menangkap response dari view untuk integrasi dengan flutter pada django nantinya
  - ```
      import 'package:book_tracker/screens/menu.dart';
      import 'package:flutter/material.dart';
      import 'package:pbp_django_auth/pbp_django_auth.dart';
      import 'package:provider/provider.dart';

    void main() {
      runApp(const LoginApp());
    }

    class LoginApp extends StatelessWidget {
    const LoginApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Login',
            theme: ThemeData(
                primarySwatch: Colors.blue,
            ),
            home: const LoginPage(),
        );
    }
    }

    class LoginPage extends StatefulWidget {
      const LoginPage({super.key});

      @override
      State<LoginPage> createState() => _LoginPageState();
    }

    class _LoginPageState extends State<LoginPage> {
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Scaffold(
            appBar: AppBar(
                title: const Text('Login'),
            ),
            body: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        TextField(
                            controller: _usernameController,
                            decoration: const InputDecoration(
                                labelText: 'Username',
                            ),
                        ),
                        const SizedBox(height: 12.0),
                        TextField(
                            controller: _passwordController,
                            decoration: const InputDecoration(
                                labelText: 'Password',
                            ),
                            obscureText: true,
                        ),
                        const SizedBox(height: 24.0),
                        ElevatedButton(
                            onPressed: () async {
                                String username = _usernameController.text;
                                String password = _passwordController.text;

                                // Cek kredensial
                                // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                                // Untuk menyambungkan Android emulator dengan Django pada localhost,
                                // gunakan URL http://10.0.2.2/
                                final response = await request.login("http://127.0.0.1:8000/auth/login"), {
                                    'username': username,
                                    'password': password,
                                });

                                if (request.loggedIn) {
                                    String message = response['message'];
                                    String uname = response['username'];
                                    if (context.mounted) {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(builder: (context) => MyHomePage()),
                                        );
                                        ScaffoldMessenger.of(context)
                                            ..hideCurrentSnackBar()
                                            ..showSnackBar(
                                                SnackBar(content: Text("$message Selamat datang, $uname.")));
                                    }
                                } else {
                                    if (context.mounted) {
                                        showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                title: const Text('Login Gagal'),
                                                content:
                                                    Text(response['message']),
                                                actions: [
                                                    TextButton(
                                                        child: const Text('OK'),
                                                        onPressed: () {
                                                            Navigator.pop(context);
                                                        },
                                                    ),
                                                ],
                                            ),
                                        );
                                    }
                                }
                            },
                            child: const Text('Login'),
                        ),
                    ],
                ),
            ),
        );
    }
      }
    ```
  - kemudian kita perlu menambahkan CookieRequest pada main.dart
  - ```
       Widget build(BuildContext context) {
        return Provider(
            create: (_) {
                CookieRequest request = CookieRequest();
                return request;
            },
    ```
  - 
- [x] Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.
  <br>
  <br>
  
  - pertama kita perlu melakukan setup autentikasi pada django untuk aplikasi flutter, selanjutnya kita perlu membuat django app bernama authentication
  - ```
      py manage.py startapp  authentication
    ```
  - setelah itu kita perlu menambahkan authentication ke INSTALLED_APPS pada main project settings.py
  - ```
      INSTALLED_APPS = [
        ...
        'authentication'
        ...
      ]
    ```
  - kemudian kita perlu melakukan instalasi library corsheaders untuk projek django dengan menjalankan perintah dan tidak lupa untuk menyalakan virtual environment Python 
  - ```
    pip install django-cors-headers
    ``` 
  - kemudian kita juga perlu menambahkan corsheader ke variabel INSTALLED_APPS pada settings projek django
  - Kemudian kita juga perlu menambahkan bebarapa variabel pada setting.py pada main project
  - ```
      CORS_ALLOW_ALL_ORIGINS = True
      CORS_ALLOW_CREDENTIALS = True
      CSRF_COOKIE_SECURE = True
      SESSION_COOKIE_SECURE = True
      CSRF_COOKIE_SAMESITE = 'None'
      SESSION_COOKIE_SAMESITE = 'None'
    ```
  - kemudian kita juga perlu membuat views untuk login pada flutter dengan menambahkan beberapa fungsi berikut 
  - ```
      from django.contrib.auth import authenticate, login as auth_login
      from django.http import JsonResponse
      from django.views.decorators.csrf import csrf_exempt

      @csrf_exempt
      def login(request):
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username,  password=password)
        if user is not None:
            if user.is_active:
              auth_login(request, user)
              # Status login sukses.
              return JsonResponse({
                  "username": user.username,
                  "status": True,
                  "message": "Login sukses!"
                  # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
             }, status=200)
          else:
              return JsonResponse({
                  "status": False,
                  "message": "Login gagal, akun dinonaktifkan."
              }, status=401)

          else:
            return JsonResponse({
            "status": False,
              "message": "Login gagal, periksa kembali email atau kata sandi."
          }, status=401)
    ```
  - kemudian kita juga perlu membuat file urls.py untuk mengimport fungsi login yang sudah kita buat tadi
  - ```
      from django.urls import path
      from authentication.views import login

      app_name = 'authentication'

      urlpatterns = [
        path('login/', login, name='login'),
      ]
    ```
- [x] Membuat model kustom sesuai dengan proyek aplikasi Django.
- [x] Tampilkan name, amount, dan description dari masing-masing item pada halaman ini. 
  - kita perlu membuka endpoint json pada proyek django yang kita buat sebelumnya, dengan mengetik /json pada url ketika menjalankan proyek django, untuk mengambil data json
  - kemudian kita perlu menyalin json yang sudah dibuka ke dalam situs quicktype yang mana kita akan menempel data JSON yang telah disalin sebelumnya ke dalam textbox yang tersedia pada Quicktype.
  - kemudian kita perlu mengganti target language menjadi dart, kemudian kita perlu mengcopy hasil konversi
  - kemudian kita perlu mengpaste code tadi ke file baru yaitu Anime.dart pada direktori models pada direktori lib 
- [x] Membuat halaman yang berisi daftar semua item yang terdapat pada ** JSON diendpoint Django yang telah kamu deploy.
  - sebelum itu kita perlu melakukan menginstall http untuk menambahkan package http.
  -  ```
        flutter pub add http
     ```
  - kemudian kita perlu melakukan import library dan membuat juga file dart baru untuk menampilkan list dart dengan nama list_anime.dart
  - ```
      import 'package:flutter/material.dart';
      import 'package:http/http.dart' as http;
      import 'dart:convert';
      import 'package:anime_tracker/models/book.dart';
      ...
    ```
  - kemudian kita perlu menambahkan list_anime.dart dan juga melakukan request json ke projek django yang sudah kita buat
```
class _AnimePageState extends State<AnimePage> {
  Future<List<Anime>> fetchAnime() async {
    // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
    var url = Uri.parse('http://127.0.0.1:8000/json/');
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
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailAnime(id: snapshot.data![index].pk,),
                                  ));
                            },
                            child: const Text("See Detail"))
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
     
```

- [x] Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.
- [x] Halaman ini dapat diakses dengan menekan salah satu item pada halaman daftar Item.
- [x] Tampilkan seluruh atribut pada model item kamu pada halaman ini.
- [x] Tambahkan tombol untuk kembali ke halaman daftar item.
  - untuk menambahkan halaman detail pada aplikasi flutter perlu menambahkan file baru dengan nama detail_anime.dart kita perlu menambahkan code
```
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
``` 

- [x] Menjawab beberapa pertanyaan berikut pada README.md pada root folder (silakan modifikasi README.md yang telah kamu buat sebelumnya; tambahkan subjudul untuk setiap tugas).
    - Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
    <br>
    <br>
    bisa, karena kita hanya perlu melakukan http request ke server untuk mengambil data. tergantung kebutuhan akan aplikasi yang kita punya, apakah ada pertukaran data atau tidak, jika kita hendak menyimpan data ke server maka kita perlu membuat model, sebaliknya jika kita hanya perlu menampilkan informasi saja tanpa ada pertukaran data kita hanya perlu memanggil data tersebut tanpa membuat model apapun
      
    - Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
    <br>
    <br>

    CookieRequest memiliki beberapa fungsi yaitu mengirim Permintaan HTTP dengan Cookie: CookieRequest dapat digunakan untuk membuat permintaan HTTP yang menyertakan cookie tertentu. CookieRequest juga dapat digunakan untuk mengelola cookie di sisi klien.
    
    - Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.
    <br>
    <br>
    pertama pastinya kita akan melakukan request dari server agar dapat mengirimkan data json yang kita perlukan, saat kita mengambil data json dari server, data tersebut akan berbentuk tipe data string yang nantinya kita akan parsing menjadi sebuah bentuk json yang mana biasanya berupa array of items, kemudian kita juga akan melakukan looping ke tiap data yang ada di array of items yang berisi data tadi untuk ditampilkan pada tampilan flutter melalui widget
    
  
    - Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
    <br>
    <br>
    pertama kita akan melakukan input data pada ui flutter untuk melakukan proses login, yang mana nantinya akan melakukan request kepada backend django untuk mengambil data user yang terdata di django, kemudina nantinya flutter akan melakukan validasi akun yang ada pada flutter dengan juga mengirimkan method post ke django untuk membandingkan data user login dengan data user yang ada di django, yang nantinya akan dilanjutkan dengan menampilkan halaman utama aplikasi flutter jika berhasil divalidasi oleh backend django
    
- [x] Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.
  - List View : digunakan untuk menampilkan daftar item secara berurutan, yang biasanya berisi data dinamis seperti daftar kontak, pesan, atau entri dari basis data. ListView memungkinkan pengguna untuk menggulir ke bawah atau ke atas melalui daftar item, sehingga memudahkan navigasi dan interaksi.
  - Elevated Button : sebuah tombol untuk menangkap input pengguna, misalnya ketika pengguna mengetuk tombol menggunakan layar sentuh atau mouse.
  - Navigator :  digunakan untuk mengelola navigasi antar layar (atau halaman) dalam aplikasi.
  - List Tile :  digunakan untuk menampilkan item dalam daftar dengan tata letak yang telah ditentukan secara bawaan. 
  - FutureBuilder : digunakan untuk membangun tampilan berdasarkan hasil yang diperoleh dari suatu Future.
  - Future : mewakili nilai atau hasil yang akan tersedia di masa depan atau secara asinkron, biasanya digunakan ketika kita melakukan fetching data pada sebuah aplikasi 
- [x] Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
- [x] Melakukan add-commit-push ke GitHub.


