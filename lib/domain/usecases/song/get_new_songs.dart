import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify_clone/domain/repository/song/song.dart';
import '../../../core/error/failure.dart';
import '../../../service_locator.dart';
import '../../entities/song/song.dart';

class GetNewSongsUseCase
    implements UseCase<Either<Failure, List<SongEntity>>, dynamic> {
  @override
  Future<Either<Failure, List<SongEntity>>> call({params}) async {
    try {
      // Fetch new songs from the repository
      final result = await sl<SongRepository>().getNewSongs();

      return result.fold(
        (failure) =>
            Left(Failure('An error occurred while fetching new songs.')),
        (songs) => Right(songs),
      );
    } catch (e) {
      print('Error in GetNewSongsUseCase: $e');
      return Left(Failure('An unexpected error occurred.'));
    }
  }
}
