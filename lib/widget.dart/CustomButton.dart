import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class btn extends StatefulWidget {
  String ButtonText;
  double width;
  final VoidCallback? tap;

  btn({
    Key? key,
    this.tap,
    required this.width,
    required this.ButtonText,
    double? height,
  }) : super(key: key);

  @override
  State<btn> createState() => _btnState();
}

class _btnState extends State<btn> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.tap!(),
      child: Container(
        height: 45.h,
        width: widget.width.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(270.r),
          color: Colors.blue,
        ),
        child: Center(
          child: Text(
            widget.ButtonText,
            style: TextStyle(fontSize: 16.sp, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
