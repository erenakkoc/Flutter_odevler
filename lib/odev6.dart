import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BirinciSayfa(),
    );
  }
}

class BirinciSayfa extends StatefulWidget {
  @override
  _BirinciSayfaState createState() => _BirinciSayfaState();
}

class _BirinciSayfaState extends State<BirinciSayfa> {
  final TextEditingController _sayi1Controller = TextEditingController();
  final TextEditingController _sayi2Controller = TextEditingController();
  String _toplamSonucu = "Toplam: ";

  void _toplamHesapla() {
    double sayi1 = double.tryParse(_sayi1Controller.text) ?? 0;
    double sayi2 = double.tryParse(_sayi2Controller.text) ?? 0;
    double toplam = sayi1 + sayi2;

    setState(() {
      _toplamSonucu = "Toplam: $toplam";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Birinci Sayfa')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _sayi1Controller,
              decoration: InputDecoration(labelText: 'Birinci Sayı'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _sayi2Controller,
              decoration: InputDecoration(labelText: 'İkinci Sayı'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toplamHesapla,
              child: Text('Toplamı Hesapla'),
            ),
            SizedBox(height: 20),
            Text(_toplamSonucu),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => IkinciSayfa()),
                );
              },
              child: Text('2. Sayfaya Git'),
            ),
          ],
        ),
      ),
    );
  }
}


class IkinciSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('İkinci Sayfa'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Bu bir uyarıdır')),
                );
              },
              child: Text('Alert Butonu'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Popup'),
                    content: Text('Bu bir pop uptır'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Kapat'),
                      ),
                    ],
                  ),
                );
              },
              child: Text('Popup Butonu'),
            ),
          ],
        ),
      ),
    );
  }
}
