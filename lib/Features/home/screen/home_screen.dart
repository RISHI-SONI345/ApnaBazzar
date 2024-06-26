import 'package:amazon_clone/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //that user getter
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      //this user.tojson tells us that it is intance of user model
      body: SafeArea(child: Center(child: Text(user.toJson()))),
    );
  }
}
