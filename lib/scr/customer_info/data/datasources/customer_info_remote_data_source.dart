import '../../../../../../core/util/network_service.dart';

abstract class CustomerInfoRemoteDataSource {}

class CustomerInfoRemoteDataSourceImpl
    implements CustomerInfoRemoteDataSource {
  final NetworkService networkService;

  CustomerInfoRemoteDataSourceImpl(this.networkService);
}
