import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final formatter = DateFormat.yMEd();

enum Category { food, fun, work, grocery, travel }

class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenseItem,
  });
  ExpenseBucket.forCategory(List<Expense> allexpense, this.category)
      : expenseItem =
            allexpense.where((ex) => ex.category == category).toList();
  final Category category;
  final List<Expense> expenseItem;

  double get totalExpense {
    double sum = 0;
    for (final expense in expenseItem) {
      sum += expense.amount;
    }
    return sum;
  }
}

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.fun: Icons.sports_cricket,
  Category.work: Icons.work,
  Category.grocery: Icons.shop,
  Category.travel: Icons.travel_explore
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  String get formattedDate {
    return formatter.format(date);
  }
}
