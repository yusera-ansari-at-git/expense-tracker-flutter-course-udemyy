import 'package:flutter/material.dart';
import 'package:tracker_app/src/models/expense.dart';
import 'package:tracker_app/src/widgets/expenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.onRemoveExpense, required this.expenses});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  Widget itemBuilder(BuildContext _, int index) {
    return Dismissible(
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        key: ValueKey(expenses[index]),
        child: ExpenseItem(expense: expenses[index]));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // shrinkWrap: true,
      // padding: const EdgeInsets.all(20),
      itemBuilder: itemBuilder,
      itemCount: expenses.length,
    );
  }
}
