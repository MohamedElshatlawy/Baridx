import '../../domain/entities/review_entity.dart';

class ReviewModel extends ReviewEntity {
  ReviewModel({
    super.customerName,
    super.customerPhoneNumber,
    super.customerAddress,
    super.packageType,
    super.weight,
    super.deliveryNote,
    super.paymentMethod,
    super.cardNumber,
    super.payLaterPhoneNumber,
  });
  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      customerName: json['customerName'],
      customerPhoneNumber: json['customerPhoneNumber'],
      customerAddress: json['customerAddress'],
      packageType: json['packageType'],
      weight: json['weight'],
      deliveryNote: json['deliveryNote'],
      paymentMethod: json['paymentMethod'],
      cardNumber: json['cardNumber'],
      payLaterPhoneNumber: json['payLaterPhoneNumber'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'customerName': customerName,
      'customerPhoneNumber': customerPhoneNumber,
      'customerAddress': customerAddress,
      'packageType': packageType,
      'weight': weight,
      'deliveryNote': deliveryNote,
      'paymentMethod': paymentMethod,
      'cardNumber': cardNumber,
      'payLaterPhoneNumber': payLaterPhoneNumber,
    };
  }

  ReviewModel copyWith({
    String? customerName,
    String? customerPhoneNumber,
    String? customerAddress,
    String? packageType,
    String? weight,
    String? deliveryNote,
    String? paymentMethod,
    String? cardNumber,
    String? payLaterPhoneNumber,
  }) {
    return ReviewModel(
      customerName: customerName ?? this.customerName,
      customerPhoneNumber: customerPhoneNumber ?? this.customerPhoneNumber,
      customerAddress: customerAddress ?? this.customerAddress,
      packageType: packageType ?? this.packageType,
      weight: weight ?? this.weight,
      deliveryNote: deliveryNote ?? this.deliveryNote,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      cardNumber: cardNumber ?? this.cardNumber,
      payLaterPhoneNumber: payLaterPhoneNumber ?? this.payLaterPhoneNumber,
    );
  }
}
