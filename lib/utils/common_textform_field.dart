import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task/utils/app_colors.dart';

class CommonTextField extends StatefulWidget {
  CommonTextField({
    Key? key,
    required this.hintText,
    required this.textInputType,
    this.suffixIcon,
    this.obscureText,
    this.autoFocus = false,
    this.initialText,
    this.readOnly,
    this.fillColor,
    this.maxLines,
    this.onChanged,
    this.maxLength,
    this.style,
    this.counterText,
    this.hintStyle,
    this.errorMessage,
    this.formatter,
    this.fieldIcon,
    this.border,
    this.prefix,
    this.validation,
    this.enabled,
    this.contentPadding,
    TextInputAction? textInputAction,
    this.controller,
  })  : textInputAction = textInputAction ?? TextInputAction.done,
        super(key: key);

  final String hintText;
  final String? initialText;
  final String? counterText;
  String? errorMessage;
  final Widget? suffixIcon;
  final Widget? fieldIcon;
  final TextInputType textInputType;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextInputAction? textInputAction;
  final bool? obscureText, readOnly, enabled;
  final autoFocus;
  final validation;
  final contentPadding;
  final Function(String?)? onChanged;
  final int? maxLines;
  final int? maxLength;
  final List<TextInputFormatter>? formatter;
  final Widget? prefix;
  final Color? fillColor;
  final border;
  final TextEditingController? controller;

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.whiteColor,
            border: Border.all(
              color: AppColors.whiteColor,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.greyCard,
                spreadRadius: 1,
                blurRadius: 5.0,
              ),
            ],
          ),
          // child:
        ),
        TextFormField(
          controller: widget.controller,
          textInputAction: widget.textInputAction,
          inputFormatters: widget.formatter,
          autofocus: widget.autoFocus,
          textCapitalization: TextCapitalization.sentences,
          style: widget.style ??
              TextStyle(
                fontSize: 15,
                color: AppColors.greyFont,
              ),
          initialValue: widget.initialText,
          keyboardType: widget.textInputType,
          enabled: widget.enabled ?? true,
          obscureText: widget.obscureText ?? false,
          maxLines: widget.maxLines ?? 1,
          maxLength: widget.maxLength ?? 500,
          readOnly: widget.readOnly ?? false,
          decoration: InputDecoration(
            contentPadding: widget.contentPadding ??
                const EdgeInsets.only(left: 12, right: 12),
            prefixIcon: widget.prefix,
            counterText: widget.counterText ?? '',
            filled: true,
            fillColor: widget.fillColor ?? AppColors.textFormFillColor,
            border: widget.border ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    width: 2,
                    color: widget.fillColor ?? AppColors.whiteColor,
                  ),
                ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                width: 1,
                color: widget.fillColor ?? AppColors.whiteColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                width: 1,
                color: widget.fillColor ?? AppColors.whiteColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                width: 1,
                color: widget.fillColor ?? AppColors.whiteColor,
              ),
            ),
            hintText: widget.hintText,
            hintStyle: widget.hintStyle ??
                TextStyle(
                  fontSize: 14,
                  color: AppColors.greyFont,
                ),
            suffixIcon: widget.suffixIcon != null
                ? SizedBox(
                    width: 24,
                    height: 24,
                    child: Center(
                      child: widget.suffixIcon,
                    ),
                  )
                : null,
          ),
          onChanged: (String value) {
            if (widget.errorMessage != null) {
              setState(() {
                widget.errorMessage = null;
              });
            }
            widget.onChanged?.call(value);
          },
          validator: widget.validation,
        ),
        /* SizedBox(height: widget.errorMessage == null ? 0 : 5),
        if (widget.errorMessage != null)
          Text(
            widget.errorMessage ?? "",
            style: TextStyle(
              fontSize: 13,
              color: AppColors.redColor,
            ),
          ),*/
      ],
    );
  }
}
