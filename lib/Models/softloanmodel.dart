import 'package:flutter/foundation.dart';

class UserData {
  final int? id;
  final String? name;
  final String? phone;
  final String? email;
  final String? surname;
  final String? lastname;
  final String? gender;
  final String? organisation;
  final String? worktype;
  final String? workrole;
  final String? salary;
  final String? bank;
  final String? banknumber;
  final String? eligibleloanbalance;
  final String? verificationstatus;
  final DateTime? emailVerifiedAt;
  final DateTime? phoneVerifiedAt;
  final DateTime? approvedAt;
  final DateTime? sendNextOtpSmsAfter;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<dynamic>? loans; // Adjust the type as per your API response

  UserData({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.surname,
    this.lastname,
    this.gender,
    this.organisation,
    this.worktype,
    this.workrole,
    this.salary,
    this.bank,
    this.banknumber,
    this.eligibleloanbalance,
    this.verificationstatus,
    this.emailVerifiedAt,
    this.phoneVerifiedAt,
    this.approvedAt,
    this.sendNextOtpSmsAfter,
    this.createdAt,
    this.updatedAt,
    this.loans,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      surname: json['surname'],
      lastname: json['last_name'],
      gender: json['gender'],
      organisation: json['organization'],
      worktype: json['work_type'],
      workrole: json['work_role'],
      salary: json['salary'],
      bank: json['bank'],
      banknumber: json['account_number'],
      eligibleloanbalance: json['eligible_loan_balance'],
      verificationstatus: json['verification_status'],
      emailVerifiedAt: json['email_verified_at'] != null
          ? DateTime.parse(json['email_verified_at'])
          : null,
      phoneVerifiedAt: json['phone_verified_at'] != null
          ? DateTime.parse(json['phone_verified_at'])
          : null,
      approvedAt: json['approved_at'] != null
          ? DateTime.parse(json['approved_at'])
          : null,
      sendNextOtpSmsAfter: json['send_next_otp_sms_after'] != null
          ? DateTime.parse(json['send_next_otp_sms_after'])
          : null,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      loans: json['loans'] ?? [], // Default to an empty list if 'loans' is null
    );
  }
}

class Organisation {
  List<Data>? orga;

  Organisation({this.orga});

  Organisation.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      orga = <Data>[];
      json['data'].forEach((v) {
        orga!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orga != null) {
      data['data'] = this.orga!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? type;
  String? registrationNumber;
  String? address;
  String? phoneNumber;
  String? email;
  String? website;
  String? contactPerson;
  String? contactPersonTitle;
  String? contactPersonPhoneNumber;
  String? contactPersonWhatsappNumber;
  String? contactPersonEmail;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.name,
      this.type,
      this.registrationNumber,
      this.address,
      this.phoneNumber,
      this.email,
      this.website,
      this.contactPerson,
      this.contactPersonTitle,
      this.contactPersonPhoneNumber,
      this.contactPersonWhatsappNumber,
      this.contactPersonEmail,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    registrationNumber = json['registration_number'];
    address = json['address'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    website = json['website'];
    contactPerson = json['contact_person'];
    contactPersonTitle = json['contact_person_title'];
    contactPersonPhoneNumber = json['contact_person_phone_number'];
    contactPersonWhatsappNumber = json['contact_person_whatsapp_number'];
    contactPersonEmail = json['contact_person_email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['registration_number'] = this.registrationNumber;
    data['address'] = this.address;
    data['phone_number'] = this.phoneNumber;
    data['email'] = this.email;
    data['website'] = this.website;
    data['contact_person'] = this.contactPerson;
    data['contact_person_title'] = this.contactPersonTitle;
    data['contact_person_phone_number'] = this.contactPersonPhoneNumber;
    data['contact_person_whatsapp_number'] = this.contactPersonWhatsappNumber;
    data['contact_person_email'] = this.contactPersonEmail;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Banks {
  final String id;
  final String name;
  Banks({
    required this.id,
    required this.name,
  });
  factory Banks.fromJson(Map<String, dynamic> json) {
    return Banks(id: json['id'], name: json['name']);
  }
}

class Faq {
  String status;
  String message;
  Datafaq data;

  Faq({required this.status, required this.message, required this.data});
  String get fullName {
    return '${data.answer} ${data.question} ${data.id}';
  }
}

class Datafaq {
  String id;
  String question;
  String answer;
  Null createdAt;
  Null updatedAt;

  Datafaq(
      {required this.id,
      required this.question,
      required this.answer,
      this.createdAt,
      this.updatedAt});
}
