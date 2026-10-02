import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String nama;
  final String nim;
  final String hobi;
  final int skorAktivitas;

  const ProfileCard({
    Key? key,
    required this.nama,
    required this.nim,
    required this.hobi,
    required this.skorAktivitas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Digit NIM (20240801091): digit terakhir = 1, digit ke-2 dari belakang = 9
    final int digitTerakhir = int.parse(nim[nim.length - 1]);
    final int digitKeDua = int.parse(nim[nim.length - 2]);

    final double lebarKartu = 320.0 + (digitKeDua * 5); // 365.0
    final double radius = 12.0 + (digitTerakhir * 1.5); // 13.5
    final double ukuranLogo = 60.0 + (digitTerakhir * 2); // 62.0
    final double jarak = 15.0 + digitTerakhir; // 16.0

    const TextStyle detailStyle = TextStyle(fontWeight: FontWeight.w600);

    return Container(
      width: lebarKartu,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header (horizontal)
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(radius),
                ),
                child: FlutterLogo(size: ukuranLogo),
              ),
              SizedBox(width: jarak),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Kartu Praktikan',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(nama, style: const TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ],
          ),
          const Divider(thickness: 1.5),
          // Detail identitas (vertikal)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('NIM: $nim', style: detailStyle),
              Text('Hobi: $hobi', style: detailStyle),
              Text('Skor Aktivitas: $skorAktivitas', style: detailStyle),
            ],
          ),
        ],
      ),
    );
  }
}