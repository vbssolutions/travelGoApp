import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:travelgo/models/userModel.dart';
import 'package:travelgo/services/authentication.dart';
import 'package:travelgo/views/homeview/homeview.dart';
import 'package:travelgo/views/pageManagement.dart';

import 'package:travelgo/views/splashscreen/splashscreen.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MultiProvider(
    providers: [
      StreamProvider.value(value: null, initialData: AuthService().user)
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);

    return user == null
        ? OnboardingScreen()
        : PageManagement(
            user: user,
          );
  }
}
