// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/events_page/bindings/events_page_binding.dart';
import '../modules/events_page/views/events_page_view.dart';
import '../modules/home_page/bindings/home_page_binding.dart';
import '../modules/home_page/views/home_page_view.dart';
import '../modules/landing_page/bindings/landing_binding.dart';
import '../modules/landing_page/views/landing_view.dart';
import '../modules/organization_page/bindings/organization_page_binding.dart';
import '../modules/organization_page/views/organization_page_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ORGANIZATION_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.LANDING,
      page: () => const LandingView(),
      binding: LandingBinding(),
    ),
    GetPage(
      name: _Paths.HOME_PAGE,
      page: () => const HomePageView(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: _Paths.EVENTS_PAGE,
      page: () => const EventsPageView(),
      binding: EventsPageBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.ORGANIZATION_PAGE,
      page: () => const OrganizationPageView(),
      binding: OrganizationPageBinding(),
    ),
  ];
}
