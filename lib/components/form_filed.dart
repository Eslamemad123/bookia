import 'package:bookia/core/utils/app%20assets.dart';
import 'package:bookia/core/utils/app%20color.dart';
import 'package:bookia/core/utils/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Form_Filed extends StatefulWidget {
  Form_Filed({
    super.key,
    this.obscureText = false,
    this.validator,
    this.controller,
    required this.text,
    this.icon = false,
    this.inputFormatters,
  });
  bool obscureText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String text;
  final bool icon;
  bool eyeIcon = false;
  final List<TextInputFormatter>? inputFormatters;
  @override
  State<Form_Filed> createState() => _Form_FiledState();
}

class _Form_FiledState extends State<Form_Filed> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: TextFormField(
        inputFormatters: widget.inputFormatters,
        controller: widget.controller,
        validator: widget.validator,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          filled: true,
          fillColor: App_Color.formBackGroundColor,
          label: Text(
            widget.text,
            style: Text_Style.getText16(color: App_Color.textgreyForm),
          ),
          suffixIcon:
              widget.icon
                  ? Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.obscureText = !widget.obscureText;
                          widget.eyeIcon = !widget.eyeIcon;
                        });
                      },
                      child:
                          !widget.eyeIcon
                              ? SvgPicture.asset(App_Assets.showPasswordSVG)
                              : Icon(Icons.visibility_off_outlined),
                    ),
                  )
                  : null,
          suffixIconConstraints: BoxConstraints(maxWidth: 40, maxHeight: 40),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: App_Color.borderFormFiled, width: 1),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: App_Color.borderFormFiled, width: 1),
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: App_Color.borderFormFiled, width: 1),
          ),

          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: App_Color.borderFormFiled, width: 1),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: App_Color.borderFormFiled, width: 1),
          ),

          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: App_Color.borderFormFiled, width: 1),
          ),
        ),
      ),
    );
  }
}
