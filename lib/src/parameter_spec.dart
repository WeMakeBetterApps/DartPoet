part of dart_poet;

class ParameterSpec implements WritesCode {
  final DartType type;
  final String name;
  final bool isFinal;
  final bool isPositional;
  final bool isOptional;
  final String defaultValue;

  ParameterSpec(this.type, this.name, {this.isFinal: false,
  this.isPositional: true, this.isOptional: false, this.defaultValue});

  @override
  void _write(_CodeWriter writer) {
    String write = '${isFinal ? 'final ' : ''}$type $name';

    if (defaultValue != null) {
      write += '${isPositional ? ' =' : ':'} $defaultValue';
    }

    writer.write(write);
  }
}

class ParameterSpecBuilder {
  DartType type;
  String name;
  bool isFinal;
  bool isPositional;
  bool isOptional;
  String defaultValue;

  ParameterSpecBuilder({this.type, this.name, this.isFinal: false,
  this.isPositional: true, this.isOptional: false, this.defaultValue});

  ParameterSpec build() {
    _checkNotNull(type, '');

    if (type == null)
      throw new StateError('Parameter type cannot be null.');
    if (name == null || name.isEmpty)
      throw new StateError('Parameter name cannot be null or empty.');
    if (!isPositional && !isOptional)
      throw new StateError('Parameters that are not positional must be optional.');
    if (defaultValue != null && !isOptional)
      throw new StateError('Parameter must be optional to have a default value.');

    return new ParameterSpec(type, name, isFinal: isFinal);
  }
}