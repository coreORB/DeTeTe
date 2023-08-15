import 'package:detete/utils.dart';
import 'package:test/test.dart';

void main() {
  for (var data in [
    ('ATestAVarA', Case.pascal, 'ATestAVarA'),
    ('ATestAVarA', Case.camel, 'aTestAVarA'),
    ('ATestAVarA', Case.kebab, 'a-test-a-var-a'),
    ('ATestAVarA', Case.snake, 'a_test_a_var_a'),
    ('ATestAVarA', Case.upperSnake, 'A_TEST_A_VAR_A'),
    ('aTestAVarA', Case.pascal, 'ATestAVarA'),
    ('aTestAVarA', Case.camel, 'aTestAVarA'),
    ('aTestAVarA', Case.kebab, 'a-test-a-var-a'),
    ('aTestAVarA', Case.snake, 'a_test_a_var_a'),
    ('aTestAVarA', Case.upperSnake, 'A_TEST_A_VAR_A'),
    ('a-test-a-var-a', Case.pascal, 'ATestAVarA'),
    ('a-test-a-var-a', Case.camel, 'aTestAVarA'),
    ('a-test-a-var-a', Case.kebab, 'a-test-a-var-a'),
    ('a-test-a-var-a', Case.snake, 'a_test_a_var_a'),
    ('a-test-a-var-a', Case.upperSnake, 'A_TEST_A_VAR_A'),
    ('a_test_a_var_a', Case.pascal, 'ATestAVarA'),
    ('a_test_a_var_a', Case.camel, 'aTestAVarA'),
    ('a_test_a_var_a', Case.kebab, 'a-test-a-var-a'),
    ('a_test_a_var_a', Case.snake, 'a_test_a_var_a'),
    ('a_test_a_var_a', Case.upperSnake, 'A_TEST_A_VAR_A'),
    ('A_TEST_A_VAR_A', Case.pascal, 'ATestAVarA'),
    ('A_TEST_A_VAR_A', Case.camel, 'aTestAVarA'),
    ('A_TEST_A_VAR_A', Case.kebab, 'a-test-a-var-a'),
    ('A_TEST_A_VAR_A', Case.snake, 'a_test_a_var_a'),
    ('A_TEST_A_VAR_A', Case.upperSnake, 'A_TEST_A_VAR_A'),
  ]) {
    test('toCase() should change case: $data', () {
      expect(data.$1.toCase(data.$2), data.$3);
    });
  }

  for (var data in [
    '_test',
    'tw_',
    '-ta',
    'ta-',
    'DF_db',
    'camelVar-mixed',
    'kebab--double-dash',
    'snake__double-underscore',
  ]) {
    test('toCase() should throw exception: $data', () {
      expect(() => data.toCase(Case.camel),
          throwsA(TypeMatcher<FormatException>()));
    });
  }
}
