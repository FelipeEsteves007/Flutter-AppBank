import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget { // classe loginScreen
  const LoginScreen({super.key}); // constante com id unico

  @override
  Widget build(BuildContext context) { //desenhando a tela 
    return Scaffold // inicio da tela (esqueleto)
    (
      body: Padding( // espaçamento ao lado (borda)
        padding: const EdgeInsets.all(32),
        child: Column( // corpo aonde ira aparacer, empilhando tudo na vertical
        mainAxisAlignment: MainAxisAlignment.center, // centralizando os elementos 
          children: <Widget>[ // lista de widgets filhos 
            Image.asset(
              "assets/imagens/logo.png", 
                width: 180,
            ),
            SizedBox(height: 15,), // espaçamento
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch, // espaçamento horizontal
              children: [
                const Text("Sistema de Gestão de Contas", // constante text 
                  textAlign: TextAlign.center, // centralizar formato do texto
                  style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                  SizedBox(height: 15,), // espaçamento
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text("E-mail")),
                ), // user escrever dentro da caixa
                 SizedBox(height: 15,),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    label: Text("Senha"),
                  ),
                ),
                SizedBox(height: 25,),
                ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 255, 177, 21))
                ),
                 child: Text(
                  "Entrar",
                  style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ), // botao elevado
          ],
        ),
      ),
    );
  }
}
