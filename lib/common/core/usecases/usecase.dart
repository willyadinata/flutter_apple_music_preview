/*=========================================================================================
 * Created on Sat Feb 12 2022
 * File Name     : usecase.dart
 * Description   : -
 * --------------------------------------------------------------------------------------
 * Project Name  : AppleMusicPreview - Flutter
 * Author Name   : Willy Adinata Saragih
 * Author Email  : me@willyadinata.my.id
 * Repo URL      : https://github.com/willyadinata
 * Copyright © 2022 Personal Project
=========================================================================================*/

import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import '../error/failures.dart';

/// Abstract class for use cases.
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// Used for use cases that do not require parameters.
class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
