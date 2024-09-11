part of app_constants;

class AppAssets {
  static SvgPicture userIcon2({double size = 24, required Color color}) => SvgPicture.asset('res/images/user_icon.svg', width: size.w, height: size.h, color: color,);
  static SvgPicture backIcon({double size = 24, required Color color}) =>
      SvgPicture.asset('res/images/back_icon.svg', width: size.w, height: size.h, color: color,);
  static SvgPicture eyeSlashIcon({double size = 24}) => SvgPicture.asset('res/images/eye_slash.svg', width: size.w, height: size.h, color: AppColors.labelColor);
  static SvgPicture eyeIcon({double size = 24}) => SvgPicture.asset('res/images/eye.svg', width: size.w, height: size.h, color: AppColors.labelColor,);
  static SvgPicture messageIcon({double size = 24, required Color color}) => SvgPicture.asset('res/images/message.svg', width: size.w, height: size.h, color: color,);
  static SvgPicture mentionIcon({double size = 24, required Color color}) => SvgPicture.asset('res/images/mention.svg', width: size.w, height: size.h, color: color,);
  static SvgPicture writeIcon({double size = 24, required Color color}) => SvgPicture.asset('res/images/write.svg', width: size.w, height: size.h, color: color);
  static SvgPicture groupIcon({double size = 24}) => SvgPicture.asset('res/images/group_icon.svg', width: size.w, height: size.h);
  static SvgPicture userIcon({double size = 24, }) => SvgPicture.asset('res/images/user_icon.svg', width: size.w, height: size.h);
  static SvgPicture searchIcon({double size = 24, required Color color}) => SvgPicture.asset('res/images/search_icon.svg', width: size.w, height: size.h, color: color,);
  static SvgPicture lightningIcon({double size = 24, required Color color}) => SvgPicture.asset('res/images/lightning_icon.svg', width: size.w, height: size.h, color: color,);
  static SvgPicture sendIcon({double size = 24, required Color color}) => SvgPicture.asset('res/images/send_icon.svg', width: size.w, height: size.h, color: color,);
  static SvgPicture attachIcon({double size = 24, required Color color}) => SvgPicture.asset('res/images/attach_icon.svg', width: size.w, height: size.h, color: color,);
  static SvgPicture bigMessage({double size = 136, required Color color}) => SvgPicture.asset('res/images/big_message.svg', width: size.w, height: size.h, color: color,);
  static SvgPicture checkArrow({double width = 12,  double height = 9})  => SvgPicture.asset('res/images/check_arrow.svg', width: width.w, height: height.h,);
  static SvgPicture addIcon({double size = 16, required Color color}) => SvgPicture.asset('res/images/add.svg', width: size.w, height: size.h, color: color,);
  static SvgPicture location({double size = 24, required Color color}) => SvgPicture.asset('res/images/location.svg', width: size.w, height: size.h,);
  static SvgPicture arrow_back({double size = 24, required Color color}) => SvgPicture.asset('res/images/arrow_back.svg', width: size.w, height: size.h,);
  static SvgPicture heart_outlined({double size = 24, required Color color}) => SvgPicture.asset('res/images/heart_outlined.svg', width: size.w, height: size.h,);
  static SvgPicture arrowForward({double width = 24, double height = 24, required Color color}) => SvgPicture.asset('res/images/forward.svg', width: width.w, height: height.h, color: color,);
  static SvgPicture emailIcon({double width = 24, double height = 24, required Color color}) => SvgPicture.asset('res/images/email.svg', width: width.w, height: height.h, color: color,);
  static SvgPicture logoutIcon({double width = 24, double height = 24, required Color color}) => SvgPicture.asset('res/images/logout.svg', width: width.w, height: height.h, color: color,);
}