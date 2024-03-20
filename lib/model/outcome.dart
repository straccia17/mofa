

import 'package:mofa/model/category.dart';

class Outcome {
  final String id;
  final Category? category;
  final String notes;
  final int amount;
  final DateTime date;

  Outcome({
    required this.id,
    required this.category,
    required this.notes,
    required this.amount,
    required this.date,
  });

  Outcome.empty()
      : id = '',
        category = null,
        notes = '',
        amount = 0,
        date = DateTime.now();

  Outcome.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        category = Category.fromCode(json['category']),
        notes = json['notes'],
        amount = json['amount'],
        date = DateTime.parse(json['date']);

  Outcome copyWith({
    String? id,
    Category? category,
    String? notes,
    int? amount,
    DateTime? date,
  }) {
    return Outcome(
      id: id ?? this.id,
      category: category ?? this.category,
      notes: notes ?? this.notes,
      amount: amount ?? this.amount,
      date: date ?? this.date,
    );
  }

  String get formattedAmount {
    return '${(amount / 100).toStringAsFixed(2)}€';
  }

  @override
  String toString() {
    return 'Outcome{id: $id, category: $category, notes: $notes, amount: $amount, date: $date}';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category': category?.code,
      'notes': notes,
      'amount': amount,
      'date': date.toIso8601String(),
    };
  }
}
