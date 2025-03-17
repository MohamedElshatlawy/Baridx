import '../../../../../../core/util/network/network_info.dart';
import '../../domain/repository/package_details_repository.dart';
import '../datasources/package_details_remote_data_source.dart';

class PackageDetailsRepositoryImp implements PackageDetailsRepository {
  final PackageDetailsRemoteDataSource dataSource;
  final NetworkInfo networkInfo;

  PackageDetailsRepositoryImp({
    required this.dataSource,
    required this.networkInfo,
  });
}
