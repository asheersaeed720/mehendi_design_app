import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mehendi_design_app/src/auth/auth_controller.dart';
import 'package:mehendi_design_app/utils/constants.dart';
import 'package:mehendi_design_app/utils/custom_dialog.dart';

class AccountScreen extends StatelessWidget {
  static const String routeName = '/account';

  AccountScreen({Key? key}) : super(key: key);

  final _authCtrl = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            _buildLessProfileInfoView(context),
            const SizedBox(height: 12.0),
            _buildRateUsView(),
            const SizedBox(height: 12.0),
            _buildNotificationView(),
            const SizedBox(height: 12.0),
            _buildPrivacyView(),
            const SizedBox(height: 12.0),
            _buildTermsView(),
            const SizedBox(height: 12.0),
            _buildShareView(),
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(bottom: 36.0),
              width: MediaQuery.of(context).size.width * 0.9,
              height: 42.0,
              child: ElevatedButton(
                onPressed: () {
                  showAlertDialog(
                    context,
                    'Logout',
                    'Are you sure, you want to logout?',
                    () async {
                      await _authCtrl.logOutUser();
                    },
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      side: const BorderSide(width: 1.0, color: kPrimaryColor),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Logout',
                      style: kBodyStyle1.copyWith(color: kPrimaryColor),
                    ),
                    const SizedBox(width: 8.0),
                    const Icon(Icons.exit_to_app, color: kPrimaryColor)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLessProfileInfoView(BuildContext context) {
    // User? _authUser = FirebaseAuth.instance.currentUser;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            kPrimaryColor.withOpacity(0.9),
            kPrimaryColor,
          ],
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: const Icon(
            Icons.person,
          ),
        ),
        title: Text(
          'Name',
          style: kBodyStyle1.copyWith(color: Colors.white),
        ),
        subtitle: Text(
          'Email',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildShareView() {
    return ListTile(
      onTap: () {},
      leading: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: Colors.green.shade100,
        ),
        child: const Icon(Icons.share, color: Colors.green),
      ),
      title: Text(
        'Share with friends',
        style: kBodyStyle1,
      ),
    );
  }

  Widget _buildRateUsView() {
    return ListTile(
      onTap: () {},
      leading: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: Colors.cyan.shade100,
        ),
        child: const Icon(Icons.rate_review, color: Colors.cyan),
      ),
      title: Text(
        'Rate Us',
        style: kBodyStyle1,
      ),
    );
  }

  Widget _buildNotificationView() {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: Colors.blue.shade100,
        ),
        child: const Icon(Icons.notifications, color: Colors.blue),
      ),
      title: Text(
        'Notification',
        style: kBodyStyle1,
      ),
      trailing: Switch(
        value: true,
        onChanged: (value) {},
        activeTrackColor: kAccentColor.withOpacity(0.6),
        activeColor: kPrimaryColor.withOpacity(0.8),
      ),
    );
  }

  Widget _buildPrivacyView() {
    return ListTile(
      // onTap: () => Get.toNamed(WebViewScreen.routeName, arguments: {
      //   'title': 'Privacy Policy',
      //   'url': 'https://achadvertising.com/privacy-policy/',
      // }),
      onTap: () async {
        // await launch('https://achadvertising.com/privacy-policy/');
      },
      leading: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: Colors.orange.shade100,
        ),
        child: const Icon(Icons.privacy_tip, color: Colors.orange),
      ),
      title: Text(
        'Privacy Policy',
        style: kBodyStyle1,
      ),
    );
  }

  Widget _buildTermsView() {
    return ListTile(
      // onTap: () => Get.toNamed(WebViewScreen.routeName, arguments: {
      //   'title': 'Terms & Conditions',
      //   'url': 'https://achadvertising.com/terms-and-conditions/',
      // }),
      onTap: () async {
        // await launch('https://achadvertising.com/terms-and-conditions/');
      },
      leading: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: Colors.purple.shade100,
        ),
        child: const Icon(Icons.note, color: Colors.purple),
      ),
      title: Text(
        'Terms & Conditions',
        style: kBodyStyle1,
      ),
    );
  }
}
