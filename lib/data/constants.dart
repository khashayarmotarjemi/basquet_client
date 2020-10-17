import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppColors {
  static final colors = [
    main_color,
    main_color,
    main_color,
    main_color,
  ];

  static const int _r1 = 227;
  static const int _g1 = 30;
  static const int _b1 = 36;

  static const int _r2 = 45;
  static const int _g2 = 58;
  static const int _b2 = 128;

  static const int grey_shade = 110;

  static const Map<int, Color> _main_color_mat = {
    50: Color.fromRGBO(_r1, _g1, _b1, .1),
    100: Color.fromRGBO(_r1, _g1, _b1, .2),
    200: Color.fromRGBO(_r1, _g1, _b1, .3),
    300: Color.fromRGBO(_r1, _g1, _b1, .4),
    400: Color.fromRGBO(_r1, _g1, _b1, .5),
    500: Color.fromRGBO(_r1, _g1, _b1, .6),
    600: Color.fromRGBO(_r1, _g1, _b1, .7),
    700: Color.fromRGBO(_r1, _g1, _b1, .8),
    800: Color.fromRGBO(_r1, _g1, _b1, .9),
    900: Color.fromRGBO(_r1, _g1, _b1, 1),
  };

  static const Map<int, Color> _second_color_mat = {
    50: Color.fromRGBO(_r2, _g2, _b2, .1),
    100: Color.fromRGBO(_r2, _g2, _b2, .2),
    200: Color.fromRGBO(_r2, _g2, _b2, .3),
    300: Color.fromRGBO(_r2, _g2, _b2, .4),
    400: Color.fromRGBO(_r2, _g2, _b2, .5),
    500: Color.fromRGBO(_r2, _g2, _b2, .6),
    600: Color.fromRGBO(_r2, _g2, _b2, .7),
    700: Color.fromRGBO(_r2, _g2, _b2, .8),
    800: Color.fromRGBO(_r2, _g2, _b2, .9),
    900: Color.fromRGBO(_r2, _g2, _b2, 1),
  };

  static const MaterialColor main_color_mat =
  MaterialColor(0xffe31e24, _main_color_mat);

  static const main_color = _red;

  static const second_color = _blue;

  static const text_main = Color.fromARGB(255, 30, 30, 30);
  static const text_second = _blue;

  static const _red = Color.fromARGB(255, _r1, _g1, _b1);
  static const _blue = Color.fromARGB(255, _r2, _g2, _b2);

  static const grey = Color.fromARGB(255, grey_shade, grey_shade, grey_shade);

  static const loading_indicator_color = Color.fromARGB(90, _r1, _g1, _b1);
  static const light_loading_indicator_color =
  Color.fromARGB(200, 255, 255, 255);
}

class AppUrls {
  static const String base_url = 'http://10.0.2.2:8080';
  static const String image_url = '$base_url/public/image';
  static const String api_url = "$base_url/";
}

class AppDimensions {
  static double _hPadding = 14;
  static double _vPadding = 11;

  static EdgeInsets defaultFormPadding =
  EdgeInsets.symmetric(vertical: _vPadding, horizontal: _hPadding);
}

class Helpers {
/*  static showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: AppColors.main_color,
        textColor: Colors.white,
        fontSize: 13.0);
  }*/

  /*static changeSuccessfulToast([String message = 'تغییرات با موفقیت ثبت شد!']) {
    showToast(message);
  }

  static launchLogin(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => LoginPage()));
  }
*/


/*  static showErrorToast() {
    Fluttertoast.showToast(
        msg: 'خطا! لطفا مجددا تلاش کنید',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: AppColors.main_color,
        textColor: Colors.white,
        fontSize: 13.0);
  }*/

  static bool get isInDebugMode {
    // Assume you're in production mode.
    bool inDebugMode = false;

    // Assert expressions are only evaluated during development. They are ignored
    // in production. Therefore, this code only sets `inDebugMode` to true
    // in a development environment.
    assert(inDebugMode = true);

    return inDebugMode;
  }

/*  static openMap(double latitude, double longitude) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }*/

  static Widget image(String url,
      {Widget placeHolder, double height, double width}) {
    return CachedNetworkImage(
      height: height,
      width: width,
      imageUrl: url,
      placeholder: (context, _) => placeHolder,
    );
  }
/*
  static String getPersianDate(String gregorianDateTime) {
    var dateTime = gregorianDateTime.split(' ');

    if (dateTime.length == 2) {
      return PersianDateTime.fromGregorian(gregorianDateTime: dateTime[0])
          .toString();
    } else {
      return PersianDateTime.fromGregorian(gregorianDateTime: gregorianDateTime)
          .toString();
    }
  }

  static GregorianDayOfMonth getGregorianDate(PersianDayOfMonth dom) {
//    print('persian time to convert: $persianDateTime');
//    var dateTime = persianDateTime.split(' ');

    var date =
    PersianDateTime(jalaaliDateTime: "${dom.year}/${dom.month}/${dom.day}");

    return GregorianDayOfMonth(
        date.gregorianDay, date.gregorianMonth, date.gregorianYear);
  }

  static String getIranTime(String gregorianDateTime) {
    return gregorianDateTime.split(' ')[1].substring(0, 5);
  }

  static String getMonthName(int m) {
    return PersianDateTime(jalaaliDateTime: "1390/$m/01").jalaaliMonthName;
  }

  static double getSafeHeight(BuildContext context) {
    return MediaQuery
        .of(context)
        .size
        .height - 23;
  }

  static double getBodyHeight(BuildContext context) {
    return getSafeHeight(context) - 56;
  }

  static double getSafeSisze(BuildContext context) {
    return MediaQuery
        .of(context)
        .size
        .height;
  }

  static bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  static List<String> getCharacterList(String s) =>
      s.runes.map((r) => new String.fromCharCode(r)).toList();

  static String replaceEnglishNumbers(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const farsi = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];

    for (int i = 0; i < farsi.length; i++) {
      input = input.replaceAll(farsi[i], english[i]);
    }

    return input;
  }

  static String normalizePassword(String password) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const farsi = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
    for (int i = 0; i < farsi.length; i++) {
      password = password.replaceAll(farsi[i], english[i]);
    }

    return password;
  }*/
}

/*class LiteralConstants {
  static const String callbackUrl = 'epet24://open-epet-app';
}*/
