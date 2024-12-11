import 'package:flutter/material.dart';
import 'package:projeto_login/components/gradiente_background.dart';
import 'package:projeto_login/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Drawer(
      child: Stack(
        children: [
          GradientBrackground(),
          ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      themeProvider.isDark() ? 'assets/images/java_league_logo_white.png' : 'assets/images/java_league_logo_black.png',
                      width: MediaQuery.of(context).size.width * 0.2,
                      fit: BoxFit.fitWidth,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
