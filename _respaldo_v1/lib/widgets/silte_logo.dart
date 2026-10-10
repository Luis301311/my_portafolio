import 'package:flutter/material.dart';
import 'package:my_portafolio/constants/colors.dart';

class SilteLogo extends StatelessWidget {
  const SilteLogo({super.key, this.ontap});
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
      },
      child: Text("LV", style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: CustomColor.yellowPrimary
      ),),
    );
  }
}