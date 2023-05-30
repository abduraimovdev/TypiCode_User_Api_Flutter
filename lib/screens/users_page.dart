import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:network_typicode_flutter/common/apis/api.dart';
import 'package:network_typicode_flutter/common/models/user.dart';
import 'package:network_typicode_flutter/common/parser/parser.dart';
import 'package:network_typicode_flutter/common/service/network_service.dart';
import 'package:network_typicode_flutter/screens/user_info.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    final response = await network.get(Api.typicodeUrl, Api.users.path);
    users = Parser.parseAllUser(response);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeData.dark().primaryColor,
        centerTitle: true,
        title: const Text(
          "Users Page",
        ),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: users.length,
        itemBuilder: (context, index) => ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const UserInfo(),
                settings: RouteSettings(
                  arguments: users[index],
                  name: 'user_info/',
                ),
              ),
            );
          },
          leading: const Icon(
            CupertinoIcons.person_alt_circle,
            size: 30,
          ),
          title: Text(users[index].name),
          subtitle: Text(users[index].email),
          trailing: const Icon(Icons.chevron_right),
        ),
      ),
    );
  }
}
