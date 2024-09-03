class PreyTimesModel {
  final String fajr;
  final String sunRise;
  final String dhuhr;
  final String asr;
  final String sunSet;
  final String maghrib;
  final String isha;
  final String lastThird;
  final String date;
  final String hijiriDate;
  final String weekDay;

  PreyTimesModel({
    required this.fajr,
    required this.weekDay,
    required this.sunRise,
    required this.dhuhr,
    required this.asr,
    required this.sunSet,
    required this.maghrib,
    required this.isha,
    required this.lastThird,
    required this.date,
    required this.hijiriDate,
  });

  factory PreyTimesModel.fromjson(Map<String, dynamic> json) {
    return PreyTimesModel(
      weekDay: json["date"]["hijri"]["weekday"]["ar"],
      fajr: json["timings"]["Fajr"],
      sunRise: json["timings"]["Sunrise"],
      dhuhr: json["timings"]["Dhuhr"],
      asr: json["timings"]["Asr"],
      sunSet: json["timings"]["Sunset"],
      maghrib: json["timings"]["Maghrib"],
      isha: json["timings"]["Isha"],
      lastThird: json["timings"]["Lastthird"],
      date: json["date"]["readable"],
      hijiriDate: json["date"]["hijri"]["date"],
    );
  }
}
