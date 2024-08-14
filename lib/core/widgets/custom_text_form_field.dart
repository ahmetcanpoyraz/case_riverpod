import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final Widget? suffixIcon;
  final TextEditingController txtController;
  final TextInputType keyboardType;
  final String hintText;
  final int? maxLines;
  final FocusNode? focusNode;
  final bool? obscureText;
  final int? maxLength;
  final bool? readOnly;
  final bool? enabled;
  final String? initialValue;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? errorStyle;
  final TextInputAction? txtInputAction;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final Function()? onTap;
  final List<TextInputFormatter>? inputFilterList;
  const CustomTextFormField(
      {super.key,
      this.maxLines,
      this.focusNode,
      required this.hintText,
      required this.keyboardType,
      this.validator,
      this.onChanged,
      this.enabled,
      this.errorStyle,
      required this.txtController,
      this.maxLength,
      this.inputFilterList,
      this.obscureText = false,
      this.txtInputAction,
      this.onTap,
      this.readOnly = false,
      this.suffixIcon,
      this.contentPadding,
      this.initialValue});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        focusNode: focusNode,
        style: Theme.of(context).textTheme.displayMedium!,
        textInputAction: txtInputAction,
        maxLines: maxLines ?? 1,
        readOnly: readOnly!,
        obscureText: obscureText!,
        maxLength: maxLength,
        enabled: enabled,
        controller: txtController,
        validator: validator,
        onChanged: onChanged,
        onTap: onTap,
        keyboardType: keyboardType,
        inputFormatters: inputFilterList,
        decoration: InputDecoration(
          hintStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: AppColors.grey,
              ),
          isDense: true,
          counter: const Offstage(),
          contentPadding: contentPadding ?? EdgeInsets.all(15.h),
          fillColor: Colors.transparent,
          filled: true,
          errorMaxLines: 3,
          errorStyle: Theme.of(context).textTheme.displaySmall!.copyWith(
                color: AppColors.red,
              ),
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.grey,
            ),
            borderRadius: BorderRadius.circular(5.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.grey,
            ),
            borderRadius: BorderRadius.circular(5.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.blue,
            ),
            borderRadius: BorderRadius.circular(5.r),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.red,
            ),
            borderRadius: BorderRadius.circular(5.r),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.grey,
            ),
            borderRadius: BorderRadius.circular(5.r),
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}
