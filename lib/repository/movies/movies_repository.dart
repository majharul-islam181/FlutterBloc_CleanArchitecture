import 'package:flutterbloc_cleanarchitecture/models/movies/movies.dart';

abstract class MoviesRepository {
  Future<MoviesModel> fetchMoviesList();
  
}
