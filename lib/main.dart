import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'src/constants/app_theme.dart';
import 'src/features/home/viewmodel/comments_viewmodel.dart';
import 'src/features/auth/viewmodel/auth_viewmodel.dart';
import 'src/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => CommentsViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Comments App',
        theme: AppTheme.lightTheme,
        initialRoute: AppRoutes.authScreen,
        routes: AppRoutes.getRoutes(),
      ),
    );
  }
}
