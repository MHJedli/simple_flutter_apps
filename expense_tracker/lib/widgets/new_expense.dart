import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/cupertino.dart';

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;
  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  Category _selectedCategory = Category.leisure;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  DateTime? _selectedDate;
  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context, firstDate: firstDate, lastDate: now);
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _showDialog() {
    if (Platform.isIOS) {
      showCupertinoDialog(
          context: context,
          builder: (ctx) => CupertinoAlertDialog(
                title: Text('Invalid Input'),
                content: Text(
                    'Please make sure a valid title, amount, date and category was entered'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Okay'),
                  ),
                ],
              ));
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('Invalid Input'),
                content: Text(
                    'Please make sure a valid title, amount, date and category was entered'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Okay'),
                  ),
                ],
              ));
    }
  }

  void _submitExpenseDate() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amoutIsInvalid = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        amoutIsInvalid ||
        _selectedDate == null) {
      _showDialog();
      return;
    }
    widget.onAddExpense(Expense(
        title: _titleController.text,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedCategory));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(builder: (ctx, constraints) {
      final width = constraints.maxWidth;

      return SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, keyboardSpace + 16),
            child: Column(
              children: [
                if (width >= 600)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _titleController,
                          maxLength: 50,
                          decoration: InputDecoration(
                            label: Text('Title'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 24,
                      ),
                      Expanded(
                        child: TextField(
                          controller: _amountController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            label: Text('Amount'),
                            prefixText: '\$ ',
                          ),
                        ),
                      ),
                    ],
                  )
                else
                  TextField(
                    controller: _titleController,
                    maxLength: 50,
                    decoration: InputDecoration(
                      label: Text('Title'),
                    ),
                  ),
                if (width >= 600)
                  Row(
                    children: [
                      DropdownButton(
                        value: _selectedCategory,
                        items: Category.values
                            .map(
                              (category) => DropdownMenuItem(
                                  value: category,
                                  child: Text(category.name.toUpperCase())),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value == null) {
                            return;
                          }
                          setState(() {
                            _selectedCategory = value;
                          });
                        },
                      ),
                      SizedBox(
                        width: 24,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(_selectedDate == null
                                ? 'No Date Selected'
                                : formatter.format(_selectedDate!)),
                            IconButton(
                              onPressed: _presentDatePicker,
                              icon: Icon(Icons.calendar_month),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                else
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _amountController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            label: Text('Amount'),
                            prefixText: '\$ ',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(_selectedDate == null
                                ? 'No Date Selected'
                                : formatter.format(_selectedDate!)),
                            IconButton(
                              onPressed: _presentDatePicker,
                              icon: Icon(Icons.calendar_month),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                SizedBox(
                  height: 16,
                ),
                if (width >= 600)
                  Row(
                    children: [
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancel'),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      ElevatedButton(
                        onPressed: _submitExpenseDate,
                        child: Text('Save Expense'),
                      ),
                    ],
                  )
                else
                  Row(
                    children: [
                      DropdownButton(
                        value: _selectedCategory,
                        items: Category.values
                            .map(
                              (category) => DropdownMenuItem(
                                  value: category,
                                  child: Text(category.name.toUpperCase())),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value == null) {
                            return;
                          }
                          setState(() {
                            _selectedCategory = value;
                          });
                        },
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancel'),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      ElevatedButton(
                        onPressed: _submitExpenseDate,
                        child: Text('Save Expense'),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
