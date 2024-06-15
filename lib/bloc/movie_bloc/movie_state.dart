// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'movie_bloc.dart';

class MovieState extends Equatable {
  final ApiResponse<MoviesModel> moviesList;
  const MovieState({required this.moviesList});

  

  MovieState copyWith({
    ApiResponse<MoviesModel>? moviesList,
  }) {
    return MovieState(
      moviesList: moviesList ?? this.moviesList,
    );
  }
  
  @override
  List<Object?> get props => [moviesList];
}
