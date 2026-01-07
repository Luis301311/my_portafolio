import 'package:flutter/material.dart';
import 'package:my_portafolio/constants/colors.dart';
class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size; 
    final screenWidth = screenSize.width;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image:  AssetImage("fondo5.jpg"),
          fit: BoxFit.cover)
      ),
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      height: screenSize.height/1.2,
      constraints: BoxConstraints( minHeight: 350.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Hola, mi nombre es",
              style: TextStyle(
                color: CustomColor.hintDark,
                fontSize: screenWidth/40,
                height: 1.5,
                fontWeight: FontWeight.w900
              ),),
              Text("Luis Vega",
              style: TextStyle(
                color: CustomColor.whitePrimary,
                fontSize: screenWidth/13,
                height: 1,
                fontWeight: FontWeight.bold
              ),),
              Text("Ingeniero de sistemas & Tecnico en Sistemas",
              style: TextStyle(
                color: CustomColor.hintDark,
                fontSize: screenWidth/50,
                height: 1.8,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 40,),
              SizedBox(
                width: screenWidth/5,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColor.yellowPrimary,
                  ),
                  onPressed: (){}, 
                  child: Text("Contactame", style: TextStyle(color: CustomColor.whitePrimary, fontSize: screenWidth/55),)),
              )
            ],
          ),
        Container(
          padding: const EdgeInsets.all(4), 
          decoration: BoxDecoration(
            color: CustomColor.yellowPrimary,// color del borde
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            radius: screenWidth / 8,
            backgroundImage: AssetImage("avatar2.1.jpg"),
            backgroundColor: Colors.grey[200], // color de fondo dentro del avatar
          ),
        )

        ],
      ),
    );   
  }
}