import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mehendi_design_app/src/account/account_screen.dart';
import 'package:mehendi_design_app/src/home_category/home_category.dart';
import 'package:mehendi_design_app/src/home_category/home_category_controller.dart';
import 'package:mehendi_design_app/src/home_category/views/home_category_detail_screen.dart';
import 'package:mehendi_design_app/utils/constants.dart';
import 'package:mehendi_design_app/widgets/cache_img_widget.dart';
import 'package:mehendi_design_app/widgets/loading_widget.dart';

class HomeCategoryScreen extends StatelessWidget {
  static const String routeName = '/home-category';

  HomeCategoryScreen({super.key});

  final _homeCategoryCtrl = Get.find<HomeCategoryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(AccountScreen.routeName);
            },
            icon: const Icon(Icons.account_circle),
          )
        ],
      ),
      body: GetBuilder<HomeCategoryController>(
        builder: (_) => StreamBuilder<QuerySnapshot<HomeCategory>>(
          stream: _homeCategoryCtrl.getCategories(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              List<QueryDocumentSnapshot<HomeCategory>> categoriesList =
                  snapshot.data!.docs as List<QueryDocumentSnapshot<HomeCategory>>;
              return GridView.builder(
                padding: const EdgeInsets.all(10.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: categoriesList.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed(HomeCategoryDetailScreen.routeName);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                        border: Border.all(width: 2.0, color: kPrimaryColor),
                      ),
                      child: GridTile(
                        footer: Container(
                          color: kAccentColor.withOpacity(0.8),
                          padding: const EdgeInsets.only(bottom: 2.0, top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                categoriesList[index].data().title,
                                textAlign: TextAlign.center,
                                style: kBodyStyle1.copyWith(color: Colors.grey.shade100),
                              ),
                              const SizedBox(width: 8.0),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 3.0),
                                child: Icon(Icons.arrow_forward,
                                    color: Colors.grey.shade100, size: 22.0),
                              ),
                            ],
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(kBorderRadius),
                          child: CacheImgWidget(categoriesList[index].data().image),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  "${snapshot.error}",
                ),
              );
            }
            return const LoadingWidget();
          },
        ),
      ),
    );
  }
}
