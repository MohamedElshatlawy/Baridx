import '../../../../../../core/util/network/network_info.dart';
import '../../domain/repository/review_and_submit_repository.dart';
import '../datasources/review_and_submit_remote_data_source.dart';

class ReviewAndSubmitRepositoryImp implements ReviewAndSubmitRepository {
  final ReviewAndSubmitRemoteDataSource dataSource;
  final NetworkInfo networkInfo;

  ReviewAndSubmitRepositoryImp({
    required this.dataSource,
    required this.networkInfo,
  });
}
