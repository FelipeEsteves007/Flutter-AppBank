import 'package:flutter/material.dart';
import 'package:flutter_bank/models/account.dart';
import 'package:flutter_bank/services/account_service.dart';
import 'package:flutter_bank/ui/styles/colors.dart';
import 'package:uuid/uuid.dart';

class AddAccountModal extends StatefulWidget {
  const AddAccountModal({super.key});

  @override
  State<AddAccountModal> createState() => _AddAccountModalState();
}

class _AddAccountModalState extends State<AddAccountModal> {
  String _accountType = "AMBROSIA";

  TextEditingController _nameController = TextEditingController();
  TextEditingController _lastController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      padding: EdgeInsets.only(
        left: 32,
        right: 32,
        top: 32, 
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16),
            Center(
              child: Image.asset(
                "assets/imagens/icon_add_account.png",
                width: 64,
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              "Adicionar nova conta",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 16),
            const Text(
              "Preencha os dados abaixo",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                label: Text("Nome")
              ),
            ),
            TextField(
              controller: _lastController,
              decoration: InputDecoration(
                label: Text("Último nome")
              ),
            ),
            SizedBox(height: 16,),
            Text("Tipo da conta"),
            DropdownButton<String>(
              value: _accountType,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                value: "AMBROSIA", 
                child: Text("Ambrosia"),
              ),
              DropdownMenuItem(
                value: "CANJICA", 
                child: Text("Canjica"),
              ), 
              DropdownMenuItem(
                value: "BRIGADEIRO", 
                child: Text("Brigadeiro"),
              ),
              DropdownMenuItem(
                value: "PUDIM", 
                child: Text("Pudim"),
              ),
            ],
              onChanged: (valor) {
                if (valor != null){
                setState(() {
                  _accountType = valor;
                });
                }
              },
            ),
            const SizedBox(height: 32,),
            Row(
              children: [
                Expanded(child: ElevatedButton(
                  onPressed: () {
                    onButtonCancelClicked();
                  }, child: Text(
                    "Cancelar", 
                    style: TextStyle(color: Colors.black),
                ),
              )
            ),
                Expanded(child: ElevatedButton(
                  onPressed: (isLoading)
                  ? null 
                  :() {
                    onButtonSendClicled();
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(AppColors.orange)
                  ), 
                  child: (isLoading)
                  ? CircularProgressIndicator() 
                  : Text(
                    "Adicionar",
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ),
              ],
            )
          ],
        ),
      ),
    );
  }

  onButtonCancelClicked(){
    if (!isLoading){
      Navigator.pop(context);
    }
  }

  onButtonSendClicled() async {
    if (!isLoading){
        setState(() {
      isLoading = true;
    });
    String name = _nameController.text;
    String lastName = _lastController.text;

    Account account = Account(
      id: Uuid().v1(),
      name: name,
      lastName: lastName,
      balance: 0,
      accountType: _accountType,
    );

    await AccountService().addAccount(account);
    closeModal();
    
    }
  }
    closeModal(){
      Navigator.pop(context);
  }
}
