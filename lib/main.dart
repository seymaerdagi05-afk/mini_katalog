import 'package:flutter/material.dart';
import 'package:mini_katalog/models/urun_model.dart';

void main() {
  runApp(const MiniKatalogApp());
}

class MiniKatalogApp extends StatelessWidget {
  const MiniKatalogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Katalog',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: KatalogAnaSayfa(),
    );
  }
}

class KatalogAnaSayfa extends StatefulWidget {
  KatalogAnaSayfa({super.key});

  @override
  State<KatalogAnaSayfa> createState() => _KatalogAnaSayfaState();
}

class _KatalogAnaSayfaState extends State<KatalogAnaSayfa> {
 
  final List<Urun> urunler = [
    Urun(ad: "Akıllı Telefon", fiyat: "25.000 TL", aciklama: "8GB RAM, 128GB Hafıza", resim: "telefon.jpg"),
    Urun(ad: "Laptop", fiyat: "45.000 TL", aciklama: "i7 İşlemci, 16GB RAM", resim: "laptop.jpg"),
    Urun(ad: "Kulaklık", fiyat: "3.500 TL", aciklama: "Bluetooth 5.0, ANC", resim: "kulaklik.jpg"),
    Urun(ad: "Saat", fiyat: "7.000 TL", aciklama: "Suya Dayanıklı, GPS", resim: "saat.jpeg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mini Katalog Uygulaması'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: urunler.length,
        itemBuilder: (context, index) {
          final urun = urunler[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetaySayfasi(urun: urun)),
              );
            },
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                        child: Image.asset(
                          "assets/images/${urun.resim}",
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.broken_image, size: 50, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(urun.ad, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        const SizedBox(height: 5),
                        Text(urun.fiyat, style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            icon: Icon(
                              urun.isFavorite ? Icons.favorite : Icons.favorite_border,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              setState(() {
                                urun.isFavorite = !urun.isFavorite;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetaySayfasi extends StatelessWidget {
  final Urun urun;
  const DetaySayfasi({super.key, required this.urun});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(urun.ad)), 
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/images/${urun.resim}",
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.image, size: 100, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(urun.ad, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            Text(urun.fiyat, style: const TextStyle(fontSize: 22, color: Colors.blue)),
            const Divider(height: 40),
            const Text("Ürün Açıklaması:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(urun.aciklama, style: const TextStyle(fontSize: 16, height: 1.5)),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Geri Dön"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
