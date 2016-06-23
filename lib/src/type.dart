part of dart_poet;

class DartType {
  final String _typeName;

  DartType(this._typeName) {
    if (_typeName == null || _typeName.isEmpty) {
      throw new StateError("Invalid dart type: '$_typeName'");
    }
  }

  @override
  String toString() {
    return _typeName;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is DartType &&
        this._typeName == other._typeName;
  }

  @override
  int get hashCode {
    return _typeName.hashCode;
  }
}