import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_first_app/common/widgets/max_seats.dart';
import 'package:my_first_app/cubit/movie/injectable.dart';

import 'package:my_first_app/cubit/movie/movie_locator.dart';
import 'package:my_first_app/pages/loggedin.dart';
import 'package:my_first_app/pages/login.dart';
import 'package:my_first_app/pages/movie_page.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 
  await dotenv.load(fileName: '.env');
  await configureInjections();

  final dsn = dotenv.maybeGet('SENTRY_TOKEN');
  await SentryFlutter.init(
    (options) {
      options.dsn = dsn;
      options.sendDefaultPii = dotenv.getBool(
        'SENTRY_DEFAULT_PII',
        fallback: false,
      );
    },
    appRunner: () {
      runApp(SentryWidget(child: const MyApp()));
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: LoginForm(),
      title: 'Login PAge Demo',
      routes: {
        '/logged-in': (context) => LoggedInPage(),
        '/movie-page': (context) => MoviePage(),
        '/max-seats-page': (context) => MaxSeats(),
      },
    );
  }
}
