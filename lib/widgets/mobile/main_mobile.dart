import 'package:flutter/material.dart';
import 'package:my_portafolio/constants/colors.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
  final screenSize = MediaQuery.of(context).size;
  final screenHeight = screenSize.height;
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 40.0, 
        horizontal: 30.0
      ),
      height:screenHeight,
      constraints: const BoxConstraints(minHeight: 560.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            ShaderMask(
              shaderCallback: (bounds){
                return LinearGradient(colors: [
                  CustomColor.scaffoldBg.withOpacity(0.6),
                  CustomColor.scaffoldBg.withOpacity(0.6),
                ]
                ).createShader(bounds);
              },
              blendMode:  BlendMode.srcATop,
              child: Container(
                    padding: const EdgeInsets.all(4), 
                    decoration: BoxDecoration(
                      color: CustomColor.yellowPrimary,
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      radius: screenHeight/5,
                      backgroundImage: AssetImage("avatar2.1.jpg"),
                    ),
                  )
            ),
            SizedBox(height: 10,),
            Text("Hola, mi nombre es",
            style: TextStyle(
              color: CustomColor.hintDark,
              fontSize: screenHeight/40,
              height: 1.5,
              fontWeight: FontWeight.w900
            ),),
            Text("Luis Vega",
            style: TextStyle(
              color: CustomColor.whitePrimary,
              fontSize: screenHeight/12,
              height: 1,
              fontWeight: FontWeight.bold
            ),),
            Text("Ingeniero de sistemas & Tecnico en Sistemas",
            style: TextStyle(
              color: CustomColor.hintDark,
              fontSize: screenHeight/50,
              height: 2,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 15,),
            SizedBox(
              width: 190.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColor.yellowPrimary,
                ),
                onPressed: (){}, 
                child: Text("Contactame", style: TextStyle(color: CustomColor.whitePrimary),)),
            )
        ],
      ),
    );
  }
}