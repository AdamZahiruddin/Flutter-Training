import 'package:flutter/material.dart';
import 'package:simple_widget_app/page/page1_TNC.dart';
import 'package:simple_widget_app/page/page2_DateTime.dart';
import 'package:simple_widget_app/page/page3_payment.dart';
import 'package:simple_widget_app/page/page4_todolist.dart';
import 'package:simple_widget_app/page/page5_buttonAlign.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Widget? content;
  String title = 'Flyout Layout Example';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menu'),
            ),
            ListTile(
              title: Text('Term And Condition'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  content = TermAndConditionPage();
                  title = "Term And Condition";
                });
              },
            ),
            ListTile(
              title: Text('Date and Time'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  content = DateTimePage();
                  title = "Date Validation";
                });
              },
            ),
            ListTile(
              title: Text('Price Formatting'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  content = AmountPage();
                  title = "Price Formatting";
                });
              },
            ),
            ListTile(
              title: Text('To Do List'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  content = ToDoListPage();
                  title = "To Do List";
                });
              },
            ),
            ListTile(
              title: Text('Button Alignment'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  content = ButtonAlignmentPage();
                  title = "Button Alignment";
                });
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: (content == null)
            ? OutlinedButton(
                onPressed: () {},
                child: Text("Please provide\nyour information",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),),
              )
            : content,
      ),
    );
  }
}
