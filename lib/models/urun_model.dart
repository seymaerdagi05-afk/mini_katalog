class Urun {
  final String ad;
  final String fiyat;
  final String aciklama;
  final String resim;
  bool isFavorite; // 5. Gün

  Urun({
    required this.ad,
    required this.fiyat,
    required this.aciklama,
    required this.resim,
    this.isFavorite = false,
  });
}