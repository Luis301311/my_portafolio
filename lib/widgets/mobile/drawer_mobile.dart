import 'package:flutter/material.dart';
import 'package:my_portafolio/constants/colors.dart';
import 'package:my_portafolio/constants/nav_items.dart';

class DrawerMobile extends StatelessWidget {
  const DrawerMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor:CustomColor.scaffoldBg,
      child: ListView(
        children: [
          Align(
            alignment: AlignmentGeometry.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
              child: IconButton(
                onPressed: (){
                  Navigator.of(context).pop();
                }, 
                icon: Icon(Icons.close)
              ),
            ),
          ),

          for(int i=0; i <navIcons.length ; i++)
          ListTile(
            titleTextStyle:TextStyle(
              color: CustomColor.whitePrimary,
              fontWeight: FontWeight.w600,
              fontSize: 16
            ) ,
            leading: Icon(navIcons[i]),
            title: Text(navTitles[i]),
            onTap: (){

            },
          )
        ],
      ),
    ); 
  }
}