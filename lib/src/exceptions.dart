// ignore_for_file: public_member_api_docs
class CastException implements Exception {
  const CastException(this.value, this.type);

  final dynamic value;
  final Type type;

  @override
  String toString() {
    return 'Exception: Value $value of type ${value.runtimeType} '
        'cannot be casted to type ${type.toString()}';
  }
}
