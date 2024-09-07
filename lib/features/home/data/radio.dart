import 'package:ana_muslim/core/network/dio_intializer.dart';
import 'package:ana_muslim/core/network/endpoints_constants.dart';

class RadioManager {
  RadioManager._();

  static Future<List<dynamic>> getallRadioChannel() async {
    final obj = DioIntializer.init();
    final res = await obj.get(
      EndPoinds.radioEndPoint,
    );
    if (res.statusCode == 200) {
      return res.data["radios"];
    }
    throw Exception('Something went wrong while fetching pray times');
  }
}
