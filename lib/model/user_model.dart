class UserModel {
  String id;
  String userName;
  String dateOfBirth;
  String address;
  String accountNo;

  UserModel(
      {this.id, this.userName, this.dateOfBirth, this.address, this.accountNo});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    dateOfBirth = json['dateOfBirth'];
    address = json['address'];
    accountNo = json['accountNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['dateOfBirth'] = this.dateOfBirth;
    data['address'] = this.address;
    data['accountNo'] = this.accountNo;
    return data;
  }
}
