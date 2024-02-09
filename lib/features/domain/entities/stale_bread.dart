import 'package:equatable/equatable.dart';

class StaleBreadEntity extends Equatable {
  final int id;
  final double breadEquivalent; // Using double for decimal in Dart
  final String name;

  const StaleBreadEntity({
    required this.id,
    required this.breadEquivalent,
    required this.name,
  });

  @override
  List<Object?> get props {
    return [id, breadEquivalent, name];
  }
}
