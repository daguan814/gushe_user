import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


//带图标按钮的通用模版
class MyButtonWidget extends StatelessWidget {
  const MyButtonWidget({
    Key? key,
    this.text,
    this.width,
    this.height,
    this.radius,
    this.onPressed,
    this.icon,
  }) : super(key: key);

  final String? text;
  final double? width;
  final double? height;
  final double? radius;
  final void Function()? onPressed;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 160,
      height: height ?? 45,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 43),
      ),
      child: ElevatedButton.icon(
          onPressed: onPressed ?? ((){}),
          label: Text(
            text ?? "Get Started",
            // ignore: prefer_const_constructors
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
          icon: icon ?? const Icon(Icons.arrow_right_alt_sharp)),
    );
  }
}
