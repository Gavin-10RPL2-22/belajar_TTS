import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class HomePage extends StatefulWidget {
  final bool yesno;
  HomePage({Key? key, required this.yesno}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isChecked = false;
  FlutterTts _tts = FlutterTts();
  String _judul = "Selamat Datang di Flutter";
  String _detail =
      "Flutter adalah sebuah framework aplikasi mobile sumber terbuka yang diciptakan oleh Google. Flutter digunakan dalam pengembangan aplikasi untuk sistem operasi Android, iOS, Windows, Linux, MacOS, serta menjadi metode utama untuk membuat aplikasi Google Fuchsia. Flutter juga mendukung untuk pengembangan aplikasi berbasis web.";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.yesno == true ? speak() : null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Welcome to TTS Flutter"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  value: _isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value!;
                    });
                    if (_isChecked == true) {
                      speak();
                    } else {
                      _tts.stop();
                    }
                  },
                ),
                Text("Baca semua teks"),
              ],
            ),
            Text(_judul,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            Padding(
              padding: EdgeInsets.all(15),
              child: Expanded(
                child: Text(_detail,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15)),
              ),
            )
          ],
        ),
      ),
    ));
  }

  speak() async {
    await _tts.awaitSpeakCompletion(true);
    await textTTS();
  }

  textTTS() async {
    _tts.setLanguage("id");
    await _tts.speak(_judul);
    await _tts.speak(_detail);
  }
}
