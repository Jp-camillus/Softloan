class SoftloanendPoints {
  static const String BASEURL = "https://softloan.49gig.com/";

  ///AUTH END POINTS
  //To register user
  static const String REGISTERENDPOINT = BASEURL + "api/v1/auth/register";
  // To login user
  static const String LOGINUSER = BASEURL + "api/v1/auth/login";
  // To verify phone
  static const String VERIFYPHONE = BASEURL + "api/v1/verify-phone";
  //  To send phone number
  static const String PHONE = BASEURL + "api/v1/user/phone";
  // to resend otp
  static const String RESENDOTP = BASEURL + "api/v1/user/resend-phone-otp";

  //USER DATA
  static const String USERDATA = BASEURL + "api/v1/user";
  //ORGANISATION
  static const String ORGANISATIONDATA = BASEURL + "api/v1/organizations";
  //BANK
  static const String BANK = BASEURL + "api/v1/organizations";
  //FAQ
  static const String FAQ = BASEURL + "api/v1/faq";
  //VERIFICATION
  static const String VERIFICAITON = BASEURL + "api/v1/submit-verification";
  //VERIFICATION ID
  static String VERIFICATIONID(String id) =>
      BASEURL + "api/v1/verifications/$id";
  //LOANS
  static const String LOANS = BASEURL + "api/v1/loans";
}
