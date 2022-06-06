import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_sinaxys/app/modules/main_module/submodules/home_module/components/sinaxys_list_tile.dart';

import '../../../../core/data/service/config/base_response.dart';
import '../../../../core/model/job_model.dart';
import '../../../../core/utils/constants/app_routes.dart';
import '../../../../core/utils/constants/app_strings.dart';
import '../../../../core/utils/style/colors/general_colors.dart';
import '../../../../core/utils/style/themes/text_styles.dart';
import 'components/sinaxys_shimmer_list_tile.dart';
import 'home_bloc.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = kAppName}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeBloc>();
  late ScrollController _scrollController;
  static const kExpandedHeight = 120.0;

  @override
  void initState() {
    super.initState();
    dev.log(Modular.to.path + kRouteHome, name: kPath);
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {});
      });
    controller.getAllJobs();
  }

  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > kExpandedHeight - kToolbarHeight;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColorPrimaryLight,
        toolbarHeight: 2,
        elevation: 0,
      ),
      backgroundColor: kColorPrimaryLight,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: kColorPrimaryLight,
            // show and hide SliverAppBar Title
            title: _isSliverAppBarExpanded
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        kVacanciesInBrazil,
                        style:
                            TextStyles.headline2(color: kColorBackgroundLight),
                      ),
                      Container(
                        height: 40,
                        width: 50,
                        decoration: BoxDecoration(
                          color: kColorButtonPrimary,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/icons/filters.svg',
                            height: 30,
                          ),
                        ),
                      ),
                    ],
                  )
                : null,
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: kExpandedHeight,
            // show and hide FlexibleSpaceBar title
            flexibleSpace: _isSliverAppBarExpanded
                ? null
                : FlexibleSpaceBar(
                    collapseMode: CollapseMode.pin,
                    centerTitle: true,
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: SizedBox(
                        width: size.width,
                        height: 120,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: SizedBox(
                                height: 40,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      kVacancies,
                                      style: TextStyles.headline1(
                                          color: kColorBackgroundLight),
                                    ),
                                    SizedBox(
                                      height: 12,
                                      width: size.width * 0.3,
                                      child: FittedBox(
                                        alignment: Alignment.centerLeft,
                                        fit: BoxFit.contain,
                                        child: Text(
                                          kInBrazil,
                                          style: TextStyles.subtitle1(
                                              color: kColorBackgroundLight),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 4.0),
                                child: Container(
                                  width: 75,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: kColorButtonPrimary,
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/filters.svg',
                                          height: 15,
                                        ),
                                        SizedBox(
                                          height: 16,
                                          child: FittedBox(
                                            alignment: Alignment.centerLeft,
                                            fit: BoxFit.contain,
                                            child: Text(
                                              kFilter,
                                              style: TextStyles.headline2(
                                                  color: kColorBackgroundLight),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: kColorPrimaryLight,
              height: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: 20,
                    decoration: const BoxDecoration(
                      color: kColorBackgroundLight,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          StreamBuilder<BaseResponse<List<Jobs>>>(
            stream: controller.jobsController.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                switch (snapshot.data?.status) {
                  case Status.LOADING:
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (_, int index) {
                          return const SinaxysShimmerListTile();
                        },
                        childCount: 15,
                      ),
                    );
                  case Status.ERROR:
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (_, int index) {
                          return const SinaxysShimmerListTile();
                        },
                        childCount: 15,
                      ),
                    );
                  default:
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (_, int index) {
                          return SinaxysListTile(
                              image: snapshot.data!.data![index].clinic!.image!,
                              title: snapshot.data!.data![index].title!,
                              subtitle: snapshot
                                      .data!.data![index].clinic!.clinicType! +
                                  ' • ' +
                                  snapshot.data!.data![index].clinic!.city! +
                                  ' - ' +
                                  snapshot.data!.data![index].clinic!.state!,
                              price: snapshot.data!.data![index].value! +
                                  '/' +
                                  snapshot.data!.data![index].valuePeriod!);
                        },
                        childCount: snapshot.data!.data!.length,
                      ),
                    );
                }
              } else {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (_, int index) {
                      return const SinaxysShimmerListTile();
                    },
                    childCount: 15,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
