import 'package:flutter/material.dart';
import 'package:flutter_rest_api/models/user.dart';
import 'package:flutter_rest_api/services/user_service.dart';

class HomePageStateless extends StatelessWidget {
  const HomePageStateless({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Api Future Builder'),
      ),
      body: FutureBuilder<List<User>>(
          future: UserService.fetchUsers(),
          builder: (context, snapshot) {
            final users = snapshot.data;

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text('error')
                );
            }

            return ListView.builder(
                itemCount: users!.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.avatar),
                      ),
                      title: Text('${user.firstName} ${user.lastName}'),
                      subtitle: Text(user.email),
                    ),
                  );
                },
              );
          }),
    );
  }
}
