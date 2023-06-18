import 'package:apotek/Provider/auth_provider.dart';
import 'package:apotek/Views/auth/welcome_page.dart';
import 'package:apotek/Views/payment/maps_page.dart';
import 'package:apotek/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'Provider/drug_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AuthProvider()),
      ChangeNotifierProvider(create: (_) => DrugProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: Colors.black),
        ),
        scaffoldBackgroundColor: blueBG,
        fontFamily: GoogleFonts.inter().fontFamily,
      ),
      home: WelcomePage(),
    );
  }
}
