import 'package:async_button_builder/async_button_builder.dart';
import 'package:flutter/material.dart';
import 'package:mehendi_design_app/utils/constants.dart';

class CustomAsyncBtn extends StatelessWidget {
  const CustomAsyncBtn({
    Key? key,
    required this.btnTxt,
    this.width = double.infinity,
    this.height = 50.0,
    this.btnColor = kPrimaryColor,
    this.borderRadius = 100.0,
    this.isLoading = false,
    required this.onPress,
  }) : super(key: key);

  final String btnTxt;
  final double width;
  final double height;
  final Color btnColor;
  final double borderRadius;
  final bool isLoading;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return AsyncButtonBuilder(
      onPressed: onPress == null
          ? null
          : () async {
              await onPress!();
            },
      buttonState: isLoading ? const ButtonState.loading() : const ButtonState.idle(),
      showSuccess: false,
      loadingWidget: const SizedBox(
        height: 16.0,
        width: 16.0,
        child: CircularProgressIndicator(color: Colors.white),
      ),
      errorWidget: const Text('Error'),
      builder: (context, child, callback, _) {
        return SizedBox(
          width: width,
          height: height,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(btnColor),
              elevation: MaterialStateProperty.all(0.0),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
            ),
            onPressed: callback,
            child: child,
          ),
        );
      },
      child: Text(
        btnTxt,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16.0,
          color: btnColor == Colors.white ? Colors.black87 : Colors.white,
        ),
      ),
    );
  }
}
