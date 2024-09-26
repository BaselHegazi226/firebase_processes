import 'package:flutter/material.dart';

class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton({
    super.key,
    required this.onChanged,
    required this.genderIcon,
    this.selectedItem, // Allow external control of the selected item
  });

  final void Function(String?)? onChanged;
  final String? selectedItem; // External selected item
  final IconData genderIcon;

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  List<String> items = [
    'Male',
    'Female',
    'No gender'
  ]; // Add 'No gender' to the list
  String? selectedItem;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.selectedItem; // Initialize with the external value
  }

  @override
  void didUpdateWidget(CustomDropDownButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedItem != oldWidget.selectedItem) {
      setState(() {
        selectedItem =
            widget.selectedItem; // Update if the external value changes
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8), // Rounded corners
        border: Border.all(
          color: Colors.transparent,
          width: 2,
        ),
        color: Colors.grey.shade200,
      ),
      width: MediaQuery.of(context).size.width * .9,
      child: DropdownButtonFormField<String>(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          border: InputBorder.none, // Removes the default border
          icon: Icon(widget.genderIcon),
          filled: true,
          fillColor: Colors.grey.shade200,
          errorStyle: const TextStyle(
            fontSize: 16,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ), // Style for the error text
        ),
        value: selectedItem,
        hint: const Text(
          'Select Gender',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        isExpanded: true,
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w900,
              ),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedItem = newValue; // Update the selected item
          });
          widget.onChanged?.call(newValue); // Notify parent widget
        },
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 24,
      ),
    );
  }
}
