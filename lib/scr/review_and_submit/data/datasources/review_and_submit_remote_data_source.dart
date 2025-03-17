import '../../../../../../core/util/network_service.dart';

abstract class ReviewAndSubmitRemoteDataSource {}

class ReviewAndSubmitRemoteDataSourceImpl
    implements ReviewAndSubmitRemoteDataSource {
  final NetworkService networkService;

  ReviewAndSubmitRemoteDataSourceImpl(this.networkService);
}
