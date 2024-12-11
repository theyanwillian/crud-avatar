import 'dart:math';

import 'package:flutter/material.dart';
import 'package:projeto_login/data/dummy_users.dart';
import 'package:projeto_login/models/user.dart';

class UsersProvider with ChangeNotifier {
  Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex (int i) {
    return _items.values.elementAt(i);
  }

  void put (User user) {
    if (user == null) return;

    if (user.id != null && user.id!.trim().isNotEmpty && _items.containsKey(user.id)) {
      _items.update(user.id!, (value) => user);
    } else {
      final id = Random().nextDouble().toString();
      user.id = id;
      _items.putIfAbsent(id, () => user);
    }
    notifyListeners();
  }

  void remove (String? id) {
    if (id != null) {
      _items.remove(id);
      notifyListeners();
    }
  }
}