// -- Icons --
enum AppIcons {
  magnifyingGlass,
  list,
  pen,
  user,
  sack,
  bookmark,
  xmark,
  chevronLeft,
  plus,
  file
}

extension AppIconExtension on AppIcons {
  String get path {
    switch (this) {
      case AppIcons.magnifyingGlass:
        return 'assets/icons/magnifying_glass_solid.svg';
      case AppIcons.list:
        return 'assets/icons/rectangle_list_regular.svg';
      case AppIcons.pen:
        return 'assets/icons/pen_solid.svg';
      case AppIcons.user:
        return 'assets/icons/user_solid.svg';
      case AppIcons.sack:
        return 'assets/icons/sack_dollar_solid.svg';
      case AppIcons.bookmark:
        return 'assets/icons/bookmark_regular.svg';
      case AppIcons.xmark:
        return 'assets/icons/xmark_solid.svg';
      case AppIcons.chevronLeft:
        return 'assets/icons/chevron_left.svg';
      case AppIcons.plus:
        return 'assets/icons/plus_solid.svg';
      case AppIcons.file:
        return 'assets/icons/file_solid.svg';
    }
  }
}

// -- Logos --
enum AppLogos { amazon, asana, cryptoDotCom, google, slack }

extension AppLogosExtension on AppLogos {
  String get path {
    switch (this) {
      case AppLogos.amazon:
        return 'assets/logos/amazon_logo.svg';
      case AppLogos.asana:
        return 'assets/logos/asana_logo.svg';
      case AppLogos.cryptoDotCom:
        return 'assets/logos/crypto_dot_com_logo.svg';
      case AppLogos.google:
        return 'assets/logos/google_logo.svg';
      case AppLogos.slack:
        return 'assets/logos/slack_logo.svg';
    }
  }
}

// -- Images --
enum AppImages { face }

extension AppImagesExtension on AppImages {
  String get path {
    switch (this) {
      case AppImages.face:
        return 'assets/images/face.jpg';
    }
  }
}
