/*=========================================================================================
 * Created on Sat Feb 12 2022
 * File Name     : failures.dart
 * Description   : contains some failures 
 * --------------------------------------------------------------------------------------
 * Project Name  : AppleMusicPreview - Flutter
 * Author Name   : Willy Adinata Saragih
 * Author Email  : me@willyadinata.my.id
 * Repo URL      : https://github.com/willyadinata
 * Copyright © 2022 Personal Project
=========================================================================================*/

import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String errorMessage;

  const Failure({
    this.errorMessage = '',
  });

  @override
  List<Object> get props => [errorMessage];
}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}
