import 'package:flutter/material.dart';
import 'package:flutter_bank/models/account.dart';
import 'package:flutter_bank/services/account_service.dart';
import 'package:flutter_bank/ui/styles/colors.dart';
import 'package:flutter_bank/ui/widgets/account_widget.dart';
import 'package:flutter_bank/ui/widgets/add_account_modal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Account>> _futureGetAll = AccountService().getAll();

  Future<void> refreshGetAll() async {
    setState(() {
      _futureGetAll = AccountService().getAll();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightGray,
        title: Text("Sistema de gestão de contas"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, "login");
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(context: 
           context,
           isScrollControlled: true,
           builder: (context) {
            return AddAccountModal();
          },
        );
      },
        backgroundColor: AppColors.orange,
        child: 
          Icon(Icons.add, color:
           Colors.black,
          ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RefreshIndicator(
          onRefresh: refreshGetAll,
          child: FutureBuilder(
            future: _futureGetAll,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Center(child: CircularProgressIndicator());

                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());

                case ConnectionState.active:
                  return Center(child: CircularProgressIndicator());

                case ConnectionState.done:
                  if (snapshot.data == null || snapshot.data!.isEmpty) {
                    return const Center(child: Text("Nenhuma conta recebida"));
                  } else {
                    List<Account> listAccounts = snapshot.data!;
                    return ListView.builder(
                      itemCount: listAccounts.length,
                      itemBuilder: (context, index) {
                        return AccountWidget(account: listAccounts[index]);
                      },
                    );
                  }
              }
            },
          ),
        ),
      ),
    );
  }
}
