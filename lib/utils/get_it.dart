import 'package:dio/dio.dart';
import 'package:flutter_application_1/cubit/staff/staff_cubit.dart';
import 'package:flutter_application_1/domain/repositories/bird_repo.dart';
import 'package:flutter_application_1/domain/repositories/user_repo.dart';
import 'package:flutter_application_1/utils/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initialGetIt() async {
  getIt.registerLazySingleton<Dio>(() => apiClient);

  getIt.registerLazySingleton(() => UserRepo());
  getIt.registerLazySingleton(() => BirdRepo());

  getIt.registerLazySingleton(() => StaffCubit());
}