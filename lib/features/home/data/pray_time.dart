import 'package:ana_muslim/core/network/dio_intializer.dart';

import '../../../core/network/endpoints_constants.dart';

class PrayTimesCall {
  PrayTimesCall._();

  static Future<Map<String, dynamic>> getPreyTimesByDateAndLocation(
      {required String date,
      required String city,
      required String country}) async {
    final obj = DioIntializer.init();
    final res = await obj.get(
      '${EndPoinds.prayTimesEndpoint}$date?',
      queryParameters: {"city": city, "country": country},
    );
    if (res.statusCode == 200) {
      return res.data["data"];
    }
    throw Exception('Something went wrong while fetching pray times');
  }
}
