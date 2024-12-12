import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto_login/components/gradiente_background.dart';
import 'package:projeto_login/providers/theme_provider.dart';
import 'package:projeto_login/utils/validators.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
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
                      AuthForm(formKey: _formKey),
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
              title: Text('Solicitar Acesso'),
            ),
          ),
        ],
      ),
    );
  }
}

class AuthForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const AuthForm({required this.formKey});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline),
                labelText: 'Nome',
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (name) {
                if (name == null || name.isEmpty) return 'Campo Obrigatório';
                return null;
              },
              onSaved: (name) {},
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock_outline),
                labelText: 'Email',
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validateEmail,
              onSaved: (email) {},
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.phone),
                labelText: 'Telefone',
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validateMobile,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly, TelefoneInputFormatter()],
              onSaved: (phone) {},
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState != null && formKey.currentState!.validate()) {
                  formKey.currentState?.save();
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text('Solicitação confirmada!'),
                      content: const Text('Em breve você recebera mais informações no seu e-mail'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                          child: const Text("Ok"),
                        )
                      ],
                    ),
                  );
                }
              },
              child: const Text('Solicitar acesso'),
            )
          ],
        ),
      ),
    );
  }
}

