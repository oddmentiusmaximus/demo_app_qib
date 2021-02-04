class SpecialServiceModel {
  String id;
  String specialServices;

  SpecialServiceModel({this.id, this.specialServices});

  SpecialServiceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    specialServices = json['specialServices'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['specialServices'] = this.specialServices;
    return data;
  }
}
