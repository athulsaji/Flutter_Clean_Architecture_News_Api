import 'package:equatable/equatable.dart';

class Source extends Equatable {
  final String id;
  final String name;

  const Source({
    this.id,
    this.name,
  });
  List<Object> get props => [id, name];

  bool get stringify => true;
}
