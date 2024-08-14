import 'package:case_riverpod/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.widget,
    this.color,
    this.textColor,
    this.height,
    this.width,
    required this.text,
    required this.onPressed,
  });

  final double? height;
  final double? width;
  final Widget? widget;
  final String text;
  final Color? color;
  final Color? textColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      height: height ?? 45.h,
      elevation: 0,
      minWidth: width ?? 200.w,
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.r),
        side: BorderSide(
          width: 2.w,
        ),
      ),
      color: AppColors.lightBlue,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: widget ??
            Text(text,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium!),
      ),
    );
  }
}
