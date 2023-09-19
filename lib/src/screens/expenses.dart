import 'package:flutter/material.dart';
import 'package:tracker_app/src/models/expense.dart';
import 'package:tracker_app/src/widgets/add_expense/new_expense.dart';
import 'package:tracker_app/src/widgets/expenses_list/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        amount: 19.99,
        date: DateTime.now(),
        title: "flutter course",
        category: Category.travel),
    Expense(
        amount: 20.2,
        date: DateTime(2023, 2, 24),
        title: "flutter project",
        category: Category.work),
    Expense(
        amount: 39.99,
        date: DateTime.now(),
        title: "Movie",
        category: Category.leisure),
    Expense(
        amount: 30.2,
        date: DateTime(2023, 2, 24),
        title: "Fruit",
        category: Category.food)
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (_) {
          return Column(
            children: [
              NewExpense(onAddExpense: _addExpense),
            ],
          );
        });
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
        centerTitle: true,
        title: const Text(
          "Expense Tracker",
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ExpensesList(
                onRemoveExpense: _removeExpense, expenses: _registeredExpenses),
          ),
        ],
      ),
    );
  }
}
