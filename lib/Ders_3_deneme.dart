import 'dart:io';

bool sinav = false;

class Insan {
  // field -- özellikler
  String? ad;
  String? soyad;

  Insan(this.ad, this.soyad);  // Constructor

  void konus() {
    print("Engeli yoksa insanlar konusur");
  }

  @override
  String toString() {
    return "$ad $soyad";  // Ad ve Soyadı geri döndürüyoruz
  }
}

class Hoca extends Insan {
  Hoca(String ad, String soyad) : super(ad, soyad);

  void dersCalis() {
    print("\nHoca ders calisti");
  }

  void sinavYap() {
    print("Hoca sinav yapiyor");
    sinav = true;
  }

  @override
  void konus() {
    print("Ders Anlatir");
  }

  @override
  String toString() {
    return "Hoca: $ad $soyad";  // Hoca için özel bir çıktı formatı
  }
}

class Ogrenci extends Insan {
  Ogrenci(String ad, String soyad) : super(ad, soyad);

  void dersCalis() {
    print("\nOgrenci ders calisti");
  }

  void sinavaGir() {
    if (sinav == true) {
      print("Ogrenci sinava girdi");
    } else {
      print("Sinav baslamamis");
    }
  }

  @override
  void konus() {
    print("Soru Sorar");
  }

  @override
  String toString() {
    return "Ogrenci: $ad $soyad";  // Öğrenci için özel bir çıktı formatı
  }
}

class Sekreter extends Insan {
  List<Hoca> hocaListesi = [];
  List<Ogrenci> ogrenciListesi = [];

  Sekreter(String ad, String soyad) : super(ad, soyad);

  void hocaEkle(String hocaIsim, String hocaSoyisim) {
    Hoca yeniHoca = Hoca(hocaIsim, hocaSoyisim);
    hocaListesi.add(yeniHoca);
  }

  void ogrenciEkle(String ogrenciIsim, String ogrenciSoyisim) {
    Ogrenci yeniOgrenci = Ogrenci(ogrenciIsim, ogrenciSoyisim);
    ogrenciListesi.add(yeniOgrenci);
  }
}

void main() {
  Sekreter s1 = Sekreter("Sekreter_ad", "Sekreter_soyad");
  s1.hocaEkle("Sinan", "Basarslan");
  s1.ogrenciEkle("Eren", "Akkoc");
  s1.hocaEkle("Herhangibir", "Hoca");
  s1.ogrenciEkle("Herhangibir", "Ogrenci");

  print("Hocalar Listesi:");
  for (var hoca in s1.hocaListesi) {
    print(hoca);  // toString metodu çağrılır
  }

  print("\nOgrenciler Listesi:");
  for (var ogrenci in s1.ogrenciListesi) {
    print(ogrenci);  // toString metodu çağrılır
  }

  Hoca h1 = Hoca("Sinan", "Basarslan");
  h1.dersCalis();
  h1.sinavYap();

  Ogrenci o1 = Ogrenci("Eren", "Akkoc");
  o1.dersCalis();
  o1.sinavaGir();
}
