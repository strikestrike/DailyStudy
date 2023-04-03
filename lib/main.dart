import 'package:dailystudy/utils/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'firebase_options.dart';
import 'views/splash_page.dart';
import 'utils/globals.dart';
import 'utils/helpers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FirebasePhoneAuthProvider(
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Daily Study',
            scaffoldMessengerKey: Globals.scaffoldMessengerKey,
            onGenerateRoute: RouteGenerator.generateRoute,
            home: SplashScreen(),
          );
        },
        maxTabletWidth: 900,
      ),
    );
  }
}
