import 'package:flutter/material.dart';
import 'package:text_to_speech_test/home.dart';

class PilihanPage extends StatefulWidget {
  const PilihanPage({Key? key}) : super(key: key);

  @override
  State<PilihanPage> createState() => _PilihanPageState();
}

class _PilihanPageState extends State<PilihanPage> {
  bool _yesno = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pilihan TTS"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Apakah ingin menghidupkan Suara"),
            SizedBox(height: 12),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _yesno = true;
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage(yesno: _yesno)));
                    },
                    child: Text("Yes")),
                SizedBox(width: 25),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _yesno = false;
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage(yesno: _yesno)));
                    },
                    child: Text("No")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
