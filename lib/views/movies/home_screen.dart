import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc_cleanarchitecture/bloc/movie_bloc/movie_bloc.dart';
import 'package:flutterbloc_cleanarchitecture/config/components/loading_widget.dart';
import 'package:flutterbloc_cleanarchitecture/config/routes/routes_name.dart';
import 'package:flutterbloc_cleanarchitecture/main.dart';
import 'package:flutterbloc_cleanarchitecture/services/storage/local_storage.dart';
import 'package:flutterbloc_cleanarchitecture/utils/enums.dart';

import '../../config/components/internet_exception_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MovieBloc movieBloc;

  @override
  void initState() {
    super.initState();
    movieBloc = MovieBloc(moviesRepository: getIt());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    movieBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          IconButton(
              onPressed: () {
                LocalStorage localStorage = LocalStorage();
                localStorage.clearValue('token').then((value) {
                  localStorage.clearValue('isLogin').then((value) {
                    Navigator.pushNamed(context, RoutesName.loginScreen);
                  });
                });
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: BlocProvider(
        create: (_) => movieBloc
          ..add(
            MoviesFetched(),
          ),
        child: BlocBuilder<MovieBloc, MovieState>(
          buildWhen: (previous, current) =>
              current.moviesList != previous.moviesList,
          builder: (context, state) {
            switch (state.moviesList.status) {
              case Status.loading:
                return const Center(
                  child: LoadingWidget(),
                );
              case Status.error:
                if (state.moviesList.message == 'No Internet Connection') {
                  return InterNetExceptionWidget(onPress: () {
                    movieBloc.add(MoviesFetched());
                  });
                }

                return Center(child: Text(state.moviesList.message.toString()),);
              case Status.completed:
                if (state.moviesList.data == null) {
                  return const Text('No data found');
                }
                final movieList = state.moviesList.data!;
                return ListView.builder(
                    itemCount: movieList.tvshow.length,
                    itemBuilder: (context, index) {
                      final tvShow = movieList.tvshow[index];
                      return Card(
                        child: ListTile(
                          // leading: Image(
                          //     image: NetworkImage(
                          //   tvShow.imageThumbnailPath.toString(),
                          // )),
                          title: Text(tvShow.name.toString()),
                          subtitle: Text(tvShow.network.toString()),
                          trailing: Text(tvShow.status.toString()),
                        ),
                      );
                    });

              default:
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
