import 'package:flutter/material.dart';
import 'package:my_portafolio/constants/colors.dart';
import 'package:my_portafolio/constants/proyect_items.dart';
import 'package:my_portafolio/constants/size.dart';
import 'package:my_portafolio/constants/skill_items.dart';
import 'package:my_portafolio/widgets/desktop/contact._desktop.dart';
import 'package:my_portafolio/widgets/desktop/header_desktop.dart';
import 'package:my_portafolio/widgets/desktop/main_desktop.dart';
import 'package:my_portafolio/widgets/desktop/proyects_desktop.dart';
import 'package:my_portafolio/widgets/desktop/skill_desktop.dart';
import 'package:my_portafolio/widgets/hover_scale.dart';
import 'package:my_portafolio/widgets/mobile/drawer_mobile.dart';
import 'package:my_portafolio/widgets/mobile/header_mobile.dart';
import 'package:my_portafolio/widgets/mobile/main_mobile.dart';
import 'package:my_portafolio/widgets/mobile/skill_mobile.dart';

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
                if(constraints.maxWidth >= kMinDesktopWidth)
                const SkillDesktop() else SkillMobile(),

                //PROJECTS
                ProyectsDesktop(), 
  
                //CONTACTO
                ContactDesktop(),
              ],
            )
          ),
         );
      }
    );
  }
}