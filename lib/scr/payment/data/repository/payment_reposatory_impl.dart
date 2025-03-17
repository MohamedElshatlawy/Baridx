import '../../../../../../core/util/network/network_info.dart';
import '../../domain/repository/payment_repository.dart';
import '../datasources/payment_remote_data_source.dart';

class PaymentRepositoryImp implements PaymentRepository {
  final PaymentRemoteDataSource dataSource;
  final NetworkInfo networkInfo;

  PaymentRepositoryImp({
    required this.dataSource,
    required this.networkInfo,
  });
}
