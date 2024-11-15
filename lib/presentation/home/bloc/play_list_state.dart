import '../../../domain/entities/song/song.dart';

abstract class PlayListState {}

class PLayListLoading extends PlayListState {}

class PLayListLoaded extends PlayListState {
  final List<SongEntity> songs;
  PLayListLoaded({required this.songs});
}

class PLayListLoadFailiure extends PlayListState {}
