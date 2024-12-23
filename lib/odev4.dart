//Eren Akkoç 22120205045
//hoca && 123 girişi için farklı bir senaryo bulunmaktadır
//ogrenci && 123 girişi için farklı bir senaryo bulunmaktadır
//sekreter && 123 girişi için farklı bir senaryo bulunmaktadır
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(18, 52, 86, 0.5),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(18, 52, 86, 0.9),
        foregroundColor: Colors.white70,
        title: const Text("IMU APP"),
      ),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment(0.0, -0.7),
            child: SizedBox(
              width: 250,
              height: 250,
              child: Image.asset("assets/images/download-removebg.png"),
            ),
          ),
          Positioned(
            top: 300, // Y ekseninde yukarıdan ne kadar mesafe
            left: 20, // Sol taraftan ne kadar mesafe
            right: 20, // Sağ taraftan ne kadar mesafe
            child: TextField(
              controller: _usernameController,
              style: TextStyle(color: Colors.white70), // Yazı rengi
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromRGBO(0, 188, 212, 0.8),
                border: OutlineInputBorder(),
                labelText: "Kullanıcı Adı",
                labelStyle: TextStyle(color: Colors.white70),
              ),
            ),
          ),
          Positioned(
            top: 375, // Y ekseninde yukarıdan ne kadar mesafe
            left: 20, // Sol taraftan ne kadar mesafe
            right: 20, // Sağ taraftan ne kadar mesafe
            child: TextField(
              controller: _passwordController,
              style: TextStyle(color: Colors.white70), // Yazı rengi
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromRGBO(0, 188, 212, 0.8),
                border: OutlineInputBorder(),
                labelText: "Şifre",
                labelStyle: TextStyle(color: Colors.white70),
              ),
              obscureText: true,
            ),
          ),
          Positioned(
            top: 450, // Butonun yukarıdan mesafesi
            left: 150,
            right: 150,
            child: ElevatedButton(
              onPressed: () {
                String username = _usernameController.text;
                String password = _passwordController.text;

                // Kullanıcı adı ve şifre kontrolü
                if (username == "ogrenci" && password == "123") {
                  // Doğru giriş yapıldığında yeni sayfaya geç
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OgrenciPage()),
                  );
                } else if (username == "hoca" && password == "123") {
                  // Doğru giriş yapıldığında yeni sayfaya geç
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HocaPage()),
                  );
                } else if (username == "sekreter" && password == "123") {
                  // Doğru giriş yapıldığında yeni sayfaya geç
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SekreterPage()),
                  );
                } else {
                  // Hatalı giriş uyarısı
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Kullanıcı adı veya şifre hatalı!"),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(0, 188, 212, 0.8),
                // Buton arka plan rengi
                foregroundColor: Colors.black, // Buton yazı rengi
              ),
              child: Text("Giriş Yap"),
            ),
          )
        ],
      ),
    );
  }
}

class HocaPage extends StatefulWidget {
  @override
  _HocaPageState createState() => _HocaPageState();
}

class _HocaPageState extends State<HocaPage> {
  final TextEditingController _vizeController = TextEditingController();
  final TextEditingController _finalController = TextEditingController();
  String _ortalama = "";

  void _hesaplaOrtalama() {
    double vize = double.tryParse(_vizeController.text) ?? 0;
    double finalNot = double.tryParse(_finalController.text) ?? 0;
    double ortalama = (vize * 0.4) + (finalNot * 0.6);

    setState(() {
      _ortalama = "Ortalama: ${ortalama.toStringAsFixed(2)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(18, 52, 86, 0.5),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(18, 52, 86, 0.9),
        foregroundColor: Colors.white70,
        title: const Text("Ogretmen Sayfası"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              controller: _vizeController,
              style: TextStyle(color: Colors.white70), // Yazı rengi
              decoration: InputDecoration(
                labelText: "Vize Notu",
                labelStyle: TextStyle(color: Colors.white70),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              controller: _finalController,
              style: TextStyle(color: Colors.white70), // Yazı rengi
              decoration: InputDecoration(
                labelText: "Final Notu",
                labelStyle: TextStyle(color: Colors.white70),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          ElevatedButton(
            onPressed: _hesaplaOrtalama,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white70, // Buton arka plan rengi
              foregroundColor: Colors.black, // Buton yazı rengi
            ),
            child: Text("Ortalama Hesapla"),
          ),
          SizedBox(height: 20),
          Text(
            _ortalama,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

class OgrenciPage extends StatefulWidget {
  @override
  _OgrenciPageState createState() => _OgrenciPageState();
}

class _OgrenciPageState extends State<OgrenciPage> {
  final TextEditingController _todoController = TextEditingController();
  List<String> _todoList = [];

  void _addTodo() {
    setState(() {
      _todoList.add(_todoController.text);
      _todoController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(18, 52, 86, 0.5),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(18, 52, 86, 0.9),
        foregroundColor: Colors.white70,
        title: const Text("Ogrenci Sayfası"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              controller: _todoController,
              style: TextStyle(color: Colors.white70), // Yazı rengi
              decoration: InputDecoration(
                labelText: "Yapılacak Görev Girin",
                labelStyle: TextStyle(color: Colors.white70),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _addTodo,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white70, // Buton arka plan rengi
              foregroundColor: Colors.black, // Buton yazı rengi
            ),
            child: Text("Ekle"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todoList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  // Görevler arasındaki boşluk
                  padding: EdgeInsets.all(15.0),
                  // İçerik için boşluk
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 188, 212, 0.8),
                    // Arka plan rengi
                    borderRadius: BorderRadius.circular(10.0),
                    // Kenar yuvarlama
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26, // Gölgelendirme rengi
                        blurRadius: 5.0, // Gölgelendirme bulanıklığı
                        offset: Offset(0, 3), // Gölgelendirme konumu
                      ),
                    ],
                  ),
                  child: Text(
                    _todoList[index],
                    style: TextStyle(
                        color: Colors.white70), // Yazı rengini ayarlayın
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SekreterPage extends StatefulWidget {
  @override
  _SekreterPageState createState() => _SekreterPageState();
}

class _SekreterPageState extends State<SekreterPage> {
  final TextEditingController _duyuruController = TextEditingController();
  List<String> _duyurular = [];

  void _addDuyuru() {
    setState(() {
      _duyurular.add(_duyuruController.text);
      _duyuruController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(18, 52, 86, 0.5),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(18, 52, 86, 0.9),
        foregroundColor: Colors.white70,
        title: const Text("Sekreter Sayfası"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              controller: _duyuruController,
              style: TextStyle(color: Colors.white70), // Yazı rengi
              decoration: InputDecoration(
                labelText: "Duyuru/Haber Girin",
                labelStyle: TextStyle(color: Colors.white70),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _addDuyuru,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white70, // Buton arka plan rengi
              foregroundColor: Colors.black, // Buton yazı rengi
            ),
            child: Text("Duyuru Ekle"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _duyurular.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  // Duyurular arasındaki boşluk
                  padding: EdgeInsets.all(15.0),
                  // İçerik için boşluk
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 188, 212, 0.8),
                    // Arka plan rengi
                    borderRadius: BorderRadius.circular(10.0),
                    // Kenar yuvarlama
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26, // Gölgelendirme rengi
                        blurRadius: 5.0, // Gölgelendirme bulanıklığı
                        offset: Offset(0, 3), // Gölgelendirme konumu
                      ),
                    ],
                  ),
                  child: Text(
                    _duyurular[index],
                    style: TextStyle(
                        color: Colors.white70), // Yazı rengini ayarlayın
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
