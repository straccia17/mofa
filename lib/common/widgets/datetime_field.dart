import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:mofa/common/constant.dart';
import 'package:mofa/common/widgets/style/input_field.dart';

class DatetimeField extends StatefulWidget {
  final String labelText;
  final DateTime? initialDate;
  final void Function(DateTime?) onSaved;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const DatetimeField({
    super.key,
    required this.labelText,
    required this.onSaved,
    this.initialDate,
    this.validator,
    this.controller,
  });

  @override
  State<DatetimeField> createState() => _DatetimeFieldState();
}

class _DatetimeFieldState extends State<DatetimeField> {
  late DateTime _selectedDate;
  late TextEditingController _controller;

  void _onCalendarIconTap() {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      locale: LocaleType.it,
      onConfirm: (date) {
        setState(() {
          _selectedDate = date;
          _updateFieldText();
        });
      },
      currentTime: _selectedDate,
    );
  }

  @override
  void initState() {
    _selectedDate = widget.initialDate ?? DateTime.now();
    _controller = widget.controller ?? TextEditingController();
    _updateFieldText();
    super.initState();
  }

  void _updateFieldText() {
    _controller.text = DateFormat(Constant.dateTimeFormat).format(_selectedDate);
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
        Stack(
          children: [
            TextFormField(
              controller: _controller,
              style: inputStyle(theme),
              decoration: inputDecoration(theme),
              readOnly: true,
              validator: widget.validator,
              onSaved: (val) {
                widget.onSaved(_selectedDate);
              },
            ),
            Positioned(
              right: 0,
              top: 0,
              child: IconButton(
                onPressed: _onCalendarIconTap,
                icon: const Icon(Icons.calendar_today),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
