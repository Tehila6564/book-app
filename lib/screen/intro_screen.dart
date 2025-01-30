import 'package:books_app/screen/home_screen.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  IntroScreen({required this.toggleTheme, required this.isDarkMode});

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(widget.isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: widget.toggleTheme,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to Books App',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(
                      isDarkMode: widget.isDarkMode,
                      toggleTheme: widget.toggleTheme,
                    ),
                  ),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor:
                    widget.isDarkMode ? Colors.white : Colors.black,
              ),
              child: Text(
                'start shopping',
                style: TextStyle(
                  color: widget.isDarkMode
                      ? Color.fromARGB(255, 14, 0, 0)
                      : Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
