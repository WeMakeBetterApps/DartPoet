part of dart_poet;

class FunctionSpec implements WritesCode {
  final DartType returnType;
  final CodeBlock code;

  FunctionSpec._(this.returnType, this.code);

  @override
  void _write(_CodeWriter writer) {
    // TODO: implement _write
  }
}

class FunctionSpecBuilder {
  final CodeBlockBuilder _code = new CodeBlockBuilder();
  final List<ParameterSpec> _parameters = [];

  DartType returnType;


  /// The control flow construct and its code, such as "if (foo == 5)".
  /// Shouldn't contain braces or newline characters.
  void beginControlFlow(String controlFlow, [List<Object> args]) {
    _code.beginControlFlow(controlFlow, args);
  }

  /// The control flow construct and its code, such as "else if (foo == 10)".
  /// Shouldn't contain braces or newline characters.
  void nextControlFlow(String controlFlow, [List<Object> args]) {
    _code.nextControlFlow(controlFlow, args);
  }

  /// Ends a control flow. [controlFlow] is an optional parameter, such as
  /// "while(foo == 20)" that would only be used for "do/while" control flows.
  void endControlFlow([String controlFlow, List<Object> args]) {
    _code.endControlFlow(controlFlow, args);
  }

  void addStatement(String format, [List<Object> args]) {
    _code.add(format, args);
  }

  void addDocumentation(String documentation) {
    _code.addDocumentation(documentation);
  }

  void addCodeBlock(CodeBlockBuilder codeBlock) {
    _code.addCodeBlock(codeBlock);
  }

  void indent() {
    _code.indent();
  }

  void unindent() {
    _code.unindent();
  }

  FunctionSpec build() {
    return new FunctionSpec._(returnType, _code.build());
  }
}
