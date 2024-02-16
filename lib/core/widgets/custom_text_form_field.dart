import 'package:flutter/material.dart';
import '../../../../../core/app_styles/app_styles.dart';
import 'custom_icon_button.dart';

//ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  final String title;
  bool isPassword;
  final bool isSuffixIconShown;
  final TextInputType? keyboardType ;
  final String? Function(String?)? validator ;
  final TextEditingController controller ;
  final IconData? pIcon;

  CustomTextFormField({
    super.key,
    required this.title,
    this.isPassword = false,
    this.isSuffixIconShown = false,
    this.keyboardType,
    required this.validator,
    required this.controller,
    this.pIcon,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FA),
        border: Border.all(
          color: Colors.black12,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        keyboardType: widget.keyboardType ,
        decoration: InputDecoration(
          prefixIcon: widget.pIcon != null ? Icon(
              widget.pIcon,
          ) : null,
          border: InputBorder.none,
          hintText: widget.title,
          hintStyle: AppStyles.style15Grey,
          suffixIcon: widget.isSuffixIconShown == true
              ? CustomIconButton(
            onPressed: () {
              setState(() {
                widget.isPassword = !widget.isPassword;
              });
            },
            icon: widget.isPassword
                ? Icons.remove_red_eye_outlined
                : Icons.visibility_off_outlined,
          )
              : null,
        ),
        obscureText: widget.isPassword,
      ),
    );
  }
}