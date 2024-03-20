import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mofa/model/outcome.dart';

class OutcomeListItem extends StatelessWidget {
  final Outcome outcome;

  const OutcomeListItem({super.key, required this.outcome});

  String formatDate(DateTime date, String format) {
    return DateFormat(format).format(date);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
          width: 50,
          height: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                formatDate(outcome.date, DateFormat.DAY),
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                formatDate(outcome.date, DateFormat.ABBR_MONTH),
              ),
            ],
          )),
      title: Text(outcome.category!.title),
      subtitle: Text(outcome.notes),
      trailing: Text(outcome.formattedAmount),
    );
  }
}
