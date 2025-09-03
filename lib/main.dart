import 'package:flutter/material.dart';
import 'package:flutter_bank/ui/login_screen.dart';

void main () {
  runApp(const Bank());
}

class Bank extends StatelessWidget {
  const Bank ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}