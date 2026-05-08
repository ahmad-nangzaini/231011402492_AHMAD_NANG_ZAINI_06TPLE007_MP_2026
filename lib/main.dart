import 'package:flutter/material.dart';

void main() {
  runApp(const WorkshopApp());
}

class WorkshopApp extends StatelessWidget {
  const WorkshopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workshop Kampus',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const WorkshopListPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WorkshopListPage extends StatelessWidget {
  const WorkshopListPage({super.key});

  // Data workshop (contoh)
  final List<Map<String, String>> workshops = const [
    {
      'title': 'Flutter UI/UX Workshop',
      'date': '20 Mei 2026',
      'location': 'Lab Multimedia, Lt. 3',
      'quota': '40 peserta',
    },
    {
      'title': 'Mobile Programming with Dart',
      'date': '22 Mei 2026',
      'location': 'Ruang Sidang Utama',
      'quota': '25 peserta',
    },
    {
      'title': 'State Management (Riverpod)',
      'date': '25 Mei 2026',
      'location': 'Online (Zoom)',
      'quota': '100 peserta',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daftar Workshop Kampus',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: workshops.map((workshop) {
            return _buildWorkshopCard(context, workshop);
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildWorkshopCard(BuildContext context, Map<String, String> workshop) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Judul Workshop
              Text(
                workshop['title']!,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12.0),

              // Tanggal
              Row(
                children: [
                  const Icon(Icons.calendar_today, size: 16.0, color: Colors.grey),
                  const SizedBox(width: 8.0),
                  Text(
                    workshop['date']!,
                    style: const TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),

              // Lokasi
              Row(
                children: [
                  const Icon(Icons.location_on, size: 16.0, color: Colors.grey),
                  const SizedBox(width: 8.0),
                  Text(
                    workshop['location']!,
                    style: const TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),

              // Kuota
              Row(
                children: [
                  const Icon(Icons.people, size: 16.0, color: Colors.grey),
                  const SizedBox(width: 8.0),
                  Text(
                    'Kuota: ${workshop['quota']}',
                    style: const TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),

              // Tombol Daftar
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _showRegistrationSnackbar(context, workshop['title']!);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'Daftar Workshop',
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showRegistrationSnackbar(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Berhasil mendaftar ke workshop: $title'),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}