import '../../../../../../core/util/network_service.dart';

abstract class PaymentRemoteDataSource {}

class PaymentRemoteDataSourceImpl
    implements PaymentRemoteDataSource {
  final NetworkService networkService;

  PaymentRemoteDataSourceImpl(this.networkService);
}
