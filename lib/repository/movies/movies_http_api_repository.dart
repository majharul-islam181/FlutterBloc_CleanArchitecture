import 'package:flutterbloc_cleanarchitecture/config/app_url.dart';
import 'package:flutterbloc_cleanarchitecture/data/network/network_services_api.dart';
import 'package:flutterbloc_cleanarchitecture/models/movies/movies.dart';
import 'package:flutterbloc_cleanarchitecture/repository/movies/movies_repository.dart';

class MoviesHttpApiRepository implements MoviesRepository {
  final _apiServices = NetworkServicesApi();

  Future<MoviesModel> fetchMoviesList() async {
    final response =
        await _apiServices.getApi(AppUrl.popularMoviesListEndPoint);

    return MoviesModel.fromJson(response);
  }
}
