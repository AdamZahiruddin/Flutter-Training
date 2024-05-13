import 'package:flutter/material.dart';
import 'package:simple_widget_app/widget/SquareButton.dart';

class ButtonAlignmentPage extends StatefulWidget {
  const ButtonAlignmentPage({super.key});

  @override
  State<ButtonAlignmentPage> createState() => _ButtonAlignmentPageState();
}

class _ButtonAlignmentPageState extends State<ButtonAlignmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.lightBlue),
            child: Column(),
          ),
          SquareButton(text: 'Button1'),

        ],
      ),
    );
  }
}
