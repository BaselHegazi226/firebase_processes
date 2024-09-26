import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;

  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final FocusNode? focusNode; // Added FocusNode
  final String? errorMess;
  final void Function(String)? onChanged;
  final Color color;
  final void Function()? onTap;
  final void Function(String?)? onSaved;
  final void Function(String)? onFieldSubmitted;
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.textEditingController,
    required this.keyboardType,
    required this.color,
    this.onFieldSubmitted,
    this.obscureText = false,
    this.onChanged,
    this.prefixIcon,
    this.focusNode,
    this.errorMess,
    this.onTap,
    this.onSaved,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .9,
      child: TextFormField(
        maxLines: null,
        onFieldSubmitted: onFieldSubmitted,
        onSaved: onSaved,
        onTap: onTap,
        controller: textEditingController,
        obscureText: obscureText,
        onChanged: onChanged,
        focusNode: focusNode,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Empty Field';
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w900,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          prefixStyle: TextStyle(
            color: color,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: color,
            fontWeight: FontWeight.w600,
          ),
          border: outlineInputBorder(
            borderRadius: 8,
            color: Colors.transparent,
          ),
          enabledBorder: outlineInputBorder(
            borderRadius: 8,
            color: Colors.transparent,
          ),
          focusedBorder: outlineInputBorder(
            borderRadius: 8,
            color: color, // Focus color applied here
          ),
          disabledBorder: outlineInputBorder(
            borderRadius: 8,
            color: Colors.transparent,
          ),
          errorBorder: outlineInputBorder(
            borderRadius: 8,
            color: focusNode != null && focusNode!.hasFocus
                ? color // Change to focus color on error
                : Colors.red,
          ),
          focusedErrorBorder: outlineInputBorder(
            borderRadius: 8,
            color: focusNode != null && focusNode!.hasFocus
                ? color // Change to focus color on error
                : Colors.red,
          ),
          errorStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          errorText: errorMess,
          fillColor: Colors.grey.shade200,
          filled: true,
        ),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder({
    required double borderRadius,
    required Color color,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(borderRadius),
      ),
      borderSide: BorderSide(
        color: color,
        width: 2,
      ),
    );
  }
}
