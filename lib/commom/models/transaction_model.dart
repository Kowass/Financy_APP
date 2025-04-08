import 'dart:convert';

import 'package:financy_app/commom/extensions/date_formatter.dart';
import 'package:uuid/uuid.dart';

class TransactionModel {
   final String description;
   final String category;
   final double value;
   final int date;
   final int createdAt;
   final bool status;
   final String? id;
   TransactionModel({
     required this.category,
     required this.description,
     required this.value,
     required this.date,
     required this.createdAt,
     required this.status,
     this.id,
   });
 
   Map<String, dynamic> toMap() {
     return <String, dynamic>{
       'description': description,
       'category': category,
       'value': value,
       'date': DateTime.fromMillisecondsSinceEpoch(date).formatISOTime,
       'created_at': DateTime.fromMillisecondsSinceEpoch(createdAt).formatISOTime,
       'status': status,
       'id': id ?? const Uuid().v4(),
     };
   }
 
   factory TransactionModel.fromMap(Map<String, dynamic> map) {
     return TransactionModel(
       description: map['description'] as String,
       category: map['category'] as String,
       value: double.tryParse(map['value'].toString()) ?? 0,
       date: DateTime.parse(map['date'] as String).millisecondsSinceEpoch,
       createdAt:
          DateTime.parse(map['created_at'] as String).millisecondsSinceEpoch,
       status: map['status'] as bool,
       id: map['id'] as String?,
     );
   }
 
   String toJson() => json.encode(toMap());
 
   factory TransactionModel.fromJson(String source) =>
       TransactionModel.fromMap(json.decode(source) as Map<String, dynamic>);
 
   @override
   bool operator ==(covariant TransactionModel other) {
     if (identical(this, other)) return true;
 
     return other.description == description &&
         other.category == category &&
         other.value == value &&
         other.date == date &&
         other.createdAt == createdAt &&
         other.status == status &&
         other.id == id;
   }
 
   @override
   int get hashCode {
     return description.hashCode ^
         category.hashCode ^
         value.hashCode ^
         date.hashCode ^
         createdAt.hashCode ^
         status.hashCode ^
         id.hashCode;
   }

   TransactionModel copyWith({
    String? description,
    String? category,
    double? value,
    int? date,
    bool? status,
    int? createdAt,
    String? id,
  }) {
    return TransactionModel(
      description: description ?? this.description,
      category: category ?? this.category,
      value: value ?? this.value,
      date: date ?? this.date,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id ?? const Uuid().v4(),
    );
  }
 }