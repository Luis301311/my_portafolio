import 'package:flutter/material.dart';
import 'package:my_portafolio/constants/colors.dart';
import 'package:my_portafolio/constants/proyect_items.dart';
import 'package:my_portafolio/widgets/hover_scale.dart';

class ProyectsDesktop extends StatelessWidget {
  const ProyectsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width; 
    return Container(
        decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff252734),
            Color(0xff2E3043),
            Color(0xff333646),
          ],
        ),
      ),
      height: screenWidth * 0.28,
      width: double.maxFinite,
      child: Stack(
        fit: StackFit.expand,
        children: [
          //  Glow amarillo
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Color(0xffFFAF29).withOpacity(0.35),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          //  Glow gris
          Positioned(
            bottom: -120,
            left: -120,
            child: Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Color(0xffD3D3D6).withOpacity(0.18),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          
          //CONTENIDO
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.all(screenWidth * 0.009),
                child: Text("PROYECTOS",
                  style: TextStyle(
                    fontSize: screenWidth * 0.02,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.whitePrimary,
                  ), 
                ),
              ),
              Wrap(
                spacing: screenWidth * 0.050,
                children: [
                  for( int i = 0; i< proyectItems.length; i ++)
                  HoverScale(
                    scale: 1.1,
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      height: screenWidth * 0.21,
                      width: screenWidth * 0.19,
                      decoration: BoxDecoration(
                        borderRadius:  BorderRadius.circular(20),
                        color: CustomColor.bgLight2,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: screenWidth * 0.100,
                            width: screenWidth * 0.50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color:  CustomColor.whitePrimary
                            ),
                            child: Stack(
                              children: [
                                Image.asset(proyectItems[i]["img"], 
                                  fit: BoxFit.contain,
                                  height: screenWidth * 0.100,
                                  width: screenWidth * 0.50,
                                ), 
                                Positioned(
                                  left: screenWidth * 0.165,
                                  child:
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(proyectItems[i]["skills"], // Herramientas
                                        fit: BoxFit.contain,
                                        height: screenWidth * 0.02,
                                        width: screenWidth * 0.02,
                                        ),
                                  )
                                    ),
                              ],
                            ),
                          ),
                              
                          Padding(
                            padding:  EdgeInsets.only(left: screenWidth * 0.01 , top: screenWidth * 0.005),
                            child: Text( proyectItems[i]["title"], 
                              style: TextStyle(
                                fontSize: screenWidth * 0.016,
                                fontWeight: FontWeight.bold,
                                color: CustomColor.whitePrimary
                              ),
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: screenWidth * 0.01 , right: screenWidth * 0.01),
                            child: Text(proyectItems[i]["Context"],
                              style: TextStyle(
                              fontSize: screenWidth * 0.0060,
                              color: CustomColor.whiteSecondary
                            ),
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: screenWidth * 0.02,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: CustomColor.bgLight1
                            ),
                            child: Padding(
                              padding:  EdgeInsets.only(left: screenWidth * 0.005, right: screenWidth * 0.005, top: screenWidth * 0.0010, bottom:screenWidth * 0.0010),
                              child: Row(
                                children: [
                                  Text("Compatible", style: TextStyle( color: CustomColor.yellowPrimary, fontWeight: FontWeight.w500),),
                                  Spacer(),
                                  for( var item in proyectItems[i]["compatible"])
                                  Image.asset(item),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}