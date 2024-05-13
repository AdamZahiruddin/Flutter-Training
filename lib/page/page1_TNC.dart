import 'package:flutter/material.dart';

class TermAndConditionPage extends StatefulWidget {
  const TermAndConditionPage({super.key});

  @override
  State<TermAndConditionPage> createState() => _TermAndConditionPageState();
}

class _TermAndConditionPageState extends State<TermAndConditionPage> {
  bool isRead = false;
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              "lib/assets/image1.png",
              fit: BoxFit.cover,
              height: 200.0, // Adjust height as needed
            ),
          ),
          // Scrollable Content
          Positioned(
            top: 200.0, // Height of the image
            left: 0,
            right: 0,
            bottom: 0,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Term And Condition",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. A lacus vestibulum sed arcu non odio euismod lacinia at. Arcu odio ut sem nulla pharetra. Massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada proin. Ipsum suspendisse ultrices gravida dictum. Viverra justo nec ultrices dui sapien eget mi. Faucibus vitae aliquet nec ullamcorper sit amet. Nullam non nisi est sit amet facilisis magna etiam. Eu consequat ac felis donec et odio pellentesque diam volutpat. Morbi tempus iaculis urna id volutpat.\nFermentum leo vel orci porta non pulvinar neque laoreet. Eros in cursus turpis massa. Porttitor lacus luctus accumsan tortor. Lorem donec massa sapien faucibus. Enim nunc faucibus a pellentesque sit amet porttitor. Pharetra et ultrices neque ornare aenean euismod elementum. Imperdiet nulla malesuada pellentesque elit eget gravida cum sociis natoque. Leo duis ut diam quam. Non sodales neque sodales ut. Tortor dignissim convallis aenean et. In est ante in nibh mauris cursus mattis. Etiam tempor orci eu lobortis elementum nibh tellus molestie. Luctus venenatis lectus magna fringilla urna porttitor rhoncus. Dolor morbi non arcu risus quis varius. Pulvinar elementum integer enim neque volutpat ac. In hac habitasse platea dictumst vestibulum rhoncus est. Tincidunt praesent semper feugiat nibh sed. Tincidunt augue interdum velit euismod in pellentesque massa.",
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 20),
                      CheckboxListTile(
                        value: isRead,
                        onChanged: (val) {
                          setState(() => isRead = val!);
                        },
                        title: Text("I have read all the term and condition"),
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: Colors.green,
                      ),
                      ElevatedButton(
                        style: isRead
                            ? ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Colors.green,
                                ),
                              )
                            : null,
                       onPressed: isRead ? () {
                          isPressed = true;
                          ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          );
                        } : null,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.check, color: Colors.white),
                            Text(
                              "Accept Term and Condtion",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 200), // Adjust spacing
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
