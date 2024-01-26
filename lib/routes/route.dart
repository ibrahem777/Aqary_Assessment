import '../enums.dart';

class AppRoute {
  final PageName? pageName;
  final bool _isUnknown;

  AppRoute.home()
      : pageName = PageName.home,
        _isUnknown = false;

  AppRoute.bloc()
      : pageName = PageName.bloc,
        _isUnknown = false;

  AppRoute.builder()
      : pageName = PageName.builder,
        _isUnknown = false;

  AppRoute.custompaint()
      : pageName = PageName.custompaint,
        _isUnknown = false;
  AppRoute.bouncinglist()
      : pageName = PageName.bouncinglist,
        _isUnknown = false;

  AppRoute.api()
      : pageName = PageName.api,
        _isUnknown = false;

  AppRoute.unknown()
      : pageName = null,
        _isUnknown = true;

//Used to get the current path
  bool get isHome => pageName == PageName.home;
  bool get isBuilder => pageName == PageName.builder;
  bool get isBloc => pageName == PageName.bloc;
  bool get isCustomPaint => pageName == PageName.custompaint;
  bool get isBouncingList => pageName == PageName.bouncinglist;
  bool get isApi => pageName == PageName.api;
  bool get isUnknown => _isUnknown;
}