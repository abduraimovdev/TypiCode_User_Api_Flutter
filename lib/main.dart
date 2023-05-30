import 'package:flutter/material.dart';
import 'package:network_typicode_flutter/screens/users_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
    home: UsersPage(),
  );
}
