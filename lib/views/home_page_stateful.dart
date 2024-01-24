import 'package:flutter/material.dart';
import 'package:flutter_rest_api/models/user.dart';
import 'package:flutter_rest_api/services/user_service.dart';

class HomePageStateful extends StatefulWidget {
  const HomePageStateful({super.key});

  @override
  State<HomePageStateful> createState() => _HomePageStateful();
}

class _HomePageStateful extends State<HomePageStateful> {
  List<User> users = [];

  void fetchUsers() async {
    final result = await UserService.fetchUsers();
    users = result;
    setState(() {
      
    });
  }

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Get Api Stateful'
        ),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return Card(
            child: ListTile(
              title: Text(user.firstName),
              subtitle: Text(user.email),
            ),
          );
        },
      ),
    );
  }
}