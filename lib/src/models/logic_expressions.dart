import 'dart:developer';

class LogicExpressions {
  LogicExpressions({required List<String> args}) : _args = args;
  final List<String> _args;

  String get calculate {
    try {
      var expression = _args[1];
      List<String> processArray = [];
      print(_args);

      for (int i = expression.length - 1; i >= 0; i--) {
        if (expression[i] == '(') {
          List<String> s = [];
          while (processArray.last != ')') {
            s.add(processArray.last);
            processArray.removeLast();
          }
          processArray.removeLast();

          if (s.length == 3) {
            processArray.add(s[2] == '1' ? '0' : '1');
          } else if (s.length == 5) {
            int a = s[0].codeUnitAt(0) - 48, b = s[4].codeUnitAt(0) - 48, c;
            if (s[2] == '&') {
              c = a & b;
            } else {
              c = a | b;
            }
            processArray.add(String.fromCharCode(c + 48));
          }
        } else {
          processArray.add(expression[i]);
        }
      }
      return processArray.last;
    } on Exception catch (e, s) {
      log(
        error: e,
        stackTrace: s,
        'Não foi possível realizar o calculo da expressão. Revise a sintaxe',
      );
      return 'Não foi possível realizar o calculo da expressão. Revise a sintaxe';
    }
  }
}
