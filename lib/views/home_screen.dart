import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:projeto_login/components/gradiente_background.dart';
import 'package:projeto_login/views/register_screen.dart';
import 'package:projeto_login/providers/theme_provider.dart';
import 'package:projeto_login/utils/colors.dart';
import 'package:projeto_login/views/user_list_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  int value = 0;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      // drawer: const SideMenu(),
      body: Stack(
        children: [
          const GradientBrackground(),
          Center(
            child: SingleChildScrollView(
              reverse: true,
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        themeProvider.isDark() ? 'assets/images/java_league_logo_white.png' : 'assets/images/java_league_logo_black.png',
                        width: MediaQuery.of(context).size.width * 0.4,
                        fit: BoxFit.fitWidth,
                      ),
                      const SizedBox(height: 50),
                      AuthForm(),
                      const SizedBox(height: 50),
                      AnimatedToggleSwitch<int>.rolling(
                        onTap: (_) {
                          themeProvider.toggleTheme();
                        },
                        style: ToggleStyle(
                            borderColor: Colors.transparent,
                            indicatorBoxShadow: [
                              const BoxShadow(
                                color: Colors.black26,
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: Offset(0, 1.5),
                              ),
                            ],
                            indicatorGradient: linearGradiente(context),
                            backgroundColor: Colors.transparent),
                        current: themeProvider.isDark() ? 1 : 0,
                        indicatorIconScale: 1.0,
                        values: const [0, 1],
                        iconBuilder: (int? value, bool foreground) {
                          return Icon(
                            iconDataByValue(value),
                            color: themeProvider.getThemeData().colorScheme.onSecondaryContainer,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
          ),
        ],
      ),
    );
  }
}

IconData iconDataByValue(int? value) => switch (value) {
      0 => Icons.light_mode,
      _ => Icons.dark_mode,
    };

class AuthForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        children: [
          const Text(
            'Faça seu pré-registro e em breve você terá acesso a toda nossa plataforma',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterScreen()),
              );
            },
            child: const Text('Pré-registro'),
          ),
          const SizedBox(height: 40),
          const Text(
            'Veja uma demonstração do que nossa plataforma terá para oferecer.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserListScreen()),
              );
            },
            child: const Text('Demo'),
          ),
        ],
      ),
    );
  }
}
