//Eren Akkoç 22120205045
//Mobil Programlama 2.Hafta Odevi

import 'dart:io';

class Product{
  String? urun_adi;
  double? fiyat;

  Product(this.urun_adi,this.fiyat);
}

class ShoppingCart {
  List<Product> urun_listesi = [];
  double toplam_tutar=0;

  // Ürün ekleme metodu
  void urunEkle() {
    print("Ürün adı girin: ");
    String? urunAdi = stdin.readLineSync();

    print("Ürün fiyatı girin: ");
    double? fiyat = double.tryParse(stdin.readLineSync()!);

    if (urunAdi != null && fiyat != null) {
      Product yeniUrun = Product(urunAdi, fiyat);
      urun_listesi.add(yeniUrun);
      print("Ürün sepete eklendi: $urunAdi - $fiyat TL");
    } else {
      print("Geçersiz giriş yaptınız.");
    }
  }

  void tutarHesaplama(){
    toplam_tutar=0;
    for(var urun in urun_listesi){
      toplam_tutar +=urun.fiyat ?? 0;
    }
    print("Toplam Tutar: $toplam_tutar tl");
  }
}

void main(){

  ShoppingCart sc=ShoppingCart();

  int yas=0;
  String musteri_no;

  while(true){

    print("Giris yapmak icin telefon numaranızı ve yasinizi giriniz\n");
    print("Telefon No:");
    musteri_no=stdin.readLineSync()!;
    print("Yas: ");
    yas=int.parse(stdin.readLineSync()!);

    if(yas != null && musteri_no.length==11){
      print("\nGiris Yapildi\n");

      while(true){

        print("1-Ürün Ekleme");
        print("2-Sepetim");
        print("3-Çıkış");

        print("\nYapmak istediginiz islemi seciniz.");
        String? secim=stdin.readLineSync();

        switch(secim){
          case '1':
            sc.urunEkle();
            break;
          case '2':
            if(sc.urun_listesi.length==0){
              print("Sepetinizde urun bulunmuyor\n");
            }
            else{
              for(var urun in sc.urun_listesi){
                print(urun.urun_adi! + "-----" +urun.fiyat.toString() + "tl");
              }
              sc.tutarHesaplama();

              print("\n1-Odeme Yap");
              print("2-Geri");
              print("Yapmak istediginiz islemi seciniz");
              String? secim2=stdin.readLineSync();
              switch(secim2){

                case '1':
                  sc.tutarHesaplama();
                  double? hesap;
                  if(yas<18){
                        //%10 indirim
                        hesap=((sc.toplam_tutar*90)/100);
                        print("%10 indirim yapıldı");
                        print("$hesap tl Odemek icin 'p' tusuna basiniz\n\n\n");

                        while (true){
                          String? odeme=stdin.readLineSync();
                          if(odeme=='p'){
                            print("Odeme basarili IYI GUNLER.");
                            return;
                          }
                          else{
                            print("Tekrar Deneyiniz");
                          }
                        }

                      }
                      else if(18<=yas && yas<=60){
                        //%5 indirim
                        hesap=((sc.toplam_tutar*95)/100);
                        print("%5 indirim yapıldı");
                        print("$hesap tl Odemek icin 'p' tusuna basiniz\n\n\n");

                        while (true){
                          String? odeme=stdin.readLineSync();
                          if(odeme=='p'){
                            print("Odeme basarili IYI GUNLER.");
                            return;
                          }
                          else{
                            print("Tekrar Deneyiniz");
                          }
                        }
                      }
                      else if(60<=yas){
                        // %15 indirim
                        hesap=((sc.toplam_tutar*85)/100);
                        print("%15 indirim yapıldı");
                        print("$hesap tl Odemek icin 'p' tusuna basiniz\n\n\n");

                        while (true){
                          String? odeme=stdin.readLineSync();
                          if(odeme=='p'){
                            print("Odeme basarili IYI GUNLER.");
                            return;
                          }
                          else{
                            print("Tekrar Deneyiniz");
                          }
                        }
                      }
                  break;
                case '2':
                  break;
                default:
                  print("Geçersiz seçim. Lütfen tekrar deneyin.");
              }


            }
          case'3':
            print("Cikis Yapiliyor...");
            return;

          default:
            print("Geçersiz seçim. Lütfen tekrar deneyin.");
        }
      }

    }

    else {
      print("\nGiris yapilamadi lutfen tekrar deneyiniz\n");
    }

  }

}


