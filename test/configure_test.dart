import 'package:detete/configure.dart';
import 'package:test/test.dart';

var log = [];

void main() {
  test('should throw exception on unknown argument', () {
    expect(
      () => parseArgs([
        "invalid_arg",
      ]),
      throwsA(isA<ArgumentsExcetion>().having(
        (e) => e.message,
        'message',
        'unknown argument \'invalid_arg\'',
      )),
    );
  });

  test('should return given filepaths when no args provided', () {
    expect(getInputPathFromArgs("input1.txt", false), "input1.txt");
    expect(getInputPathFromArgs("input2.txt", false), "input2.txt");
    expect(getInputPathFromArgs("input3.txt", false), "input3.txt");
    expect(getInputPathFromArgs("output1.txt", false), "output1.txt");
    expect(getInputPathFromArgs("output2.txt", false), "output2.txt");
    expect(getInputPathFromArgs("output3.txt", false), "output3.txt");
  });

  test('should return given args filepaths when args provided', () {
    parseArgs([
      "-i",
      "arg_input1.txt",
      "arg_input2.txt",
      "arg_input3.txt",
      "-o",
      "arg_output1.txt",
      "arg_output2.txt",
      "arg_output3.txt",
    ]);

    expect(getInputPathFromArgs("input1.txt", false), "arg_input1.txt");
    expect(getInputPathFromArgs("input2.txt", false), "arg_input2.txt");
    expect(getInputPathFromArgs("input3.txt", false), "arg_input3.txt");
    expect(getOutputPathFromArgs("output1.txt", false), "arg_output1.txt");
    expect(getOutputPathFromArgs("output2.txt", false), "arg_output2.txt");
    expect(getOutputPathFromArgs("output3.txt", false), "arg_output3.txt");
  });

  test('should skip excess in given args filepaths when args provided', () {
    parseArgs([
      "-i",
      "arg_input1.txt",
      "arg_input2.txt",
      "arg_input3.txt",
      "-o",
      "arg_output1.txt",
      "arg_output2.txt",
      "arg_output3.txt",
    ]);

    expect(getInputPathFromArgs("input1.txt", false), "arg_input1.txt");
    expect(getInputPathFromArgs("input2.txt", false), "arg_input2.txt");
    expect(getOutputPathFromArgs("output1.txt", false), "arg_output1.txt");
    expect(getOutputPathFromArgs("output2.txt", false), "arg_output2.txt");
  });

  test('should respect skipCliArgs', () {
    parseArgs([
      "-i",
      "arg_input1.txt",
      "arg_input2.txt",
      "arg_input3.txt",
      "-o",
      "arg_output1.txt",
      "arg_output2.txt",
    ]);

    expect(getInputPathFromArgs("input1.txt", false), "arg_input1.txt");
    expect(getInputPathFromArgs("input2.txt", true), "input2.txt");
    expect(getInputPathFromArgs("input3.txt", false), "arg_input2.txt");
    expect(getOutputPathFromArgs("output1.txt", false), "arg_output1.txt");
    expect(getOutputPathFromArgs("output2.txt", false), "arg_output2.txt");
    expect(getOutputPathFromArgs("output3.txt", true), "output3.txt");
  });

  test('should throw exception on too few filepaths provided', () {
    parseArgs([
      "-i",
      "arg_input1.txt",
      "-o",
      "arg_output1.txt",
    ]);

    expect(getInputPathFromArgs("input1.txt", false), "arg_input1.txt");
    expect(
      () => getInputPathFromArgs("input2.txt", false),
      throwsA(isA<ArgumentsExcetion>().having(
        (e) => e.message,
        'message',
        'Too few input paths provided',
      )),
    );
    expect(getOutputPathFromArgs("output1.txt", false), "arg_output1.txt");
    expect(
      () => getOutputPathFromArgs("output2.txt", false),
      throwsA(isA<ArgumentsExcetion>().having(
        (e) => e.message,
        'message',
        'Too few output paths provided',
      )),
    );
  });
}
