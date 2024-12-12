import 'package:flutter/material.dart';
import 'package:projeto_login/models/user.dart';
import 'package:projeto_login/providers/users_provider.dart';
import 'package:projeto_login/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl == null || user.avatarUrl!.isEmpty
        ? const CircleAvatar(
            child: Icon(Icons.person),
          )
        : CircleAvatar(
            backgroundImage: NetworkImage(user.avatarUrl!),
            backgroundColor: Colors.transparent,
          );
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 20, right: 8),
      leading: avatar,
      title: user.name != null ?  Text(user.name!) : const Text('Não encontrado'),
      subtitle: user.email != null ?  Text(user.email!) : const Text('Não encontrado'),
      trailing: SizedBox(
        width: MediaQuery.of(context).size.width * 0.22,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () => Navigator.pushNamed(context, AppRoutes.USER_FORM, arguments: user),
              icon: const Icon(Icons.edit),
              color: Theme.of(context).colorScheme.tertiary,
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Tem certeza que deseja excluir?'),
                    content: user.name != null ?  Text(user.name!) : const Text('Não encontrado'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Não"),
                      ),
                      TextButton(
                        onPressed: () {
                          Provider.of<UsersProvider>(context, listen: false).remove(user.id);
                          Navigator.of(context).pop();
                        },
                        child: const Text("Sim"),
                      )
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.delete),
              color: Theme.of(context).colorScheme.error,
            )
          ],
        ),
      ),
    );
  }
}
