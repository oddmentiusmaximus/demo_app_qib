class BankingModel {
  String id;
  String bankingSection;

  BankingModel({this.id, this.bankingSection});

  BankingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bankingSection = json['bankingSection'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bankingSection'] = this.bankingSection;
    return data;
  }
}
