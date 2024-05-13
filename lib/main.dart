import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adam APP',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Brain Rot'),
        backgroundColor: Color.fromARGB(255, 120, 217, 170)),
        
      body: TextInputWidget());
  }
}

class TextInputWidget extends StatefulWidget {
  const TextInputWidget({super.key});

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final controller = TextEditingController();
  String text = "";

  @override
  void dispose(){
    super.dispose();
    controller.dispose();
  }

  void changeText(text){
     if(text == "Clear"){
      controller.clear();
      text = "";
    }
  setState(() {
    this.text = text;
  });
    
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[TextField(
      controller: this.controller,
      decoration:  InputDecoration(prefixIcon: Icon(Icons.message), 
    labelText: "Type something:"),
    onChanged: (text) => this.changeText(text),
    ), 
    Text(this.text)
 ]);
  }
}


