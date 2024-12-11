import 'package:flutter/material.dart';
import 'package:projeto_login/components/gradiente_background.dart';
import 'package:projeto_login/components/user_tile.dart';
import 'package:projeto_login/providers/users_provider.dart';
import 'package:projeto_login/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final users = Provider.of<UsersProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          GradientBrackground(),
          CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text('Lista de Usuários', style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer),),
                  ),
                ),
                backgroundColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
                  if (states.contains(MaterialState.scrolledUnder)) {
                    return Theme.of(context).colorScheme.secondaryContainer;
                  }
                  return Colors.transparent;
                }),
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.USER_FORM);
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return UserTile(users.byIndex(index));
                  },
                  childCount: users.count,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
