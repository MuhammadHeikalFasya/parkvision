import 'dart:async';
import 'package:flutter/material.dart';
import 'package:parkvision/homepage.dart';

class Splashpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      routes: {
        '/home': (context) => const ParkVisionApp(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _textController;
  double _logoSize = 0.0;
  double _textOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    
    // Animasi untuk logo dengan zoom-in effect
    _logoController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..addListener(() {
        setState(() {
          _logoSize = _logoController.value * 100.0;
        });
      });

    // Animasi untuk teks dengan fade-in effect
    _textController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..addListener(() {
        setState(() {
          _textOpacity = _textController.value;
        });
      });

    // Mulai animasi
    _logoController.forward().then((_) {
      _textController.forward();
    });

    // Menavigasi ke halaman berikutnya setelah beberapa detik
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  void dispose() {
    _logoController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.easeOut,
              width: _logoSize,
              height: _logoSize,
              child: Image.asset('./assets/images/icon_parkvision.png'), // Logo menggunakan image asset
            ),
            SizedBox(height: 16.0),
            AnimatedOpacity(
              duration: Duration(seconds: 1),
              opacity: _textOpacity,
              child: Image.asset(
                './assets/images/teks_parkvision.png', // Teks menggunakan image asset
                width: 200, // Sesuaikan ukuran sesuai kebutuhan
              ),
            ),
          ],
        ),
      ),
    );
  }
}

