import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mehendi_design_app/src/home_category/home_category_controller.dart';
import 'package:mehendi_design_app/utils/constants.dart';

class HomeCategoryDetailScreen extends StatelessWidget {
  static const String routeName = '/home-category-detail';

  HomeCategoryDetailScreen({super.key});

  final homeCategoryCtrl = Get.find<HomeCategoryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category Name'),
        actions: [
          IconButton(
            onPressed: () {
              homeCategoryCtrl.switchView();
            },
            icon: GetBuilder<HomeCategoryController>(
              builder: (_) {
                return homeCategoryCtrl.isGridView
                    ? const Icon(Icons.post_add_rounded)
                    : const Icon(Icons.grid_view);
              },
            ),
          ),
        ],
      ),
      body: GetBuilder<HomeCategoryController>(
        builder: (_) {
          return homeCategoryCtrl.isGridView
              ? GridView.builder(
                  padding: const EdgeInsets.all(10.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildGridView();
                  },
                )
              : ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, i) {
                    return _buildPostView(context);
                  },
                );
        },
      ),
    );
  }

  Widget _buildPostView(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/no_img_available.jpg',
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 24.0),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Row(
            children: [
              Icon(Icons.favorite_outline, color: Colors.red.shade800),
              const SizedBox(width: 8.0),
              Text('Fav', style: kBodyStyle1),
              const Spacer(),
              const Icon(Icons.share, color: Colors.green),
              const SizedBox(width: 8.0),
              Text('Share', style: kBodyStyle1),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        const Divider(),
      ],
    );
  }

  Widget _buildGridView() {
    return Stack(
      children: [
        InkWell(
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
              footer: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Text(
                  'Name',
                  textAlign: TextAlign.center,
                  style: kBodyStyle1.copyWith(color: Colors.white),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(kBorderRadius),
                child: Image.asset(
                  'assets/images/no_img_available.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 16.0,
          right: 16.0,
          child: Icon(Icons.favorite_border_rounded),
        ),
      ],
    );
  }
}
