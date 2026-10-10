import 'package:flutter/material.dart';
import 'package:my_portafolio/constants/colors.dart';
import 'package:my_portafolio/constants/skill_items.dart';
import 'package:my_portafolio/widgets/hover_scale.dart';

class SkillMobile extends StatelessWidget {
  const SkillMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return   Container(
      padding: EdgeInsets.all(10),
      width: screenWidth,
      color: CustomColor.bgLight1,
      child: Column(
        children: [
          Text("HABILIDADES", style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: CustomColor.whitePrimary,),),
          SizedBox(height: 10,),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: screenWidth
            ),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                for (int i =0; i < platformItems.length; i++)
                HoverScale(
                  scale: 1.1,
                  child: Container(
                    width: 350,
                    height: 60,
                    decoration: BoxDecoration(
                      color: CustomColor.bgLight2,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child:
                      ListTile(
                      leading: Image.asset(platformItems[i]["img"], scale: 0.01,),
                      title: Text(platformItems[i]["title"], style: TextStyle(fontSize: 25),),
                    ),
                  ),
                )
              ],
            ),
          ),
          
          SizedBox(height:20 ,),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: screenWidth
              ),
              child: Wrap(
                spacing: 17,
                runSpacing: 15,
                children: [
                  for( int i = 0; i < skillItems.length; i++)
                  HoverScale(
                    scale: 1.1,
                    onTap: () {
                      
                    },
                    child: Chip(
                      label: Text(skillItems[i]["title"], style: TextStyle(fontSize: 24),),
                      avatar: Image.asset(skillItems[i]["img"], scale: 0.1,),
                      backgroundColor: CustomColor.bgLight2,
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}