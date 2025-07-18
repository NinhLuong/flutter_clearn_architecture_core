import 'dart:io';

import 'package:cct_config/cct_config.dart';
import 'package:cct_core/gen/assets.gen.dart';
import 'package:cct_core/src/domain/entities/attachment/attachment_entity.dart';
import 'package:cct_core/src/presentations/cubit/appbar_expandable/expandable_app_bar_cubit.dart';
import 'package:cct_core/src/presentations/widgets/cache_image/thumbnail_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppbarExpandable extends StatelessWidget {
  final String title;
  final AttachmentEntity imageSrc;
  final AppbarExpandableCubit appbarExpandableCubit;
  final Color? backgroundColor;
  final Widget modalBottomSheet;
  final AppbarExpandableParent parentType;

  const AppbarExpandable(
      {super.key,
      required this.title,
      required this.imageSrc,
      required this.appbarExpandableCubit,
      this.backgroundColor,
      required this.modalBottomSheet,
      required this.parentType});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: Platform.isAndroid ? 8 : 0),
            color: backgroundColor,
            child: BlocBuilder(
                bloc: appbarExpandableCubit,
                builder: (context, state) {
                  bool isExpand = state is AppbarExpandableShow;
                  return AnimatedCrossFade(
                    firstChild: _expandAppBarWidget(context, title),
                    secondChild: _narrowAppBarWidget(context, title, imageSrc),
                    crossFadeState: isExpand
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: const Duration(milliseconds: 500),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget _expandAppBarWidget(BuildContext context, String title) {
    return Container(
      color: backgroundColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            onTap: () async {
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.only(
                left: 8,
                right: 16,
                bottom: 16,
              ),
              child: Row(
                children: <Widget>[
                  Image.asset(
                    Assets.icon.appbarIcon.backIcon.path,
                    width: 20,
                    height: 20,
                    package: "cct_core",
                  ),
                ],
              ),
            ),
          ),
          parentType == AppbarExpandableParent.communicate
              ? SizedBox(
                  width: MediaQuery.of(context).size.width - 120,
                  child: Text(
                    AppLocalizations.of(context).qAndA,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: const Color(0xFF171412),
                        fontWeight: FontWeight.w600),
                  ),
                )
              : SizedBox(
                  width: MediaQuery.of(context).size.width - 120,
                  child: Text(
                    title,
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: AppColors.grayWarm950),
                  ),
                ),
          InkWell(
            onTap: () async {
              //TODO: show modal bottom sheet
              //ModalBottomSheet.showBottomModal(context, modalBottomSheet);
            },
            child: Container(
              padding:
                  const EdgeInsets.only(right: 16, left: 8, top: 8, bottom: 16),
              child: Row(
                children: <Widget>[
                  Image.asset(
                    Assets.icon.appbarIcon.moreGrey.path,
                    width: 16,
                    height: 16,
                    package: "cct_core",
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _narrowAppBarWidget(
      BuildContext context, String title, AttachmentEntity imgSrc) {
    return Container(
      color: backgroundColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(
                    right: 16, left: 8, top: 6, bottom: 8),
                child: InkWell(
                  onTap: () async {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    Assets.icon.appbarIcon.backIcon.path,
                    width: 20,
                    height: 20,
                    package: "cct_core",
                  ),
                ),
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // TODO: Add enum AppbarExpandableParent.communicate
                      if (parentType != AppbarExpandableParent.communicate)
                        ThumbnailImage(
                          imageSrc: imgSrc,
                          hasSize: true,
                          margin: EdgeInsets.zero,
                          borderRadius: BorderRadius.circular(4),
                          width: 36,
                          height: 36,
                        ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  // TODO: Add Theme Dependency Injection
                                  color: const Color(0xFF171412),
                                  fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  )),
              InkWell(
                onTap: () async {
                  //TODO: show modal bottom sheet
                  //ModalBottomSheet.showBottomModal(context, modalBottomSheet);
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 12),
                  padding: const EdgeInsets.only(
                      right: 16, left: 8, top: 10, bottom: 16),
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        Assets.icon.appbarIcon.moreGrey.path,
                        width: 16,
                        height: 16,
                        package: "cct_core",
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
