import 'package:get/get.dart';
import 'package:mehendi_design_app/src/account/account_screen.dart';
import 'package:mehendi_design_app/src/auth/get_started_screen.dart';
import 'package:mehendi_design_app/src/entry_loading_screen.dart';
import 'package:mehendi_design_app/src/home_category/home_category_controller.dart';
import 'package:mehendi_design_app/src/home_category/views/home_category_detail_screen.dart';
import 'package:mehendi_design_app/src/main_screen.dart';

final List<GetPage<dynamic>> routes = [
  GetPage(
    name: EntryLoadingScreen.routeName,
    page: () => const EntryLoadingScreen(),
  ),
  GetPage(
    name: GetStartedScreen.routeName,
    page: () => const GetStartedScreen(),
  ),
  GetPage(
    name: MainScreen.routeName,
    page: () => const MainScreen(),
    binding: BindingsBuilder(() {
      Get.put(HomeCategoryController());
    }),
  ),
  GetPage(
    name: AccountScreen.routeName,
    page: () => AccountScreen(),
  ),
  GetPage(
    name: HomeCategoryDetailScreen.routeName,
    page: () => HomeCategoryDetailScreen(),
  ),
];
