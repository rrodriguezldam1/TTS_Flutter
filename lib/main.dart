import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() => runApp(MyApp());
 
  final FlutterTts flutterTts = FlutterTts();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    
    Future _speak(String text) async {
      await flutterTts.setLanguage("es-ES");
      await flutterTts.setPitch(1);
      await flutterTts.speak(text);
    }

    Future _stop() async {
      await flutterTts.setLanguage("es-ES");
      await flutterTts.setPitch(1);
      await flutterTts.speak("Adíos");
      await flutterTts.stop();
    }
    
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Text To Speech'),
          backgroundColor: Colors.deepPurple,
          actions: <Widget>[
          IconButton(
            icon: Icon(
            Icons.format_paint,
            color: Colors.white,
          ),
            onPressed: () {
            AppBar(
              backgroundColor: Colors.red
           );
        },
        )
        ],
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
                TextFormField(
                  controller: textEditingController,
                ),
                RaisedButton(
                  child: Text('Convertir en Voz'),
                  color: Colors.grey,
                  onPressed: () => _speak(textEditingController.text),
                ),
                RaisedButton(
                  child: Text('Detener Voz'),
                  color: Colors.black45,
                  onPressed: () => _stop(),
                )
            ],
          )
       ),
     ),
   );
 }
}
