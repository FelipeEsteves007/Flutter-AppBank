import 'package:flutter/material.dart';
import 'package:flutter_bank/ui/login_screen.dart';
import 'package:flutter_bank/ui/home_screen.dart';


void main () {
  runApp(const Bank()); // iniciamos o app
}

class Bank extends StatelessWidget { // criando uma classe chamada bank 
  const Bank ({super.key}); // widget constante com id unico

  @override
  Widget build(BuildContext context) { // desenhar a tela 
    return MaterialApp( // estrutura base 
    routes: {
      "login" : (context) => const LoginScreen(),
      "home" : (context)=> HomeScreen(),
    },
      initialRoute: 'login', 
    );
  }
}