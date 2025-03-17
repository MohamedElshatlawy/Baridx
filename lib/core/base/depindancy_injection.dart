import 'package:barid/core/base/route_generator.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../scr/customer_info/data/datasources/customer_info_remote_data_source.dart';
import '../../scr/customer_info/data/repository/customer_info_reposatory_impl.dart';
import '../../scr/customer_info/domain/repository/customer_info_repository.dart';
import '../../scr/customer_info/domain/usecases/customer_info_usecase.dart';
import '../../scr/customer_info/view/customer_info_view_model.dart';
import '../../scr/package_details/data/datasources/package_details_remote_data_source.dart';
import '../../scr/package_details/data/repository/package_details_reposatory_impl.dart';
import '../../scr/package_details/domain/repository/package_details_repository.dart';
import '../../scr/package_details/domain/usecases/package_details_usecase.dart';
import '../../scr/package_details/view/package_details_view_model.dart';
import '../../scr/payment/data/datasources/payment_remote_data_source.dart';
import '../../scr/payment/data/repository/payment_reposatory_impl.dart';
import '../../scr/payment/domain/repository/payment_repository.dart';
import '../../scr/payment/domain/usecases/payment_usecase.dart';
import '../../scr/payment/view/payment_view_model.dart';
import '../../scr/review_and_submit/data/datasources/review_and_submit_remote_data_source.dart';
import '../../scr/review_and_submit/data/repository/review_and_submit_reposatory_impl.dart';
import '../../scr/review_and_submit/domain/repository/review_and_submit_repository.dart';
import '../../scr/review_and_submit/domain/usecases/review_and_submit_usecase.dart';
import '../../scr/review_and_submit/view/review_and_submit_view_model.dart';
import '../../scr/splash_screen/view/splash_view_model.dart';
import '../common/config.dart';
import '../util/api_interceptor/api_interceptor.dart';
import '../util/localization/cubit/localization_cubit.dart';
import '../util/network/network_info.dart';
import '../util/network_service.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => LocalizationCubit());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton<NetworkService>(() => NetworkServiceImpl());
  sl.registerLazySingleton(
    () =>
        Dio(BaseOptions(headers: Config.headers))
          ..interceptors.add(ApiInterceptor()),
  );

  /// VIEW MODELS
  sl.registerFactory(() => SplashViewModel());
  sl.registerFactory(() => CustomerInfoViewModel(useCase: sl()));
  sl.registerFactory(() => PackageDetailsViewModel(useCase: sl()));
  sl.registerFactory(() => PaymentViewModel(useCase: sl()));
  sl.registerFactory(() => ReviewAndSubmitViewModel(useCase: sl()));

  /// USECASES
  sl.registerLazySingleton(() => ReviewAndSubmitUseCase(sl()));
  sl.registerLazySingleton(() => CustomerInfoUseCase(sl()));
  sl.registerLazySingleton(() => PackageDetailsUseCase(sl()));
  sl.registerLazySingleton(() => PaymentUseCase(sl()));

  /// REPOSITORIES
  sl.registerLazySingleton<CustomerInfoRepository>(
    () => CustomerInfoRepositoryImp(dataSource: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<ReviewAndSubmitRepository>(
    () => ReviewAndSubmitRepositoryImp(dataSource: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<PaymentRepository>(
    () => PaymentRepositoryImp(dataSource: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<PackageDetailsRepository>(
    () => PackageDetailsRepositoryImp(dataSource: sl(), networkInfo: sl()),
  );

  /// DATA SOURCE
  sl.registerLazySingleton<CustomerInfoRemoteDataSource>(
    () => CustomerInfoRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<ReviewAndSubmitRemoteDataSource>(
    () => ReviewAndSubmitRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<PackageDetailsRemoteDataSource>(
    () => PackageDetailsRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<PaymentRemoteDataSource>(
    () => PaymentRemoteDataSourceImpl(sl()),
  );
}
