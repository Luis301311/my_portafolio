import 'package:flutter/material.dart';
import 'package:my_portafolio/constants/colors.dart';
import 'package:my_portafolio/constants/size.dart';
import 'package:my_portafolio/widgets/desktop/header_desktop.dart';
import 'package:my_portafolio/widgets/mobile/drawer_mobile.dart';
import 'package:my_portafolio/widgets/mobile/header_mobile.dart';

class HomePage extends StatefulWidget {
 
  const HomePage({super.key});

  @override
 
  State<HomePage> createState
  () => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, Constraints) {
        return Scaffold(
          backgroundColor: CustomColor.scaffoldBg,
          endDrawer: Constraints.maxWidth >= kMinDesktopWidth? null: const DrawerMobile(),
          body: Center(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                //MAIN  
              if(Constraints.maxWidth >= kMinDesktopWidth)
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
              
        
        
                
                //MAIN  
                Container(
                  height: 500,
                  width: double.maxFinite,
                  color: Colors.blueGrey,
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