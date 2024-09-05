import 'package:ana_muslim/core/network/dio_intializer.dart';
import 'package:ana_muslim/core/network/endpoints_constants.dart';

class HadithBooksFetcher {
  HadithBooksFetcher._();

  static Future<List<dynamic>> fetchAllHadithBooks() async {
    final instance = DioIntializer.init();
    final response = await instance.get(
      EndPoinds.allHadithBooks,
    );

    if (response.statusCode == 200) {
      return response.data["data"];
    }
    throw Exception("Some thing went wrong in hadith fetcher");
  }
}
