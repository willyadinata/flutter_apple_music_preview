/*=========================================================================================
 * Created on Sat Feb 12 2022
 * File Name     : simple_bloc_observer.dart
 * Description   : interface to observe behavior of bloc
 * --------------------------------------------------------------------------------------
 * Project Name  : AppleMusicPreview - Flutter
 * Author Name   : Willy Adinata Saragih
 * Author Email  : me@willyadinata.my.id
 * Repo URL      : https://github.com/willyadinata
 * Copyright © 2022 Personal Project
=========================================================================================*/

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

/// Simple interface to observe behavior of [Bloc] instance.
class SimpleBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (kDebugMode) {
      print(transition);
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      print(error);
    }
    super.onError(bloc, error, stackTrace);
  }
}
