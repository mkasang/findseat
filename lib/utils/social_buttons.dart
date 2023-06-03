import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart%20';
import 'package:genielogiciel/utils/theme.dart';

class SocialLoginButtons extends StatelessWidget {
  final Function() onGoogleClick;
  final Function() onFbClick;
  const SocialLoginButtons(
      {super.key, required this.onGoogleClick, required this.onFbClick});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Material(
            color: MyTheme.redLight,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: const BorderSide(color: MyTheme.redBorder, width: 0.2)),
            child: InkWell(
              onTap: onGoogleClick,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 10.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/google.svg",
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    const Text(
                      "Google",
                      style: TextStyle(
                          color: Color(0xFF666666),
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: Material(
            color: MyTheme.blueLight,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: const BorderSide(color: MyTheme.blueBorder, width: 0.2)),
            child: InkWell(
              onTap: onFbClick,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 5.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/facebook.svg",
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    const Text(
                      "Facebook",
                      style: TextStyle(
                          color: Color(0xFF666666),
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
