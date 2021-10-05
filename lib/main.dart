import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:flutter_testapp/graphql/api.dart';
import 'package:flutter_testapp/test_notifier.dart';
import 'package:flutter_testapp/views/login_page.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() {
  runApp(
    StateNotifierProvider(
      create: (_) => TestNotifier(),
      child: GraphQLProvider(
        client: grapqlClient,
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
