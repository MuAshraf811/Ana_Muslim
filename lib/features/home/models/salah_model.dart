class SalahModel {
  final String zekr;
  final int repeat;
  final String bless;

  SalahModel({required this.zekr, required this.repeat, required this.bless});
  factory SalahModel.fromJson(Map<String, dynamic> res) {
    return SalahModel(
        zekr: res["zekr"], repeat: res["repeat"], bless: res["bless"]);
  }
}
