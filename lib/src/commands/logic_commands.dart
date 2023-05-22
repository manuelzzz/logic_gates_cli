import 'dart:async';

import 'package:args/command_runner.dart';
import 'package:logic_gates_cli/src/models/logic_expressions.dart';

class LogicCommands extends Command {
  final List<String> _arguments;

  @override
  String get description => 'Calculates the expression';

  @override
  String get name => 'calculate';

  LogicCommands(List<String> args) : _arguments = args;

  @override
  FutureOr? run() {
    print(LogicExpressions(args: _arguments).calculate);
  }
}
