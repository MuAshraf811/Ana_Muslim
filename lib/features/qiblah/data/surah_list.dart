import 'package:ana_muslim/core/network/dio_intializer.dart';
import 'package:ana_muslim/core/network/endpoints_constants.dart';

class SurahasFetcher {
  static Future<List<dynamic>> fetchSurahs() async {
    final obj = DioIntializer.init();
    final response = await obj.get(
      EndPoinds.surahsEndPoint,
    );
    if (response.statusCode == 200) {
      return response.data["data"];
    }
    throw Exception('Error happened while fetching surahs');
  }
}
