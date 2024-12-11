import 'package:flutter/material.dart';
import 'package:projeto_login/utils/colors.dart';

class GradientBrackground extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final BoxShape shape;

  const GradientBrackground({this.shape = BoxShape.rectangle, this.child, this.width, this.height, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: shape,
        gradient: linearGradiente(context)
      ),
      width: width,
      height: height,
      child: child,
    );
  }
}
