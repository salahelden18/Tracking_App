// ignore_for_file: public_member_api_docs, sort_constructors_first
class TypeCurrecncyState {
  int? type;
  String? currency;

  TypeCurrecncyState(this.type, this.currency);

  TypeCurrecncyState copyWith({
    int? type,
    String? currency,
  }) {
    return TypeCurrecncyState(
      type ?? this.type,
      currency ?? this.currency,
    );
  }
}
