import 'package:flutter/material.dart'; 

class Palette { 
  static const MaterialColor kToDark = const MaterialColor( 
    0xff4169e1, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch. 
    const <int, Color>{ 
      50: const Color(0xff3b5fcb),//10% 
      100: const Color(0xff3454b4),//20% 
      200: const Color(0xff2e4a9e),//30% 
      300: const Color(0xff213571),//40% 
      400: const Color(0xff213571),//50% 
      500: const Color(0xff1a2a5a),//60% 
      600: const Color(0xff131f43),//70% 
      700: const Color(0xff0d152d),//80% 
      800: const Color(0xff060a16),//90% 
      900: const Color(0xff000000),//100% 
    }, 
  ); 
}