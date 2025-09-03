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
            const Text("Sistema de Gestão de Contas", // constante text 
              textAlign: TextAlign.center, // centralizar formato do texto
              style: TextStyle(
                  fontSize: 32,
                ),
              ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text("E-mail")),
            ), // user escrever dentro da caixa
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                label: Text("Senha"),
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text("Entrar")), // botao elevado
          ],
        ),
      ),
    );
  }
}
