part of dart_poet;

class CodeBlock {
  final List<String> _formatParts;
  final List<Object> _args;

  CodeBlock._(this._formatParts, this._args);

  void _write(_CodeWriter writer) {
    // TODO: implement _write
  }
}

class CodeBlockBuilder {
  final List<String> _formatParts = [];
  final List<Object> _args = [];

  /// The control flow construct and its code, such as "if (foo == 5)".
  /// Shouldn't contain braces or newline characters.
  void beginControlFlow(String controlFlow, [List<Object> args]) {
    add(controlFlow + " {\n", args);
    indent();
  }

  /// The control flow construct and its code, such as "else if (foo == 10)".
  /// Shouldn't contain braces or newline characters.
  void nextControlFlow(String controlFlow, [List<Object> args]) {
    unindent();
    add("} " + controlFlow + " {\n", args);
    indent();
  }

  /// Ends a control flow. [controlFlow] is an optional parameter, such as
  /// "while(foo == 20)" that would only be used for "do/while" control flows.
  void endControlFlow([String controlFlow, List<Object> args]) {
    unindent();
    add('}${controlFlow == null ? '' : ' $controlFlow;'}\n', args);
  }

  void addStatement(final String format, [List<Object> args]) {
    add(STATEMENT_START);
    add(format, args);
    add(";\n$STATEMENT_END");
  }

  void addDocumentation(String documentation) {
    add("// $documentation");
  }

  void addCodeBlock(CodeBlockBuilder codeBlock) {
    _formatParts.addAll(codeBlock._formatParts);
    _args.addAll(codeBlock._args);
  }

  add(String format, [List<Object> args]) {
    // TODO
  }

  void indent() {
    _formatParts.add(INDENT);
  }

  void unindent() {
    _formatParts.add(UNINDENT);
  }

  CodeBlock build() {
    return new CodeBlock._(_formatParts, _args);
  }
}