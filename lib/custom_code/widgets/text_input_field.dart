// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class TextInputField extends StatefulWidget {
  const TextInputField({
    super.key,
    this.width,
    this.height,
    required this.hintText,
    required this.trailingText,
    this.initialValue,
    required this.onChanged,
  });

  final double? width;
  final double? height;
  final String hintText;
  final String? trailingText;
  final String? initialValue;
  final Future Function(String value) onChanged;

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue ?? '');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.info,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
          controller: _controller,
          style: theme.titleMedium,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            isDense: true,
            hintText: widget.hintText,
            hintStyle: theme.labelLarge,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: theme.tertiary),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: theme.tertiary),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: theme.tertiary),
            ),
            suffixIconConstraints: const BoxConstraints(),
            suffixIcon: widget.trailingText == null
                ? null
                : Padding(
                    padding: EdgeInsets.only(right: 10),
                    child:
                        Text(widget.trailingText!, style: theme.titleMedium)),
            // contentPadding:
            //     const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          ),
          onChanged: (value) async {
            await widget.onChanged(value);
          }),
    );
  }
}
