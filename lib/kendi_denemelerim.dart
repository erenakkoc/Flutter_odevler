import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Text field controller for email and password
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Email text field
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),

            // Password text field
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),

            // Login button
            ElevatedButton(
              onPressed: () {
                // Basit bir şekilde butona tıklanınca yazdırma işlemi yapalım
                print('Email: ${_emailController.text}');
                print('Password: ${_passwordController.text}');
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}





// class SekreterPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Sekreter Sayfası"),
//       ),
//       body: Column(
//         children: [
//           Container(
//             margin: EdgeInsets.all(10),
//             color: Colors.pink,
//             width: 150,
//             height: 150,
//             child: Center(child: Text("Öğrenci Ekle/Çıkar")),
//           ),
//           Container(
//             color: Colors.yellow,
//             width: 150,
//             height: 150,
//             child: Center(child: Text("Hoca Ekle/Çıkar")),
//           ),
//           Container(
//             margin: EdgeInsets.all(10),
//             color: Colors.lightGreen,
//             width: 150,
//             height: 150,
//             child: Center(child: Text("Ders Programı")),
//           ),
//         ],
//       ),
//     );
//   }
// }




// class HocaPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Ogretmen Sayfası"),
//       ),
//       body: Column(
//         children: [
//           // İlk satır (2 blok)
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Container(
//                 margin: EdgeInsets.all(10),
//                 color: Colors.pink,
//                 width: 150,
//                 height: 150,
//                 child: Center(child: Text("Ders İşlemleri")),
//               ),
//               Container(
//                 margin: EdgeInsets.all(10),
//                 color: Colors.yellow,
//                 width: 150,
//                 height: 150,
//                 child: Center(child: Text("Haftalık Program")),
//               ),
//             ],
//           ),
//           // İkinci satır (2 blok)
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Container(
//                 margin: EdgeInsets.all(10),
//                 color: Colors.lightGreen,
//                 width: 150,
//                 height: 150,
//                 child: Center(child: Text("Öğrenciler")),
//               ),
//               Container(
//                 margin: EdgeInsets.all(10),
//                 color: Colors.blue,
//                 width: 150,
//                 height: 150,
//                 child: Center(child: Text("Sınavlar")),
//               ),
//             ],
//           ),
//           // Üçüncü satır (2 blok)
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Container(
//                 margin: EdgeInsets.all(10),
//                 color: Colors.orange,
//                 width: 150,
//                 height: 150,
//                 child: Center(child: Text("Duyurular")),
//               ),
//               Container(
//                 margin: EdgeInsets.all(10),
//                 color: Colors.purple,
//                 width: 150,
//                 height: 150,
//                 child: Center(child: Text("Geri Bildirim")),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }




// class HocaPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Ogretmen Sayfası"),
//       ),
//       body: Column(
//         children: [
//           Container(
//             margin: EdgeInsets.all(10),
//             color: Colors.pink,width: 150,height: 150,child: Center(child: Text("Ders İşlemleri"),),),
//           Container(
//             color: Colors.yellow,width: 150,height: 150,child: Center(child: Text("Haftalık Program"),),),
//           Container(
//             margin: EdgeInsets.all(10),
//             color: Colors.lightGreen,width: 150,height: 150,child: Center(child: Text("Ogrenciler"),),
//           ),
//         ],
//       ),
//     );
//   }
// }
