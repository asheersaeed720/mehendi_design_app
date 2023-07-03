import 'package:mehendi_design_app/utils/constants.dart';
import 'package:mehendi_design_app/widgets/custom_input_validators.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    required this.hintText,
    required this.controller,
    required this.keyboardType,
    this.prefixIcon,
    this.obscureText = false,
    this.isAutoFocus = false,
    this.suffixIcon,
    Key? key,
  }) : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Icon? prefixIcon;
  final bool obscureText;
  final bool isAutoFocus;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return keyboardType == TextInputType.phone
        ? IntlPhoneField(
            keyboardType: TextInputType.phone,
            initialCountryCode: 'EC',
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(kBorderRadius),
                borderSide: BorderSide.none,
              ),
              prefixIcon: prefixIcon,
              filled: true,
            ),
          )
        : TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            autofocus: isAutoFocus,
            maxLines: keyboardType == TextInputType.streetAddress ? 3 : 1,
            validator: (value) {
              if (keyboardType == TextInputType.emailAddress) {
                return CustomInputValidators.validateEmail(value ?? '');
              } else if (keyboardType == TextInputType.visiblePassword) {
                return CustomInputValidators().validatePassword(value ?? '');
              } else if (keyboardType == TextInputType.number && hintText == 'Referral code') {
                return null;
              } else {
                return CustomInputValidators.validateString(value ?? '');
              }
            },
            decoration: InputDecoration(
              //   hintText: hintText,
              //   contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              //   border: OutlineInputBorder(
              //     borderRadius: BorderRadius.circular(kBorderRadius),
              //     borderSide: BorderSide.none,
              //   ),
              //   prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              //   filled: true,
            ),
          );
  }
}
