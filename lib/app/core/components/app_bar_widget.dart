import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/style/colors/general_colors.dart';

class SinaxysAppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const SinaxysAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 120,
      width: size.width,
      color: kColorPrimaryLight,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 32,
                    child: CircleAvatar(
                      child: Image.asset(
                        'assets/core/sinaxys_placeholder_profile.png',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 25),
                    child: SizedBox(
                      width: 15,
                      child: CircleAvatar(
                        backgroundColor: kColorBackgroundLight,
                        child: SvgPicture.asset(
                          'assets/icons/drawer.svg',
                          color: kColorSecondaryLight,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SvgPicture.asset(
                'assets/logo/sinaxys_logo.svg',
                color: kColorIcon,
                semanticsLabel: 'Sinaxys Logo',
              ),
              SvgPicture.asset(
                'assets/icons/notification_bell.svg',
                color: kColorIcon,
                width: 25,
                semanticsLabel: 'Notificação',
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(90);
}
