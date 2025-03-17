import '../../../../../../core/util/network/network_info.dart';
import '../../domain/repository/customer_info_repository.dart';
import '../datasources/customer_info_remote_data_source.dart';

class CustomerInfoRepositoryImp implements CustomerInfoRepository {
  final CustomerInfoRemoteDataSource dataSource;
  final NetworkInfo networkInfo;

  CustomerInfoRepositoryImp({
    required this.dataSource,
    required this.networkInfo,
  });
}
