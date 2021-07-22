import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImageToggler(),
    );
  }
}

class ImageToggler extends StatefulWidget {
  @override
  _ImageTogglerState createState() => _ImageTogglerState();
}

class _ImageTogglerState extends State<ImageToggler> {
  bool isExternal = true;
  String uri = 'https://images.unsplash.com/photo-1622778855041-2e8562d4722a';

  void changeImage() {
    setState(() {
      if (isExternal) {
        isExternal = false;
        uri = 'images/diamond.png';
      } else {
        isExternal = true;
        uri = 'https://images.unsplash.com/photo-1622778855041-2e8562d4722a';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        title: Text('I am Rich'),
        backgroundColor: Colors.grey.shade700,
      ),
      drawer: Drawer(
        child: Container(
          child: Center(
            child: Text('Drawer item'),
          ),
        ),
      ),
      body: Container(
        child: Center(
          child: isExternal
              ? Image.network(
                  uri,
                  loadingBuilder: (context, child, progress) => progress == null
                      ? child
                      : CircularProgressIndicator(
                          color: Colors.grey.shade700,
                        ),
                )
              : Image.asset(
                  uri,
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeImage,
        tooltip: 'Change image',
        backgroundColor: Colors.grey.shade700,
        child: Icon(Icons.change_circle_outlined),
      ),
    );
  }
}
