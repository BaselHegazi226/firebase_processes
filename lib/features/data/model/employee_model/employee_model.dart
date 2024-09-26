import '../../../../core/helper/AssetsData.dart';

class EmployeeModel {
  final String id;
  final String name;
  final String position;
  final String contactNum;
  final String gender;
  final String image;
  EmployeeModel({
    required this.id,
    required this.name,
    required this.gender,
    required this.position,
    required this.contactNum,
    required this.image,
  });

  factory EmployeeModel.fromJson(json) {
    return EmployeeModel(
      id: json['id'] ?? '',
      image: json['image'] ?? AssetsData.kImageProfile,
      name: json['name'] ?? '',
      gender: json['gender'] ?? 'No gender',
      position: json['position'] ?? '',
      contactNum: json['contactNum'] ?? '',
    );
  }
}
