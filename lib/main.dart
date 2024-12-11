import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projeto_login/views/home_screen.dart';
import 'package:projeto_login/providers/theme_provider.dart';
import 'package:projeto_login/providers/users_provider.dart';
import 'package:projeto_login/routes/app_routes.dart';
import 'package:projeto_login/views/user_form_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UsersProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) => MaterialApp(
          theme: themeProvider.getThemeData(),
          debugShowCheckedModeBanner: false,
          routes: {
            AppRoutes.HOME: (ctx) => HomeScreen(),
            AppRoutes.USER_FORM: (ctx) => UserFormScreen()
          },
        ),
      ),
    );
  }
}
