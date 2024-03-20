import 'package:flutter/material.dart';
import 'package:mofa/common/widgets/style/input_field.dart';

class DropdownField<T> extends StatefulWidget {
  final String labelText;
  final void Function(T?) onChanged;
  final T? value;
  final List<DropdownMenuItem<T>> items;

  const DropdownField({
    super.key,
    required this.labelText,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  State<DropdownField<T>> createState() => _DropdownFieldState<T>();
}

class _DropdownFieldState<T> extends State<DropdownField<T>> {

  T? value;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  _onChange(T? newCategory) {
    setState(() {
      value = newCategory;
    });
    widget.onChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: TextStyle(
            fontSize: 16,
            color: theme.primaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: theme.primaryColor,
            ),
          ),
          child: DropdownButton<T>(
            underline: const SizedBox(),
            isExpanded: true,
            value: value,
            items: widget.items,
            onChanged: _onChange,
            style: inputStyle(theme)
          ),
        ),
      ],
    );
  }
}
