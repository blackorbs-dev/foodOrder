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

import 'package:dropdown_button2/dropdown_button2.dart';

class CustomDropdown extends StatefulWidget {
  final double? width;
  final double? height;
  final List<Gender> options;
  final String hint;
  final Future Function(Gender value) onChanged;

  const CustomDropdown({
    super.key,
    this.width,
    this.height,
    required this.options,
    required this.hint,
    required this.onChanged,
  });

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  Gender? selectedValue;

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    return Container(
        child: DropdownButtonHideUnderline(
      child: DropdownButton2<Gender>(
        isExpanded: true,
        value: selectedValue,
        hint: Text(widget.hint, style: theme.labelLarge),
        items: widget.options.map((item) {
          final isSelected = item == selectedValue;
          return DropdownMenuItem<Gender>(
            value: item,
            child: Container(
              decoration: BoxDecoration(
                color: isSelected ? theme.secondary : null,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item.name, style: theme.titleMedium),
                  if (isSelected)
                    Icon(Icons.check, color: theme.primary, size: 20),
                ],
              ),
            ),
          );
        }).toList(),
        onChanged: (value) async {
          setState(() => selectedValue = value);
          await widget.onChanged(value!);
        },
        selectedItemBuilder: (context) => widget.options
            .map((value) => Align(
                  alignment: Alignment.centerLeft,
                  child: Text(value.name, style: theme.titleMedium),
                ))
            .toList(),
        menuItemStyleData: MenuItemStyleData(
            padding: const EdgeInsets.all(4),
            selectedMenuItemBuilder: (context, child) => Container(
                  decoration: BoxDecoration(
                    color: theme.secondary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  margin: const EdgeInsets.all(4),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(selectedValue!.name, style: theme.titleMedium),
                      Icon(Icons.check, color: theme.primary, size: 20),
                    ],
                  ),
                )),
        buttonStyleData: ButtonStyleData(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: theme.info,
            border: Border.all(color: theme.tertiary),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: theme.info,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        iconStyleData: IconStyleData(
          icon: Icon(Icons.keyboard_arrow_down_rounded, color: theme.accent1),
        ),
      ),
    ));
  }
}
