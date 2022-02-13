/*=========================================================================================
 * Created on Sat Feb 12 2022
 * File Name     : main.dart
 * Description   : it is responsible for executing all library functions, etc
 * --------------------------------------------------------------------------------------
 * Project Name  : AppleMusicPreview - Flutter
 * Author Name   : Willy Adinata Saragih
 * Author Email  : me@willyadinata.my.id
 * Repo URL      : https://github.com/willyadinata
 * Copyright © 2022 Personal Project
=========================================================================================*/

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_widget.dart';
import 'common/core/bloc_observer/simple_bloc_observer.dart';
import 'di/get_it.dart';

void main() {
  unawaited(getItInit());

  BlocOverrides.runZoned(
    () => runApp(const AppWidget()),
    blocObserver: SimpleBlocObserver(),
  );
}
