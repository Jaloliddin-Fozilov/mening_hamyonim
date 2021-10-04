import 'package:flutter/material.dart';

class ListModeli {
  final String id;
  final String name;
  final DateTime day;
  final double price;
  final IconData icon;

  ListModeli({
    required this.id,
    required this.name,
    required this.day,
    required this.price,
    required this.icon,
  });
}

class ListData {
  List<ListModeli> _royxat = [];

  List<ListModeli> get royxat {
    return _royxat;
  }

  List<ListModeli> sortByMonth(DateTime date) {
    return _royxat
        .where((xarajat) =>
            xarajat.day.month == date.month && xarajat.day.year == date.year)
        .toList();
  }

  void addToList(
    String name,
    DateTime day,
    double price,
    IconData icon,
  ) {
    _royxat.add(ListModeli(
        id: "r${_royxat.length + 1}",
        name: name,
        day: day,
        price: price,
        icon: icon));
  }
}
