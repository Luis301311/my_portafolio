import 'package:flutter/material.dart';
import 'package:my_portafolio/constants/colors.dart';
import 'package:my_portafolio/constants/nav_items.dart';
import 'package:my_portafolio/styles/style.dart';
import 'package:my_portafolio/widgets/silte_logo.dart';

class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      width: double.maxFinite,
      decoration: boxDecorationHeder,
      child: Row(
        children: [
          SilteLogo(),
          Spacer(),
          for(int i = 0; i<navTitles.length ; i++)
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: TextButton(
                onPressed: (){}, 
                child: Text(navTitles[i], 
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: CustomColor.whitePrimary
                ),)
              ),
            )
        ],
      ),
    );
  }
}

