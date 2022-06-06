// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../../core/utils/style/colors/general_colors.dart';
import '../../../../../core/utils/style/themes/text_styles.dart';

class SinaxysListTile extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String price;
  const SinaxysListTile({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: kColorBackgroundLight,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 16.0,
            ),
            child: ListTile(
              tileColor: kColorBackgroundLight,
              leading: SizedBox(
                width: 75,
                height: 65,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    color: kColorDividerDropShadow,
                    child: CachedNetworkImage(
                      imageUrl: image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              title: SizedBox(
                  width: size.width * 0.6,
                  height: 18,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      title,
                      style: TextStyles.headline2(
                        color: const Color(0xFF26282C),
                      ),
                    ),
                  )),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.6,
                    height: 16,
                    child: FittedBox(
                      alignment: Alignment.centerLeft,
                      fit: BoxFit.contain,
                      child: Text(
                        subtitle,
                        style: TextStyles.subtitle1(
                          color: const Color(0xFF646682),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: SizedBox(
                      width: size.width * 0.6,
                      height: 16,
                      child: FittedBox(
                        alignment: Alignment.centerLeft,
                        fit: BoxFit.contain,
                        child: Text(
                          price,
                          style: TextStyles.headline2(
                            color: const Color(0xFF26282C),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: kColorDivider,
          ),
        ],
      ),
    );
  }
}
