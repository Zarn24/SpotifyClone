import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/presentation/home/bloc/news_songs_cubit.dart';

import '../bloc/news_songs_state.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsSongsCubit(),
      child: SizedBox(
        height: 200,
        child: BlocBuilder<NewsSongsCubit, NewsSongsState>(
            builder: (context, state) {
          if (state is NewsSongLoading) {
            return CircularProgressIndicator();
          }

          if (state is NewsSongLoaded) {
            return _songs();
          }
          return Container();
        }),
      ),
    );
  }
  
  Widget _songs(){
    return ListView.separated(
            itemBuilder: itemBuilder,
            separatorBuilder: separatorBuilder,
            itemCount: itemCount),
  }
}
