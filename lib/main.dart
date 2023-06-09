import 'package:RGS/src/pages/character_edit_page.dart';
import 'package:RGS/src/stores/UserPreferences.dart';
import 'package:RGS/src/views/Home_page.dart';
import 'package:RGS/src/views/character_creation_page.dart';
import 'package:RGS/src/views/character_edit_page.dart';
import 'package:RGS/src/views/character_list_page.dart';
import 'package:RGS/src/views/character_sheet_page.dart';
import 'package:RGS/src/views/dice_page.dart';
import 'package:RGS/src/views/gallery_page.dart';
import 'package:RGS/src/views/login_page.dart';
import 'package:RGS/src/views/newPhoto.dart';
import 'package:RGS/src/views/profile_user_log.dart';
import 'package:RGS/src/views/register_page.dart';
import 'package:RGS/src/views/splash_view.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.initPreferences(); // Inicializar las preferencias del usuario
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'RGS - Role Game System',
      initialRoute: '/splash',
      routes: {
        '/':(context)=> HomePage(),
        '/splash':(context)=> SplashView(),
        '/login':(context)=> LoginPage(),
        '/register': (context) => RegisterPage(),
        '/gallery': (context) => GalleryPage(),
        '/newPhoto': (context) => NewPhoto(),
        '/dice': (context) => DicePage(),
        '/characters_list': (context) => CharacterListPage(),
        '/character_sheet': (context) => CharacterSheetPage(),
        '/character_edit': (context) => CharacterEditPage(),
        '/character_creation': (context) => CharacterCreationPage(),
        '/profile_UserLog': (context) => ProfileUserLog(),
      },
    );
  }
}
