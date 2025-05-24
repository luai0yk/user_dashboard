import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String hint;
  final TextInputType? inputType;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;

  const CustomFormField({
    super.key,
    required this.hint,
    required this.controller,
    this.inputType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        autofocus: true,
        textInputAction: TextInputAction.next,
        controller: controller,
        validator: validator,
        keyboardType: inputType,
        cursorColor: Colors.indigo[200],
        cursorWidth: 5,
        cursorRadius: const Radius.circular(10),
        //selectionControls: EmptyTextSelectionControls(),
        // selectionWidthStyle: BoxWidthStyle.tight,
        decoration: InputDecoration(
          hintText: hint,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          hintStyle: TextStyle(color: Colors.indigo[200]),
          border: inputBorder(),
          focusedBorder: inputBorder(),
          disabledBorder: inputBorder(),
          errorBorder: inputBorder(color: Colors.red),
          enabledBorder: inputBorder(color: Colors.indigo[200]!),
        ),
      ),
    );
  }
}

OutlineInputBorder inputBorder({
  Color color = Colors.indigo,
}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(17),
    borderSide: BorderSide(
      color: color,
      width: 2,
    ),
  );
}
