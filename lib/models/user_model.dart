import 'package:cloud_firestore/cloud_firestore.dart';

class UserEntity {
  String? id;
  String? name;
  String? email;
  String? phoneNumber;

  UserEntity({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
  });

  factory UserEntity.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();

    return UserEntity(
      id: snapshot.id,
      name: data?['name'],
      email: data?['email'],
      phoneNumber: data?['phoneNumber'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (phoneNumber != null) 'phoneNumber': phoneNumber,
    };
  }
}

class PurchasedCoin {
  DateTime? purchaseDate;
  double? purchasePrice;
  double? quantity;
  String? coinId;

  PurchasedCoin({
    this.purchaseDate,
    this.purchasePrice,
    this.quantity,
    this.coinId,
  });

  factory PurchasedCoin.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();

    return PurchasedCoin(
      purchaseDate: data?['purchaseDate']?.toDate(),
      purchasePrice: data?['purchasePrice'],
      quantity: data?['quantity'],
      coinId: data?['coinId'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (purchaseDate != null) 'purchaseDate': purchaseDate,
      if (purchasePrice != null) 'purchasePrice': purchasePrice,
      if (quantity != null) 'quantity': quantity,
      if (coinId != null) 'coinId': coinId,
    };
  }
}
