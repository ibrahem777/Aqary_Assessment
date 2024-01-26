import 'package:aqary_assesment/pages/bloc_page.dart';
import 'package:aqary_assesment/pages/bouncing_list.dart';
import 'package:aqary_assesment/pages/custom_paint.dart';
import 'package:aqary_assesment/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../enums.dart';

import '../notifiers/page_notifier.dart';
import '../pages/builder_pattern.dart';
import 'route.dart';

class AppRouterDelegate extends RouterDelegate<AppRoute>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoute> {
  final PageNotifier notifier;

  AppRouterDelegate({required this.notifier});

  @override
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: navigatorKey,
        pages: [
          if (notifier.isUnknown)  MaterialPage(child: Container(child: Text('${notifier.isUnknown}'),)),
          if (!notifier.isUnknown)  MaterialPage(child: Container(child: Text('${notifier.isUnknown} ${notifier.pageName}'),)),
          if (notifier.pageName == PageName.home)
             MaterialPage(child: HomePage()),
          if (notifier.pageName == PageName.builder)
             MaterialPage(child: BuilderPattern()),
          if (notifier.pageName == PageName.bloc)
             MaterialPage(child: BlocPage()),
          if (notifier.pageName == PageName.custompaint)
             MaterialPage(child: CustomPaintPage()),
          if (notifier.pageName == PageName.bouncinglist)
            MaterialPage(child: BouncingListPage()),
          if (notifier.pageName == PageName.api)
            MaterialPage(child: Container()),
        ],

        onPopPage: (route, result) {
          Provider.of<PageNotifier>(context,listen: false).changePage(page: PageName.home, unknown: false);

          print(route.settings.name);
          return route.didPop(result);
        });
  }

//currentConfiguration is called whenever there might be a change in route
//It checks for the current page or route and return a new route information
//This is what populates our browser history
  @override
  AppRoute? get currentConfiguration {
    if (notifier.isUnknown) {
      return AppRoute.unknown();
    }

    if (notifier.pageName == PageName.home) {
      return AppRoute.home();
    }

    if (notifier.pageName == PageName.builder) {
      return AppRoute.builder();
    }

    if (notifier.pageName == PageName.bloc) {
      return AppRoute.bloc();
    }

    if (notifier.pageName == PageName.custompaint) {
      return AppRoute.custompaint();
    }

    if (notifier.pageName == PageName.bouncinglist) {
      return AppRoute.bouncinglist();
    }

    if (notifier.pageName == PageName.api) {
      return AppRoute.api();
    }

    return AppRoute.unknown();
  }

//This is called whenever the system detects a new route is passed
//It checks the current route through the configuration and uses that to update the notifier
  @override
  Future<void> setNewRoutePath(AppRoute configuration) async {
    if (configuration.isUnknown) {
      _updateRoute(page: null, isUnknown: true);
    }

    if (configuration.isBuilder) {
      _updateRoute(page: PageName.builder);
    }

    if (configuration.isBloc) {
      _updateRoute(page: PageName.bloc);
    }

    if (configuration.isCustomPaint) {
      _updateRoute(page: PageName.custompaint);
    }

    if (configuration.isHome) {
      _updateRoute(page: PageName.home);
    }
    if (configuration.isBouncingList) {
      _updateRoute(page: PageName.bouncinglist);
    }
    if (configuration.isApi) {
      _updateRoute(page: PageName.api
      );
    }
  }

  _updateRoute({PageName? page, bool isUnknown = false}) {
    notifier.changePage(page: page, unknown: isUnknown);
  }
}