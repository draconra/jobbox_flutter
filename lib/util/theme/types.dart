enum FontFamilies { antourOne, poppins }

extension FontFamilyExtension on FontFamilies {
  String get name {
    switch (this) {
      case FontFamilies.antourOne:
        return 'AntourOne';
      case FontFamilies.poppins:
        return 'Poppins';
    }
  }
}