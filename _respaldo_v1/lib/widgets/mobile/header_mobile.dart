import 'package:flutter/material.dart';
import 'package:my_portafolio/styles/style.dart';
import 'package:my_portafolio/widgets/silte_logo.dart';
class HeaderMobile extends StatelessWidget {
  const HeaderMobile({super.key, this.onLogoTap, this.onMenuTap});
  final VoidCallback? onLogoTap;
  final VoidCallback? onMenuTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      margin: EdgeInsets.fromLTRB(40, 5, 20, 5),
      decoration: boxDecorationHeder,
      child: Row(
        children: [
          SilteLogo(
            ontap: onLogoTap,
          ),
          const Spacer(),
          IconButton(
            onPressed: onMenuTap,
            icon: const  Icon(Icons.menu)
          ),
          const SizedBox(width: 15),
        ],
      ),
    );
  }
}