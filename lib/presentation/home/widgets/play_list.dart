import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/common/helpers/is_dark_mode.dart';
import 'package:spotify_clone/core/config/theme/app_colors.dart';
import 'package:spotify_clone/presentation/home/bloc/play_list_cubit.dart';
import 'package:spotify_clone/presentation/home/bloc/play_list_state.dart';
import '../../../domain/entities/song/song.dart';

class PlayList extends StatelessWidget {
  const PlayList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => PlayListCubit()..getPLayList(),
        child: BlocBuilder<PlayListCubit, PlayListState>(
          builder: (context, state) {
            if (state is PLayListLoading) {
              return Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              );
            }
            if (state is PLayListLoaded) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'PlayList',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          'See More',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Color(0xffC6C6C6),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _songs(state.songs),
                  ],
                ),
              );
            }

            return Container();
          },
        ));
  }

  Widget _songs(List<SongEntity> songs) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.IsDarkMode
                          ? AppColors.darkGrey
                          : const Color(0xffE6E6E6),
                    ),
                    child: Icon(
                      Icons.play_arrow_rounded,
                      color: context.IsDarkMode
                          ? const Color(0xff959595)
                          : const Color(0xff555555),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        songs[index].title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        songs[index].artist,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    songs[index].duration.toString().replaceAll('.', ':'),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite),
                    color: AppColors.darkGrey,
                  ),
                ],
              )
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
        itemCount: songs.length);
  }
}
