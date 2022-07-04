// ignore_for_file: file_names, prefer_collection_literals

class Address {
  String? orderId;
  String? name;
  String? address;
  String? mobileNumber;
  String? fromName;
  String? fromAddress;
  String? status;
  String? startLatitude;
  String? startLongitude;
  String? endLatitude;

  Address(
      {this.orderId,
      this.name,
      this.address,
      this.mobileNumber,
      this.fromName,
      this.fromAddress,
      this.status,
      this.startLatitude,
      this.startLongitude,
      this.endLatitude});

  Address.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    name = json['Name'];
    address = json['Address'];
    mobileNumber = json['Mobile_number'];
    fromName = json['From_name'];
    fromAddress = json['From_address'];
    status = json['Status'];
    startLatitude = json['start_latitude'];
    startLongitude = json['start_longitude'];
    endLatitude = json['end_latitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['order_id'] = orderId;
    data['Name'] = name;
    data['Address'] = address;
    data['Mobile_number'] = mobileNumber;
    data['From_name'] = fromName;
    data['From_address'] = fromAddress;
    data['Status'] = status;
    data['start_latitude'] = startLatitude;
    data['start_longitude'] = startLongitude;
    data['end_latitude'] = endLatitude;
    return data;
  }
}
