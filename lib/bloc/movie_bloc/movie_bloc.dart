import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc_cleanarchitecture/data/response/api_response.dart';
import 'package:flutterbloc_cleanarchitecture/repository/movies/movies_repository.dart';

import '../../models/movies/movies.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MoviesRepository moviesRepository;
  MovieBloc({required this.moviesRepository})
      : super(MovieState(moviesList: ApiResponse.loading())) {
    on<MoviesFetched>(fetchMoviesListApi);
  }

  Future<void> fetchMoviesListApi(
      MoviesFetched event, Emitter<MovieState> emit) async {
    await moviesRepository.fetchMoviesList().then((value) {
      emit(state.copyWith(moviesList: ApiResponse.completed(value)));
    }).onError((error, stackTrace) {
      emit(state.copyWith(moviesList: ApiResponse.error(error.toString())));
    });
  }
}
