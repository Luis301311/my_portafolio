
import 'package:flutter/material.dart';
import 'package:my_portafolio/constants/colors.dart';
import 'package:my_portafolio/widgets/hover_scale.dart';
import 'package:my_portafolio/widgets/pulsing_border.dart';
class MainDesktop extends StatefulWidget {
  const MainDesktop({super.key});

  @override
  State<MainDesktop> createState() => _MainDesktopState();
}

class _MainDesktopState extends State<MainDesktop> {
  double _scale = 1.0; 
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size; 
    final screenWidth = screenSize.width;
    return 
    Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    height: screenSize.height / 1.2,
    constraints: const BoxConstraints(minHeight: 350),
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
    child: Stack(
    fit: StackFit.expand,
    children: [


      Center(
        child: Transform.scale(
          scale: screenWidth/1000 ,
          child: FittedBox(
            fit: BoxFit.cover,
            child: Text(
              'LV',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 600, // base
                fontWeight: FontWeight.w900,
                letterSpacing: 40,
                color: CustomColor.yellowPrimary.withOpacity(0.02)
  /*                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 3
                  ..color = CustomColor.yellowPrimary.withOpacity(0.03),  */
              ),
            ),
          ),
        ),
      ),

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
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            //PRESENTACION
              HoverScale(
                scale: 1.1,
                child: Padding(
                  padding:  EdgeInsets.only(left: screenWidth/50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Hola, soy",
                      style: TextStyle(
                        color: CustomColor.hintDark,
                        fontSize: screenWidth/40,
                        height: 1.5,
                        fontWeight: FontWeight.w900
                      ),),
                      Text("LUIS VEGA",
                      style: TextStyle(
                        color: CustomColor.whitePrimary,
                        fontSize: screenWidth/10,
                        height: 1,
                        fontWeight: FontWeight.bold,
                      ),),
                      Text("Ingeniero de sistemas & Tecnico en Sistemas",
                      style: TextStyle(
                        color: CustomColor.hintDark,
                        fontSize: screenWidth/50,
                        height: 1.8,
                        fontWeight: FontWeight.bold
                      ),),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 150,),
              //APLICACIONES
              Padding(
                padding:  EdgeInsets.only(left: screenWidth/50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Linkedink
                    InkWell(
                      onTap: () {
                        
                      },
                      child: HoverScale(
                        scale: 1.1,
                        child: Column(
                          children: [
                            Image.asset(
                              "linkedinnew.png",
                              height: screenWidth/15,),
                            Text("Linkedin", style: TextStyle(
                              color: CustomColor.whitePrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth/80,
                              height: 2.3,
                            ),)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth/45,),
                    //GitHuh
                    InkWell(
                      onTap: () {
                        
                      },
                      child: HoverScale(
                        scale: 1.1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "git.png",
                              height: screenWidth/15,),
                            Text("GitHud", style: TextStyle(
                              color: CustomColor.whitePrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth/80,
                              height: 2.3,
                            ),)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Column(
            children: [
              Padding(
                padding:  EdgeInsets.only(top: 50.0, left: screenWidth/5 ),
                child: OutlinedButton(
                  onPressed: (){}, 
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: CustomColor.yellowPrimary,
                      width: 3,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(30)
                    ),
                    padding: EdgeInsets.all(15)
                  ),  
                  child: Row(
                    children: [
                      Image.asset("correo-electronico.png", height: screenWidth/40,),
                      SizedBox(width: screenWidth/200,),
                      Text("Luisvm301@gmail.com", style: TextStyle(color: CustomColor.whitePrimary, fontSize: screenWidth/70,),)
                    ],
                  ) 
                ),
              ),
              
              Row(
                children: [
                  //AVATAR
                  Padding(
                    padding:  EdgeInsets.only(left: screenWidth/50, top: 120.0),
                    child: PulsingBorder(
                      color: CustomColor.yellowPrimary,
                      child: Container(
                        padding: const EdgeInsets.all(4), 
                        decoration: BoxDecoration(
                          color: CustomColor.yellowSecondary,// color del borde
                          shape: BoxShape.circle,
                        ),
                        child: HoverScale(
                          scale: 1.01,
                          child: CircleAvatar(
                            radius: screenWidth / 7,
                            backgroundImage: AssetImage("avatar2.1.jpg"),
                            backgroundColor: Colors.grey[200], // color de fondo dentro del avatar
                          ),
                        ),
                      ),
                    ),
                  ),

                  // COMOCE MAS
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 250.0),
                        child: Text("Conoce mas", style: TextStyle(fontSize: screenWidth/70,),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: screenWidth/80),
                        child: Text("De mi", style: TextStyle(fontSize: screenWidth/45, ),),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: screenWidth/60),
                        child: Text("Aqui", style: TextStyle(fontSize: screenWidth/70),),
                      ),
                      

                    HoverScale(
                      onTap: () => {},
                      scale: 1.2,
                      child: Padding(
                      padding:  EdgeInsets.only(left: screenWidth/50, top: 17.0),
                      child: Image.asset("flecha-Correcta.png",
                        height: screenWidth/10,),
                      ),
                    ),
                    ],
                  )
                ],
              )
            ],
          )
        ],
      )
    ],
  ),
);}}
