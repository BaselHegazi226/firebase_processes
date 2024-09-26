import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
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
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .9,
      child: TextFormField(
        maxLines: null,
        onFieldSubmitted: widget.onFieldSubmitted,
        onSaved: widget.onSaved,
        onTap: () {
          setState(() {});
          FocusScope.of(context).requestFocus(widget.focusNode);
        },
        controller: widget.textEditingController,
        obscureText: widget.obscureText,
        onChanged: widget.onChanged,
        focusNode: widget.focusNode,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Empty Field';
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        style: TextStyle(
          color: widget.color,
          fontWeight: FontWeight.w900,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: widget.color,
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
            color: widget.color,
          ),
          disabledBorder: outlineInputBorder(
            borderRadius: 8,
            color: Colors.transparent,
          ),
          errorBorder: outlineInputBorder(
            borderRadius: 8,
            color: widget.focusNode != null && widget.focusNode!.hasFocus
                ? widget.color
                : Colors.red,
          ),
          focusedErrorBorder: outlineInputBorder(
            borderRadius: 8,
            color: widget.focusNode != null && widget.focusNode!.hasFocus
                ? widget.color
                : Colors.red,
          ),
          errorStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          errorText: widget.errorMess,
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
