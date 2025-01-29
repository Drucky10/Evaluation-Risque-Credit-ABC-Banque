class Client {
  String clientName;
  String clientFirstName;
  String revenue;
  String transaction;
  String frequency;
  String debtRate;
  String age;
  String maritalStatus;
  String children;
  String employmentType;
  String employmentDuration;
  String houseOwnership;
  String creditScore;
  String paymentDelays;

  Client({
    required this.clientName,
    required this.clientFirstName,
    required this.revenue,
    required this.transaction,
    required this.frequency,
    required this.debtRate,
    required this.age,
    required this.maritalStatus,
    required this.children,
    required this.employmentType,
    required this.employmentDuration,
    required this.houseOwnership,
    required this.creditScore,
    required this.paymentDelays,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      clientName: json['clientName'],
      clientFirstName: json['clientFirstName'],
      revenue: json['revenue'],
      transaction: json['transaction'],
      frequency: json['frequency'],
      debtRate: json['debtRate'],
      age: json['age'],
      maritalStatus: json['maritalStatus'],
      children: json['children'],
      employmentType: json['employmentType'],
      employmentDuration: json['employmentDuration'],
      houseOwnership: json['houseOwnership'],
      creditScore: json['creditScore'],
      paymentDelays: json['paymentDelays'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'clientName': clientName,
      'clientFirstName': clientFirstName,
      'revenue': revenue,
      'transaction': transaction,
      'frequency': frequency,
      'debtRate': debtRate,
      'age': age,
      'maritalStatus': maritalStatus,
      'children': children,
      'employmentType': employmentType,
      'employmentDuration': employmentDuration,
      'houseOwnership': houseOwnership,
      'creditScore': creditScore,
      'paymentDelays': paymentDelays,
    };
  }
}
