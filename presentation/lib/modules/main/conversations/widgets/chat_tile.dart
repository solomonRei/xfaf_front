import 'package:chat/generated/locale_keys.loc.dart';
import 'package:domain/modules/chat/conversations/entities/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart' hide Trans;
import 'package:chat/common/widgets/common_text.dart';
import 'package:chat/common/widgets/red_circle.dart';
import 'package:chat/common/widgets/round_cached_image.dart';
import 'package:chat/constants/resources/colors.dart';
import 'package:chat/routes/app_pages.dart';

import '../../../../constants/app_constants.dart';
import '../../../../constants/resources/help_functions.dart';
import '../controllers/chats_controller.dart';

class ChatTile extends StatelessWidget {
  ChatTile({Key? key, required this.conversationEntity, this.onTap})
      : super(key: key);
  final ConversationEntity conversationEntity;
  final Function()? onTap;

  final ChatsController chatsController = Get.find();

  String you() {
    if (conversationEntity.message!.owner.id ==
        chatsController.currentUserEntity!.id) {
      return '${LocaleKeys.you.tr().capitalize!}: ';
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    DateTime date = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
        .parse(conversationEntity.editedTimestamp);
    final dateToCheck = DateTime(date.year, date.month, date.day);
    return Slidable(
      endActionPane: ActionPane(
          extentRatio: 0.35,
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {},
              backgroundColor: AppColors.authInputColor,
              icon: Icons.more_horiz,
              foregroundColor: AppColors.mainTextColor,
            ),
            SlidableAction(
              onPressed: (context) async {
                await chatsController.deleteConversation(conversationEntity);
              },
              backgroundColor: AppColors.authInputColor,
              icon: Icons.delete,
              foregroundColor: AppColors.notificationRed,
            ),
          ]),
      child: InkWell(
        onTap: () {
          final String conversationImg = getConversationImg(
              conversationEntity, chatsController.currentUserEntity!);
          Get.toNamed(Routes.ROOM,
              arguments: {'conversationEntity': conversationEntity});
          // chatsController.messagesSubscription.cancel();
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
          height: 64.h,
          width: double.maxFinite,
          decoration: BoxDecoration(
              border: Border(
                  bottom:
                      BorderSide(width: 1, color: AppColors.mainBorderColor))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              conversationEntity.type != 2
                  ? RoundedCachedImage(
                      imgUrl: getConversationImg(conversationEntity,
                          chatsController.currentUserEntity!))
                  : RoundedCachedImage(
                      imgUrl: conversationEntity.picture?.url ?? ''),
              SizedBox(
                width: 8.w,
              ),
              SizedBox(
                width: 222.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonText(
                      text: conversationEntity.type == 1
                          ? givePrivateConversationName(
                              chatsController.currentUserEntity!,
                              conversationEntity)
                          : conversationEntity.name,
                      size: 14,
                      lineHeight: 1.2,
                      fontWeight: FontWeight.w700,
                      color: AppColors.mainTextColor,
                      isEllipsis: true,
                      numberOfLines: 1,
                    ),
                    CommonText(
                      text: conversationEntity.message != null
                          ? you() + conversationEntity.message!.content
                          : 'The beginning of conversation',
                      size: 12,
                      lineHeight: 1.2,
                      color: AppColors.labelColor,
                      isEllipsis: true,
                      numberOfLines: 1,
                    )
                  ],
                ),
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  conversationEntity.unread != 0
                      ? RedCircle(number: conversationEntity.unread)
                      : const SizedBox(),
                  SizedBox(
                    height: 3.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 7.h),
                    child: Row(
                      children: [
                        CommonText(
                          text: dateToCheck == today
                              ? DateFormat.Hm()
                                  .format(date.add(const Duration(hours: 3)))
                              : dateToCheck == yesterday
                                  ? LocaleKeys.yesterday.tr().capitalize!
                                  : DateFormat.yMd().format(
                                      date.add(const Duration(hours: 3))),
                          size: 12,
                          color: AppColors.labelColor,
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
