import 'dart:io';
import 'dart:typed_data';

extension OutputTextFile on String {
  void toOutputTextFile({String filepath = "outputs/output.txt"}) {
    File(filepath).writeAsStringSync(this);
  }
}

extension OutputTextFileLines on List<String> {
  void toOutputTextFile({String filepath = "outputs/output.txt"}) {
    File(filepath).writeAsStringSync(join("\n"));
  }
}

extension OutputBytesFile on Uint8List {
  void toOutputTextFile({String filepath = "outputs/output.txt"}) {
    File(filepath).writeAsBytesSync(this);
  }
}
