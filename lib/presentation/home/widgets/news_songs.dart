import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/common/helpers/is_dark_mode.dart';
import 'package:spotify_clone/core/config/constants/app_urls.dart';
import 'package:spotify_clone/core/config/theme/app_colors.dart';
import 'package:spotify_clone/presentation/home/bloc/news_songs_cubit.dart';
import '../../../domain/entities/song/song.dart';
import '../bloc/news_songs_state.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsSongsCubit()..getNewSongs(),
      child: SizedBox(
        height: 200,
        child: BlocBuilder<NewsSongsCubit, NewsSongsState>(
            builder: (context, state) {
          if (state is NewsSongLoading) {
            return Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            );
          }

          if (state is NewsSongLoaded) {
            return _songs(state.songs);
          }

          if (state is NewsSongLoadFailiure) {
            return Center(
              child: Text(
                state.errorMessage,
                style: TextStyle(color: Colors.red),
              ),
            );
          }

          return Container();
        }),
      ),
    );
  }

  Widget _songs(List<SongEntity> songs) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 156,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(AppUrls.firestorage +
                                songs[index].artist +
                                ' - ' +
                                songs[index].title +
                                '.jpg?' +
                                AppUrls.mediaAlt))),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: 40,
                        width: 40,
                        transform: Matrix4.translationValues(10, 10, 0),
                        child: Icon(
                          Icons.play_arrow_rounded,
                          color: context.IsDarkMode
                              ? Color(0xff959595)
                              : Color(0xff555555),
                        ),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: context.IsDarkMode
                                ? AppColors.darkGrey
                                : Color(0xffE6E6E6)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  songs[index].title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  songs[index].artist,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
              width: 14,
            ),
        itemCount: songs.length);
  }
}
