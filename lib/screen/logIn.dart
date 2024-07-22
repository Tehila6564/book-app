import 'package:books_app/screen/intro_screen.dart';
import 'package:books_app/screen/register.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Models/model.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  LoginScreen({required this.toggleTheme, required this.isDarkMode});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void _login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: userNameController.text.trim(),
        password: passwordController.text.trim(),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => IntroScreen(
              toggleTheme: widget.toggleTheme, isDarkMode: widget.isDarkMode),
        ),
      );
    } catch (e) {
      print("login failed: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("login failed"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("login"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildBookCarousel(),
            SizedBox(
              height: 20,
            ),
            _buildTextField(userNameController, 'User Name'),
            SizedBox(
              height: 20,
            ),
            _buildTextField(passwordController, 'Password', obscureText: true),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: _login,
              child: Text('login'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterScreen(
                      toggleTheme: widget.toggleTheme,
                      isDarkMode: widget.isDarkMode,
                    ),
                  ),
                );
              },
              child: Text('Dont have an account ? register'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String LableText,
      {bool obscureText = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: LableText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      obscureText: obscureText,
    );
  }

  Widget _buildBookCarousel() {
    return CarouselSlider.builder(
      itemCount: books.length,
      itemBuilder: (context, index, child) {
        final book = books[index];
        return _buildBookItem(book);
      },
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2,
        enlargeCenterPage: true,
        autoPlayInterval: Duration(seconds: 3),
      ),
    );
  }

  Widget _buildBookItem(Book book) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(book.imageURL),
        fit: BoxFit.cover,
      )),
    );
  }
}
