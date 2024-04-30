import 'package:block_test/features/posts/presentation/bloc/aduposts/adu_posts_bloc.dart';
import 'package:block_test/features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:block_test/features/posts/presentation/pages/posts_page.dart';
import 'package:block_test/core/appObserve.dart';
import 'package:flutter/material.dart';
import 'package:block_test/core/services/my_services.dart' as id;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppObserve();
  await id.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => id.sl<PostsBloc>()..add(GetPostsEvent()),
          ),
          BlocProvider(
            create: (_) => id.sl<AduPostsBloc>(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData.light(),
          home: const PostsPage(),
        ));
  }
}
