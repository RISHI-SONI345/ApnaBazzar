import 'package:amazon_clone/Constants/global_variable.dart';
import 'package:amazon_clone/Features/auth/screens/authscreen.dart';
import 'package:amazon_clone/Features/home/screen/home_screen.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:amazon_clone/route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:amazon_clone/Features/auth/services/auth_service.dart';

//we wiill get data from prefrencers to main.dart to cheack
//if that the data is saved or not

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthServices authService = AuthServices();
  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Amazon Clone',
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          colorScheme: ColorScheme.light(
            primary: GlobalVariables
                .secondaryColor, // This should be the main color for buttons
          ),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
          ),
        ),
        onGenerateRoute: (settings) => generateRoute(settings),
        // home: Scaffold(
        //   appBar: AppBar(
        //     title: const Center(child: Text('hello')),
        //     backgroundColor: GlobalVariables
        //         .secondaryColor, // Adjusted to use the same primary color as the theme
        //   ),
        //   body: Column(
        //     children: [
        //       const Text('Hello to my amazon clone'),
        //       Builder(builder: (context) {
        //         return ElevatedButton(
        //           onPressed: () {
        //             Navigator.pushNamed(context, AuthScreen.routeName);
        //           }, // Changed for safety, as there's no action
        //           child: const Text('hello pookie app'),
        //         );
        //       }),
        //     ],
        //   ),
        // ),
        home: Provider.of<UserProvider>(context).user.token.isNotEmpty
            ? const HomeScreen()
            : const AuthScreen());
  }
}
