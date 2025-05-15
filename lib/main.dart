import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login/firebase_options.dart';
import 'package:login/screens/admin_dashboard.dart';
import 'package:login/screens/login_screen.dart';
import 'package:login/screens/user_dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      theme: ThemeData(useMaterial3: true),
      initialRoute:FirebaseAuth.instance.currentUser != null ? 'user' : 'login',
      routes: {
        'login': (context) => LoginScreen(),
        'admin': (context) => const AdminDashboard(),
        'user': (context) => const UserDashboard(),
      },
    );
  }
}
