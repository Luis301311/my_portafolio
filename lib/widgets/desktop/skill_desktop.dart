import 'package:flutter/material.dart';
import 'package:my_portafolio/constants/colors.dart';
import 'package:my_portafolio/constants/skill_items.dart';
import 'package:my_portafolio/widgets/hover_scale.dart';

class SkillDesktop extends StatelessWidget {
  const SkillDesktop({super.key});
  @override
  Widget build(BuildContext context) {
  final screenSize = MediaQuery.of(context).size;
  final screenWidth = screenSize.width; 
    return Container(
      width: screenWidth,
      padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: CustomColor.bgLight1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("HABILIDADES",
            style: TextStyle(
              fontSize: screenWidth * 0.02,
              fontWeight: FontWeight.bold,
              color: CustomColor.yellowPrimary,
            ),
          ),
          SizedBox(height: 50,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints:  BoxConstraints(
                  maxWidth: screenWidth/2
                ),
                child: Wrap(
                  spacing: 14.0,
                  runSpacing: 14.0,
                  alignment: WrapAlignment.center,
                  children: [
                    for(int i=0; i<platformItems.length; i++)
                    HoverScale(
                      onTap: () {
                        
                      },
                      scale: 1.04,
                      child: Container(
                        width: screenWidth/5,
                        height: 150,
                        decoration: BoxDecoration(
                          color: CustomColor.bgLight2,
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:  EdgeInsets.all(screenWidth * 0.006),
                              child: Image.asset(
                                platformItems[i]["img"],
                                fit: BoxFit.fill,
                                height: screenWidth * 0.05,
                                width: screenWidth *0.05,
                              ),
                            ),
                            SizedBox(width: screenWidth *0.010,),
                            Text(platformItems[i]["title"], style: TextStyle(fontSize: screenWidth/60)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(width: 50.0,),

              Flexible(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: screenWidth/2
                  ),
                  child: Wrap(
                    spacing: 14.0,
                    runSpacing: 14.0,
                    children: [
                      for(int i=0; i< skillItems.length; i++)
                      HoverScale(
                        onTap: () {
                          
                        },
                        scale: 1.05,
                        child: Chip(
                          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                          label: Text(skillItems[i]["title"], style: TextStyle(fontSize: 30),), 
                          avatar: Image.asset(skillItems[i]["img"],) ,
                          backgroundColor: CustomColor.bgLight2,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}