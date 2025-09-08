import 'package:flutter/material.dart';
import 'package:flutter_bank/ui/styles/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightGray,
        title: Text("Sistema de gestão de contas"),
          actions: [
           IconButton(onPressed: (){
              Navigator.pushReplacementNamed(context, "login");
            }, icon: Icon(Icons.logout), 
           )
         ],
      )
    );
  }
}