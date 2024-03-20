import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mofa/model/category.dart';
import 'package:mofa/model/outcome.dart';
import 'package:mofa/provider/outcome_list.dart';

class NewOutcomeController {
  Outcome outcome = Outcome.empty();
  final form = GlobalKey<FormState>();

  void onDateChange(DateTime? date) {
    outcome = outcome.copyWith(date: date);
  }

  void onAmountChange(String? amount) {
    if (amount == null) return;

    try {
      int value = (double.parse(amount) * 100).round();
      outcome = outcome.copyWith(amount: value);
    } catch (e) {
      return;
    }
  }

  void onNotesChange(String? notes) {
    outcome = outcome.copyWith(notes: notes);
  }

  void onCategoryChange(Category? category) {
    outcome = outcome.copyWith(category: category);
  }

  void save(BuildContext ctx, WidgetRef ref) {
    if (form.currentState!.validate()) {
      form.currentState!.save();
      ref.read(outcomeListProvider.notifier).add(outcome);
      ctx.pop();
    }
  }
}
