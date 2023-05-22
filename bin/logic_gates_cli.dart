import 'package:args/command_runner.dart';
import 'package:logic_gates_cli/src/commands/logic_commands.dart';

void main(List<String> arguments) {
  CommandRunner('Logic Gates CLI', 'Logic expressions calcs in CLI')
    ..addCommand(LogicCommands(arguments))
    ..run(arguments);
}
