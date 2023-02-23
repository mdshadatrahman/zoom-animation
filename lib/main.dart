import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

double defaultWidth = 100.0;

class _HomePageState extends State<HomePage> {
  var _isZoomedIn = false;
  var _buttonTitle = 'Zoom In';
  var _width = defaultWidth;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 370),
              curve: Curves.bounceOut,
              width: _width,
              child: Image.asset(
                'assets/images/wallpaper.jpeg',
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _isZoomedIn = !_isZoomedIn;
                  _buttonTitle = _isZoomedIn ? 'Zoom Out' : 'Zoom In';
                  _width = _isZoomedIn ? width : defaultWidth;
                });
              },
              child: Text(
                _buttonTitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
