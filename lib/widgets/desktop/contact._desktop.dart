import 'package:flutter/material.dart';
import 'package:my_portafolio/constants/colors.dart';

class ContactDesktop extends StatelessWidget {
  const ContactDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width; 
    return Container(
      height: screenWidth * 0.3,
      width: double.infinity,
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
          // GLOW GRIS
          Positioned(
            bottom:360,
            left: -220,
            child: Container(
              width: 500,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Colors.white.withOpacity(0.15),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // CONTENIDO
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Contáctame",
                  style: TextStyle(
                    fontSize: screenWidth * 0.02,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.whitePrimary,
                  ),
                ),

                 SizedBox(height: screenWidth * 0.01),

                Text(
                  "¿Tienes un proyecto en mente o quieres trabajar conmigo?",
                  style: TextStyle(
                    fontSize: screenWidth * 0.01,
                    color: CustomColor.whiteSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: screenWidth * 0.02),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // FORMULARIO
                    Container(
                      width: screenWidth * 0.5,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: CustomColor.bgLight2,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          TextField(
                            style: TextStyle(color: CustomColor.whitePrimary),
                            decoration: InputDecoration(
                              hintText: "Nombre",
                              hintStyle: TextStyle(color: CustomColor.whiteSecondary),
                              filled: true,
                              fillColor: CustomColor.bgLight1,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          TextField(
                            style: TextStyle(color: CustomColor.whitePrimary),
                            decoration: InputDecoration(
                              hintText: "Email",
                              hintStyle: TextStyle(color: CustomColor.whiteSecondary),
                              filled: true,
                              fillColor: CustomColor.bgLight1,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          TextField(
                            maxLines: 4,
                            style: TextStyle(color: CustomColor.whitePrimary),
                            decoration: InputDecoration(
                              hintText: "Mensaje",
                              hintStyle: TextStyle(color: CustomColor.whiteSecondary),
                              filled: true,
                              fillColor: CustomColor.bgLight1,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            height: 45,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: CustomColor.yellowPrimary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Enviar mensaje",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 40),

                    Row(
                      children: [
                        Icon(Icons.location_on, color: CustomColor.yellowPrimary),
                        const SizedBox(width: 10),
                        Text(
                          "Colombia",
                          style: TextStyle(color: CustomColor.whitePrimary),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}