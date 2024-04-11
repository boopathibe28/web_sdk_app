import 'dart:convert';

class LoanList {
  int? appCode;
  String? status;
  String? message;
  Data? data;

  LoanList({this.appCode, this.status, this.message, this.data});

  LoanList.fromJson(Map<String, dynamic> json) {
    appCode = json['appCode'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appCode'] = this.appCode;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<LoanDetails>? loanDetails;
  CustomerDetails? customerDetails;

  Data({this.loanDetails, this.customerDetails});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['loanDetails'] != null) {
      loanDetails = <LoanDetails>[];
      json['loanDetails'].forEach((v) {
        loanDetails!.add(new LoanDetails.fromJson(v));
      });
    }
    customerDetails = json['customerDetails'] != null
        ? new CustomerDetails.fromJson(json['customerDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.loanDetails != null) {
      data['loanDetails'] = this.loanDetails!.map((v) => v.toJson()).toList();
    }
    if (this.customerDetails != null) {
      data['customerDetails'] = this.customerDetails!.toJson();
    }
    return data;
  }
}

class LoanDetails {
  String? loanaccountnumber;
  int? loanId;
  int? sanctionedAmount;
  String? productName;
  String? productCode;
  String? accountType;
  String? lanType;
  String? status;
  String? commonClientCode;
  String? custMobile;
  String? custPan;

  LoanDetails(
      {this.loanaccountnumber,
        this.loanId,
        this.sanctionedAmount,
        this.productName,
        this.productCode,
        this.accountType,
        this.lanType,
        this.status,
        this.commonClientCode,
        this.custMobile,
        this.custPan});

  LoanDetails.fromJson(Map<String, dynamic> json) {
    loanaccountnumber = json['loanaccountnumber'];
    loanId = json['loanId'];
    sanctionedAmount = json['sanctionedAmount'];
    productName = json['productName'];
    productCode = json['productCode'];
    accountType = json['accountType'];
    lanType = json['lanType'];
    status = json['status'];
    commonClientCode = json['commonClientCode'];
    custMobile = json['custMobile'];
    custPan = json['custPan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loanaccountnumber'] = this.loanaccountnumber;
    data['loanId'] = this.loanId;
    data['sanctionedAmount'] = this.sanctionedAmount;
    data['productName'] = this.productName;
    data['productCode'] = this.productCode;
    data['accountType'] = this.accountType;
    data['lanType'] = this.lanType;
    data['status'] = this.status;
    data['commonClientCode'] = this.commonClientCode;
    data['custMobile'] = this.custMobile;
    data['custPan'] = this.custPan;
    return data;
  }
}

class CustomerDetails {
  int? custId;
  String? custName;

  CustomerDetails({this.custId, this.custName});

  CustomerDetails.fromJson(Map<String, dynamic> json) {
    custId = json['custId'];
    custName = json['custName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['custId'] = this.custId;
    data['custName'] = this.custName;
    return data;
  }
}