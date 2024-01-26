import 'package:aqary_assesment/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'notifiers/page_notifier.dart';
import 'routes/approutedelegate.dart';
import 'routes/routeinfoparser.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<PageNotifier>(create: (context) => PageNotifier())
    ], child: const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, });


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: AppRouteInformationParser(),
      routerDelegate:
      AppRouterDelegate(notifier: Provider.of<PageNotifier>(context)),

      title: 'Aqary ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
