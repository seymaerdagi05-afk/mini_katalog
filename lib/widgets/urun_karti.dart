import 'package:flutter/material.dart';

class UrunKarti extends StatelessWidget {
  final String urunAdi;
  final String fiyat;

  const UrunKarti({super.key, required this.urunAdi, required this.fiyat});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10), // Dış boşluk [cite: 30]
      elevation: 4,
      child: ListTile( // Liste elemanı yapısı [cite: 31]
        leading: const CircleAvatar(
          child: Icon(Icons.image), // Şimdilik yer tutucu ikon [cite: 41]
        ),
        title: Text(urunAdi, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(fiyat),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          print('$urunAdi tıklandı');
        },
      ),
    );
  }
}