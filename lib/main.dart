import 'package:flutter/material.dart';
import 'profile_card.dart';

const String nim = '20240801091';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int digitTerakhir = int.parse(nim[nim.length - 1]); // 1
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Ganjil -> toska pastel, genap -> amber pastel
        scaffoldBackgroundColor:
        digitTerakhir % 2 != 0 ? Colors.tealAccent[100] : Colors.amber[100],
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int duaDigitTerakhir = int.parse(nim.substring(nim.length - 2)); // 91
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ProfileCard(
            nama: 'Nunezco',
            nim: nim,
            hobi: 'Coding',
            skorAktivitas: duaDigitTerakhir + 50, // 91 + 50 = 141
          ),
        ],
      ),
    );
  }
}