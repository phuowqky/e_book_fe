import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    String? id,
    String? userName,
    String? email,
    String? phone,
    String? fullName,
    String? avatar,
    DateTime? dateOfBirth,
    String? gender,
    int? role,
    String? createdAt,
    String? updatedAt,
    String? limitTimeChatAt,
    bool? isVerified,
    int? yearOfBirth,
    String? password,
    String? token,

    // khoa hoc-web, sach:  da mua
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
