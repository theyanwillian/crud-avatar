import 'package:flutter/material.dart';
import 'package:projeto_login/components/avatar_selector.dart';
import 'package:projeto_login/models/user.dart';
import 'package:projeto_login/providers/users_provider.dart';
import 'package:projeto_login/utils/colors.dart';
import 'package:provider/provider.dart';

class UserFormScreen extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String?> _formData = {};

  _loadFormData(User? user) {
    if (user != null) {
      _formData['id'] = user.id;
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['avatarUrl'] = user.avatarUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    final User? user = ModalRoute.of(context)?.settings.arguments != null ? ModalRoute.of(context)?.settings.arguments as User : null;
    _loadFormData(user);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(gradient: linearGradiente(context)),
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          Card(
            elevation: 20.0,
            margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 80.0),
            child: Form(
              key: _form,
              child: ListView(
                padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 18.0, bottom: 5.0),
                children: [
                  const Text(
                    'Dados do usuário',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 32),
                  TextFormField(
                    initialValue: _formData['name'],
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person_outline),
                      labelText: 'Nome',
                    ),
                    validator: (name) {
                      if (name == null || name.isEmpty) return 'Campo Obrigatório';
                      return null;
                    },
                    onSaved: (name) => name != null ? _formData['name'] = name : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    initialValue: _formData['email'],
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline),
                      labelText: 'Email',
                    ),
                    validator: (email) {
                      if (email == null || email.isEmpty) return 'Campo Obrigatório';
                      return null;
                    },
                    onSaved: (email) => email != null ? _formData['email'] = email : null,
                  ),
                  const SizedBox(height: 28),
                  const Text(
                    'Selecione um Avatar',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(height: 20),
                  AvatarSelector(
                    initialAvatarUrl: user?.avatarUrl,
                    onAvatarSelected: (url) {
                      _formData['avatarUrl'] = url;
                    },
                  ),
                ],
              ),
            ),
          ),
          // Positioned to take only AppBar size
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              title: const Text("Cadastrar usuário"),
              actions: [
                IconButton(
                  onPressed: () {
                    if (_form.currentState != null && _form.currentState!.validate()) {
                      _form.currentState?.save();
                      Provider.of<UsersProvider>(context, listen: false).put(
                        User(
                          id: _formData['id'],
                          name: _formData['name'],
                          email: _formData['email'],
                          avatarUrl: _formData['avatarUrl'],
                        ),
                      );
                      Navigator.of(context).pop();
                    }
                  },
                  icon: const Icon(Icons.save),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
