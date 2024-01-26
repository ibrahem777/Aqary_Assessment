import '../enums.dart';
import './route.dart';
import 'package:flutter/material.dart';

class AppRouteInformationParser
    extends RouteInformationParser<AppRoute> {
String? _unknownPath;
@override
  Future<AppRoute> parseRouteInformation(RouteInformation routeInformation) async{
    final uri = Uri.parse(routeInformation.uri.path!);

    if (uri.pathSegments.isEmpty) {
      return AppRoute.home();
    }

    //If path includes more than one segement, go to 404
    if (uri.pathSegments.length > 1) {
      _unknownPath = routeInformation.location;
      return AppRoute.unknown();
    }

    if (uri.pathSegments.length == 1) {
      if (uri.pathSegments.first == PageName.builder.name) {
        return AppRoute.builder();
      }

      if (uri.pathSegments.first == PageName.bloc.name) {
        return AppRoute.bloc();
      }

      if (uri.pathSegments.first == PageName.custompaint.name) {
        return AppRoute.custompaint();
      }
      if (uri.pathSegments.first == PageName.bouncinglist.name) {
        return AppRoute.bouncinglist();
      }
      if (uri.pathSegments.first == PageName.api.name) {
        return AppRoute.api();
      }
    }

    _unknownPath = uri.path;
    return AppRoute.unknown();
  }

  @override
  RouteInformation? restoreRouteInformation(AppRoute configuration) {
// TODO: implement restoreRouteInformation
    if (configuration.isBuilder) {
      return _getRouteInformation(configuration.pageName!.name);
    }

    if (configuration.isUnknown) {
      return RouteInformation(location: _unknownPath);
    }

    if (configuration.isBloc) {
      return _getRouteInformation(configuration.pageName!.name);
    }

    if (configuration.isCustomPaint) {
      return _getRouteInformation(configuration.pageName!.name);
    }

    if (configuration.isBouncingList) {
      return _getRouteInformation(configuration.pageName!.name);
    }
    if (configuration.isApi) {
      return _getRouteInformation(configuration.pageName!.name);
    }

    return  RouteInformation(uri: Uri.parse("/"));
  }
  RouteInformation _getRouteInformation(String page) {
    return RouteInformation(location: "/$page");
  }
}