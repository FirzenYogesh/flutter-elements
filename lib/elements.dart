library elements;

import 'package:elements/src/tools/device.dart';

/// elements tools goes here
export 'src/tools/api.dart' show ApiHelper, HTTP_METHOD;
export 'src/tools/device.dart' show DeviceUtils;
export 'src/tools/db.dart' show DB;
export 'src/tools/utils.dart' show Utils, Environment;

/// elements view goes here
export 'src/widgets/text/auto_size_text.dart' show AutoSizeText;
export 'src/widgets/text/body_text1.dart' show TextBody1;
export 'src/widgets/text/body_text2.dart' show TextBody2;
export 'src/widgets/text/headline1.dart' show TextH1;
export 'src/widgets/text/headline2.dart' show TextH2;
export 'src/widgets/text/headline3.dart' show TextH3;
export 'src/widgets/text/headline4.dart' show TextH4;
export 'src/widgets/text/headline5.dart' show TextH5;
export 'src/widgets/text/headline6.dart' show TextH6;
export 'src/widgets/text/subtitle1.dart' show TextSubtitle1;
export 'src/widgets/text/subtitle2.dart' show TextSubtitle2;
export 'src/widgets/text/caption.dart' show TextCaption;
export 'src/widgets/text/button.dart' show TextB;
export 'src/widgets/text/overline.dart' show TextOverline;
export 'src/widgets/bottom_sheet.dart' show BottomSheetView;
export 'src/widgets/flexible_divider.dart' show FlexibleDivider;

export 'src/widgets/list_view_tile.dart' show ListViewTile;

export 'src/widgets/pages/bottom_navigation_bar.dart'
    show HomePageBottomNavigationBar;
export 'src/widgets/pages/single_page.dart' show SinglePageHome;

class Elements {
  static Future<void> initialize() async {
    await DeviceUtils.initialize();
  }
}
