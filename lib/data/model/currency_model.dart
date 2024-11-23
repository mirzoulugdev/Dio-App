// ignore_for_file: public_member_api_docs, sort_constructors_first
class CurrencyModel {
  /*
  "title": "UAE Dirham",
    "code": "AED",
    "cb_price": "3496.83",
    "nbu_buy_price": null,
    "nbu_cell_price": null,
    "date": "11/23/2024 11:00:02 am"
 */

  final String title;
  final String code;
  final String cbPrice;
  final String date;

  CurrencyModel({
    required this.title,
    required this.code,
    required this.cbPrice,
    required this.date,
  });

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      title: json['title'] ?? "No data",
      code: json['code'] ?? "No data",
      cbPrice: json['cb_price'] ?? "No data",
      date: json['date'] ?? "No data",
    );
  }
}
