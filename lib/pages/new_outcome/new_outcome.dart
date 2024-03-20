import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mofa/common/widgets/datetime_field.dart';
import 'package:mofa/common/widgets/dropdown_field.dart';
import 'package:mofa/common/widgets/input_field.dart';
import 'package:mofa/data/categories.dart';
import 'package:mofa/model/category.dart';
import 'package:mofa/pages/new_outcome/new_outcome.controller.dart';

class NewOutcome extends ConsumerStatefulWidget {
  const NewOutcome({super.key});

  @override
  ConsumerState<NewOutcome> createState() => _NewOutcomeState();
}

class _NewOutcomeState extends ConsumerState<NewOutcome> {
  final controller = NewOutcomeController();

  List<DropdownMenuItem<Category>> buildCategoriesOption() {
    return categories
        .map(
          (e) => DropdownMenuItem(
            value: e,
            child: Text(
              e.title,
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New outcome'),
        actions: [
          IconButton(
            onPressed: () => controller.save(context, ref),
            icon: const Icon(Icons.done),
          ),],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Form(
            key: controller.form,
            child: Column(
              children: [
                DatetimeField(
                  labelText: "Date",
                  initialDate: controller.outcome.date,
                  onSaved: controller.onDateChange,
                ),
                const SizedBox(
                  height: 16,
                ),
                InputField(
                  labelText: 'Amount',
                  keyboardType: TextInputType.number,
                  onSaved: controller.onAmountChange,
                ),
                const SizedBox(
                  height: 16,
                ),
                DropdownField<Category>(
                  labelText: "Category",
                  value: controller.outcome.category,
                  items: buildCategoriesOption(),
                  onChanged: controller.onCategoryChange,
                ),
                const SizedBox(
                  height: 16,
                ),
                InputField(
                  labelText: 'Notes',
                  keyboardType: TextInputType.multiline,
                  onSaved: controller.onNotesChange,
                ),
                const SizedBox(
                  height: 16,
                ),
                // PrimaryButton(
                //   labelText: 'login.loginButton',
                //   onPressed: () => controller.login(context),
                // ),
                // SecondaryButton(
                //   labelText: 'login.registerButton',
                //   onPressed: () => controller.register(context),
                // ),
                // const LinkButton(labelText: 'login.forgotPasswordLink'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
