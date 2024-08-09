import '../../../domain/entities/song/song.dart';

abstract class NewsSongsState {}

class NewsSongLoading extends NewsSongsState {}

class NewsSongLoaded extends NewsSongsState {
  final List<SongEntity> songs;
  NewsSongLoaded({required this.songs});
}

class NewsSongLoadFailiure extends NewsSongsState {}
