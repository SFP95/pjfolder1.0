import 'package:RGS/src/pages/character_edit_page.dart';
import 'package:RGS/src/pages/newPhoto.dart';
import 'package:RGS/src/pages/profile_user_log.dart';
import 'package:RGS/src/stores/UserPreferences.dart';
import 'package:flutter/material.dart';
import 'package:RGS/src/pages/Home_page.dart';
import 'package:RGS/src/pages/character_creation_page.dart';
import 'package:RGS/src/pages/character_list_page.dart';
import 'package:RGS/src/pages/character_sheet_page.dart';
import 'package:RGS/src/pages/dice_page.dart';
import 'package:RGS/src/pages/gallery_page.dart';
import 'package:RGS/src/pages/login_page.dart';
import 'package:RGS/src/pages/register_page.dart';

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
      initialRoute: '/',
      routes: {
        '/':(context)=> HomePage(),
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
