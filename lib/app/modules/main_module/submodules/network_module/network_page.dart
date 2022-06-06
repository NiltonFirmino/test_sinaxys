import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_sinaxys/app/core/utils/constants/app_strings.dart';
import 'package:test_sinaxys/app/core/utils/style/colors/general_colors.dart';

class NetworkPage extends StatelessWidget {
  const NetworkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackgroundLight,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            SvgPicture.asset('assets/logo/sinaxys_logo.svg',
            width: MediaQuery.of(context).size.width *0.3,
                            color: kColorPrimaryLight,),
            const Text(kNetWork),
          ],
        ),
      ),
    );
  }
}
