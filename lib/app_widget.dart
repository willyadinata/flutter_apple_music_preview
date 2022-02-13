/*=========================================================================================
 * Created on Sat Feb 12 2022
 * File Name     : app_widget.dart
 * Description   : required for material design applications
 * --------------------------------------------------------------------------------------
 * Project Name  : AppleMusicPreview - Flutter
 * Author Name   : Willy Adinata Saragih
 * Author Email  : me@willyadinata.my.id
 * Repo URL      : https://github.com/willyadinata
 * Copyright © 2022 Personal Project
=========================================================================================*/

import 'package:applemusic/app_splash.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apple Music Preview',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: kDebugMode,
      home: const AppSplash(),
    );
  }
}
