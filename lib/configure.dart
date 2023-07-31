import 'dart:io';

enum Mode { inputs, outputs }

List<String> _inputPaths = [];
List<String> _outputPaths = [];
int _inputsPathsIndex = 0;
int _outputsPathsIndex = 0;

void configure(List<String> arguments) {
  try {
    parseArgs(arguments);
  } on ArgumentsExcetion catch (e) {
    print('ERROR: $e');
    exit(1);
  }
}

void parseArgs(List<String> arguments) {
  _inputPaths = [];
  _outputPaths = [];
  _inputsPathsIndex = 0;
  _outputsPathsIndex = 0;
  Mode? mode;
  for (final arg in arguments) {
    if (arg == '-i') {
      mode = Mode.inputs;
    } else if (arg == '-o') {
      mode = Mode.outputs;
    } else if (arg == '-h' || arg == '--help') {
      printHelp();
      exit(0);
    } else if (mode == null) {
      final msg = 'unknown argument \'$arg\'';
      print('ERROR: $msg');
      printHelp();
      throw ArgumentsExcetion(msg);
    } else {
      switch (mode) {
        case Mode.inputs:
          _inputPaths.add(arg);
          break;
        case Mode.outputs:
          _outputPaths.add(arg);
          break;
      }
    }
  }
}

String getInputPathFromArgs(String filepath, bool skipCliArgs) {
  if (skipCliArgs) {
    return filepath;
  } else if (_inputsPathsIndex < _inputPaths.length) {
    final inputPath = _inputPaths[_inputsPathsIndex];
    _inputsPathsIndex++;
    return inputPath;
  } else if (_inputPaths.isNotEmpty || _outputPaths.isNotEmpty) {
    throw ArgumentsExcetion('Too few input paths provided');
  } else {
    return filepath;
  }
}

String getOutputPathFromArgs(String filepath, bool skipCliArgs) {
  if (skipCliArgs) {
    return filepath;
  } else if (_outputsPathsIndex < _outputPaths.length) {
    final outputPath = _outputPaths[_outputsPathsIndex];
    _outputsPathsIndex++;
    return outputPath;
  } else if (_inputPaths.isNotEmpty || _outputPaths.isNotEmpty) {
    throw ArgumentsExcetion('Too few output paths provided');
  } else {
    return filepath;
  }
}

void printHelp() {
  print('usage: script_name [-i input_filepaths] [-o output_filepaths]');
}

class ArgumentsExcetion implements Exception {
  final String message;

  ArgumentsExcetion(this.message);

  @override
  String toString() {
    return message;
  }
}
