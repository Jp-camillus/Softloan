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

class Organisatio {
  final String id;
  final String name;
  final String type;
  final String registrationnumber;
  final String address;
  final String phonenumber;
  final String email;
  final String website;
  final String contactperson;
  final String contactpersontittle;
  final String contactpersonphonenumber;
  final String contactpersonwhatsappnumber;
  final String contactpersonemail;
  final String createdat;
  final String updatedat;
  Organisatio({
    required this.id,
    required this.name,
    required this.type,
    required this.registrationnumber,
    required this.address,
    required this.phonenumber,
    required this.email,
    required this.website,
    required this.contactperson,
    required this.contactpersontittle,
    required this.contactpersonphonenumber,
    required this.contactpersonwhatsappnumber,
    required this.contactpersonemail,
    required this.createdat,
    required this.updatedat,
  });
  factory Organisatio.fromJson(Map<String, dynamic> json) {
    return Organisatio(
        id: json['data']['id'],
        name: json['data']['name'],
        type: json['data']['type'],
        registrationnumber: json['data']['registration_number'],
        address: json['data']['address'],
        phonenumber: json['data']['phone_number'],
        email: json['data']['email'],
        website: json['data']['website'],
        contactperson: json['data']['contact_person'],
        contactpersontittle: json['data']['contact_person_title'],
        contactpersonphonenumber: json['data']['contact_person_phone_number'],
        contactpersonwhatsappnumber: json['data']
            ['contact_person_whatsapp_number'],
        contactpersonemail: json['data']['contact_person_email'],
        createdat: json['data']['created_at'],
        updatedat: json['data']['updated_at']);
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
    return Banks(id: json['data']['id'], name: json['data']['name']);
  }
}

class Faq {
  final String id;
  final String qustion;
  final String answer;
  Faq({
    required this.id,
    required this.qustion,
    required this.answer,
  });
  factory Faq.fromJson(Map<String, dynamic> json) {
    return Faq(
        id: json['data']['id'],
        qustion: json['data']['question'],
        answer: json['data']['answer']);
  }
}
