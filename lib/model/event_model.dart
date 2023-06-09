// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class EventModel {
  final String title;
  final String description;
  final String bannerUrl;
  final String date;
  EventModel({
    required this.title,
    required this.description,
    required this.bannerUrl,
    required this.date,
  });

  EventModel copyWith({
    String? title,
    String? description,
    String? bannerUrl,
    String? date,
  }) {
    return EventModel(
      title: title ?? this.title,
      description: description ?? this.description,
      bannerUrl: bannerUrl ?? this.bannerUrl,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'bannerUrl': bannerUrl,
      'date': date,
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      title: map['title'] as String,
      description: map['description'] as String,
      bannerUrl: map['bannerUrl'] as String,
      date: map['date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory EventModel.fromJson(String source) => EventModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EventModel(title: $title, description: $description, bannerUrl: $bannerUrl, date: $date)';
  }

  @override
  bool operator ==(covariant EventModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.description == description &&
      other.bannerUrl == bannerUrl &&
      other.date == date;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      description.hashCode ^
      bannerUrl.hashCode ^
      date.hashCode;
  }
}
