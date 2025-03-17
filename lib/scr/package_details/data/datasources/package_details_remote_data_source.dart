import '../../../../../../core/util/network_service.dart';

abstract class PackageDetailsRemoteDataSource {}

class PackageDetailsRemoteDataSourceImpl
    implements PackageDetailsRemoteDataSource {
  final NetworkService networkService;

  PackageDetailsRemoteDataSourceImpl(this.networkService);
}
