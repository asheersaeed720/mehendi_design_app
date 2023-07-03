import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mehendi_design_app/src/auth/auth_controller.dart';
import 'package:mehendi_design_app/src/main_screen.dart';
import 'package:mehendi_design_app/utils/constants.dart';
import 'package:mehendi_design_app/widgets/custom_async_btn.dart';

final List<String> imgList = [
  'https://st1.latestly.com/wp-content/uploads/2023/04/Mehndi-Designs.jpg',
  'https://cdn0.weddingwire.in/article/3080/3_2/960/jpg/70803-mehndi-design-video-mehandi-creation-by-manu-bishnoi-lead.jpeg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQA_amNEMQp3zjgAghqfcqFi3bHxbbKqvvDpPRiLurXllBddn5LyuiZpHJmYMajGMWpOU4&usqp=CAU',
];

class GetStartedScreen extends StatefulWidget {
  static const String routeName = '/get-started';

  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  final _authCtrl = Get.find<AuthController>();

  int _current = 0;
  final CarouselController _controller = CarouselController();

  final List<Widget> imageSliders = imgList
      .map(
        (item) => Container(
          margin: const EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                Image.network(item, fit: BoxFit.cover, width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoaderOverlay(
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40.0, left: 12.0),
                  child: Image.asset('assets/icons/logo.png', width: 130.0),
                ),
                Image.asset('assets/images/shape.png', width: 130.0),
              ],
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              child: Text(
                'Welcome to our Mehendi Designs App!',
                style: kTitleStyle,
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              child: Text(
                'Unleash your creativity and immerse yourself in the art of henna.',
                style: kBodyStyle1,
              ),
            ),
            const SizedBox(height: 16.0),
            CarouselSlider(
              items: imageSliders,
              carouselController: _controller,
              options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.asMap().entries.map(
                (entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 10.0,
                      height: 10.0,
                      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.grey.shade800)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4),
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
            const Divider(indent: 12.0, endIndent: 12.0),
            const SizedBox(height: 12.0),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12.0),
              child: CustomAsyncBtn(
                btnTxt: 'Get Started',
                onPress: () {
                  Get.offNamed(MainScreen.routeName);
                },
              ),
            ),
            const SizedBox(height: 18.0),
            InkWell(
              onTap: () async {
                context.loaderOverlay.show();
                await _authCtrl.handleGoogleLogIn().catchError((_) {
                  context.loaderOverlay.hide();
                });
                // ignore: use_build_context_synchronously
                context.loaderOverlay.hide();
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 12.0),
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  border: Border.all(width: 1.0, color: Colors.grey.shade800),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/google.png', width: 25.0),
                    const SizedBox(width: 10.0),
                    Text('Continue with Google', style: kBodyStyle1)
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
