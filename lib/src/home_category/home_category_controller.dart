import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mehendi_design_app/src/home_category/home_category.dart';
import 'package:mehendi_design_app/utils/constants.dart';
import 'package:mehendi_design_app/utils/firebase_collections.dart';

class HomeCategoryController extends GetxController {
  late bool isGridView;

  final categoryRef = categoryCollection.withConverter<HomeCategory>(
    fromFirestore: (snapshot, _) => HomeCategory.fromJson(snapshot.data()!),
    toFirestore: (category, _) => category.toJson(),
  );

  @override
  void onInit() async {
    isGridView = getView();
    super.onInit();
  }

  Stream<QuerySnapshot<HomeCategory>> getCategories() {
    return categoryRef.snapshots();
  }

  Future<void> switchView() async {
    await sharedPreferences.setBool('view', !isGridView);
    isGridView = getView();
    update();
  }

  bool getView() {
    return sharedPreferences.getBool('view') ?? false;
  }
}
