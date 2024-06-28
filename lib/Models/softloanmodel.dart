import 'package:flutter/foundation.dart';

class Userdata {}

class Organisation {
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
  Organisation({
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
  factory Organisation.fromJson(Map<String, dynamic> json) {
    return Organisation(
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
