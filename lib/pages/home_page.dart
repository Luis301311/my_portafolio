import 'package:flutter/material.dart';
import 'package:my_portafolio/constants/colors.dart';
import 'package:my_portafolio/constants/size.dart';
import 'package:my_portafolio/constants/skill_items.dart';
import 'package:my_portafolio/widgets/desktop/header_desktop.dart';
import 'package:my_portafolio/widgets/desktop/main_desktop.dart';
import 'package:my_portafolio/widgets/mobile/drawer_mobile.dart';
import 'package:my_portafolio/widgets/mobile/header_mobile.dart';
import 'package:my_portafolio/widgets/mobile/main_mobile.dart';

class HomePage extends StatefulWidget {
 
  const HomePage({super.key});

  @override
 
  State<HomePage> createState
  () => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size; 
    final screenWidth = screenSize.width;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          backgroundColor: CustomColor.scaffoldBg,
          endDrawer: constraints.maxWidth >= kMinDesktopWidth? null: const DrawerMobile(),
          body: Center(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                //NAV  
                if(constraints.maxWidth >= kMinDesktopWidth)
                  const HeaderDesktop()
                else
                  Builder(
                    builder: (context) {
                      return HeaderMobile(
                        onLogoTap: () {},
                        onMenuTap: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                      );
                    },
                  ),
                
                // MAIN
                if(constraints.maxWidth >= kMinDesktopWidth)
                const MainDesktop() else MainMobile(),
                
      
                //SKILL  
                Container(
                  width: screenWidth,
                  padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
                  color: CustomColor.bgLight1,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("HABILIDADES",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.whitePrimary,
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
                              spacing: 10.0,
                              runSpacing: 10.0,
                              children: [
                                for(int i=0; i<platformItems.length; i++)
                                Container(
                                  width: 200,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: CustomColor.bgLight2,
                                    borderRadius: BorderRadius.circular(5)
                                  ),
                                  child: ListTile(
                                    leading: Image.asset(platformItems[i]["img"]),
                                    title: Text(platformItems[i]["title"], style: TextStyle(fontSize: 20),),
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
                                spacing: 10.0,
                                runSpacing: 10.0,
                                children: [
                                  for(int i=0; i< skillItems.length; i++)
                                  Chip(
                                    padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                                    label: Text(skillItems[i]["title"], style: TextStyle(fontSize: 30),), 
                                    avatar: Image.asset(skillItems[i]["img"],) ,
                                    backgroundColor: CustomColor.bgLight2,
                                  )
                                ],
                              ),
                            ),
                          )
                        
                        ],
                      ),
                    ],
                  ),
                ),
                
        
        
        
        
        
        
        
        
        
        
        
        
        
        
                //SKILLS  
                Container(
                  height: 500,
                  width: double.maxFinite,
                ),
                //PROJECTS
                Container(
                  height: 500,
                  width: double.maxFinite,
                  color: Colors.blueGrey,
                ),
                //FOOTER  
                Container(
                  height: 500,
                  width: double.maxFinite,
                ),
              ],
            )
            
          ),
         );
      }
    );
  }
}