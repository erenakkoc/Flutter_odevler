import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController textController1 = TextEditingController();
  TextEditingController textController2 = TextEditingController();
  String displayedText = "";
  List<String> listItems = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Menüler'),
        ),
        body: Column(
          children: [
            Row(
              children: [
                // Sütun 1 - Text Girişi
                Container(
                  height: 200,
                  width: 125,
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: textController1,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Metin girin',
                        hintStyle: TextStyle(color: Colors.white54),
                      ),
                    ),
                  ),
                ),
                // Sütun 2 - Butona bas, Sütun 3'e yazıyı göster
                Container(
                  height: 200,
                  width: 125,
                  color: Colors.pink,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          displayedText = textController1.text;
                        });
                      },
                      child: Text("Sütun 3'te Göster"),
                    ),
                  ),
                ),
                // Sütun 3 - Gösterilen Metin
                Container(
                  height: 200,
                  width: 125,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 3.0),
                    color: Colors.red,
                  ),
                  child: Center(
                    child: Text(
                      displayedText,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                // Sütun 4 - Text Girişi
                Container(
                  height: 200,
                  width: 125,
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: textController2,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Metin girin',
                        hintStyle: TextStyle(color: Colors.white54),
                      ),
                    ),
                  ),
                ),
                // Sütun 5 - Butona Bas, Sütun 6'daki Listeye Ekle
                Container(
                  height: 200,
                  width: 125,
                  color: Colors.pink,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          listItems.add(textController2.text);
                          textController2.clear(); // TextField'ı temizle
                        });
                      },
                      child: Text("Listeye Ekle"),
                    ),
                  ),
                ),
                // Sütun 6 - ListView
                Container(
                  height: 200,
                  width: 125,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 3.0),
                    color: Colors.red,
                  ),
                  child: ListView.builder(
                    itemCount: listItems.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          listItems[index],
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
