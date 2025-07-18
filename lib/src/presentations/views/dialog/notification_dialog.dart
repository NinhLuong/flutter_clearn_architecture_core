import 'package:cct_config/cct_config.dart';
import 'package:cct_core/gen/assets.gen.dart';
import 'package:cct_core/src/data/services/notification_permission_service.dart';
import 'package:cct_core/src/di/service_locator.dart';
import 'package:cct_core/src/presentations/cubit/notification/notification_bar/notification_bar_visible_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class NotificationRequestPermissionBanner extends StatefulWidget {
  final DynamicPermissionConfigSource dynamicPermissionConfigSource;
  final AnalyticsFromSourceEnum fromSource;

  const NotificationRequestPermissionBanner(
      {super.key,
      required this.dynamicPermissionConfigSource,
      required this.fromSource});

  @override
  State<NotificationRequestPermissionBanner> createState() =>
      _NotificationRequestPermissionBannerState();
}

class _NotificationRequestPermissionBannerState
    extends State<NotificationRequestPermissionBanner> {
  bool isShowValue = false;

  @override
  void initState() {
    isShowValue = getIt<NotificationPermissionService>()
        .shouldShowPermission(widget.dynamicPermissionConfigSource);

    context
        .read<NotificationBarVisibleCubit>()
        .setVisibleStateNotificationBar(OneSignal.Notifications.permission);

    SystemChannels.lifecycle.setMessageHandler(
      (message) async {
        if (message == "AppLifecycleState.resumed") {
          context
              .read<NotificationBarVisibleCubit>()
              .setVisibleStateNotificationBar(
                  OneSignal.Notifications.permission);
        }
        return message;
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationBarVisibleCubit,
        NotificationBarVisibleState>(
      builder: (context, state) {
        bool permission = state is NotificationBarVisible;
        return Visibility(
          visible: isShowValue && !permission,
          child: Container(
            width: MediaQuery.of(context).size.width - 32,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                gradient: const LinearGradient(
                    colors: AppColors.buttonGradientColors)),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: Assets.icon.notificationIcon.notiIcon.image(
                        width: 20, height: 20, color: AppColors.brand500),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  flex: 8,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      "${AppLocalizations.of(context).thereIsAnImportantNoticeToRead}!!!",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                InkWell(
                  onTap: () {
                    /*AnalyticUtils.reportEventWithCustomParams(
                      AnalyticsEnum.app_noti_bar_allow,
                      {
                        "fromSource": widget.fromSource.name,
                      },
                    );
                    DialogUtils.showCustomAlertDialog(context,
                        notificationPermissionRequestDialog(), Colors.white,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 0),
                        dialogMargin: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 50,
                        ));*/

                    //TODO: add show dialog
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      AppLocalizations.of(context).turnOn,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: const Color.fromRGBO(91, 135, 62, 1),
                          ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget notificationPermissionRequestDialog() {
    List<String> descriptionContent = [
      AppLocalizations.of(context).listenToTheNewPodcastEpisodeImmediately,
      AppLocalizations.of(context).readTheRelevantArticleNow,
      AppLocalizations.of(context).getSolutionAsSoonAsPossible
    ];
    return Column(
      children: [
        Assets.icon.notificationIcon.notificationDialogBanner.image(),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                AppLocalizations.of(context).turnOnNotificationsTo,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: AppColors.grayWarm950,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  children: [
                    for (int i = 0; i < descriptionContent.length; i++)
                      Row(
                        children: [
                          Assets.icon.notificationIcon.bannerCheck
                              .image(width: 20),
                          const SizedBox(width: 8),
                          Text(
                            descriptionContent[i],
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: AppColors.grayWarm500, height: 1.5),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            backgroundColor: AppColors.grayWarm200,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60),
                            )),
                        child: Text(
                          AppLocalizations.of(context).later,
                          style: Theme.of(context).textTheme.bodyLarge!.apply(
                              color: AppColors.grayWarm500, fontWeightDelta: 3),
                        ),
                        onPressed: () {
                          /*AnalyticUtils.reportEventWithCustomParams(
                            AnalyticsEnum.app_noti_popup_skip,
                            {
                              "fromSource": widget.fromSource.name,
                            },
                          );*/
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            backgroundColor: AppColors.brand500,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60),
                            )),
                        child: Text(AppLocalizations.of(context).turnItOnNow,
                            style: Theme.of(context).textTheme.bodyLarge!.apply(
                                color: Colors.white, fontWeightDelta: 3)),
                        onPressed: () async {
                          /*AnalyticUtils.reportEventWithCustomParams(
                            AnalyticsEnum.app_noti_popup_allow,
                            {
                              "fromSource": widget.fromSource.name,
                            },
                          );*/
                          //TODO: request notification permission
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
