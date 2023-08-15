# API

## Input

### readAsString
```dart 
String readAsString({
  String filepath = "inputs/input.txt",
  bool skipInCliArgs = false,
  Encoding encoding = utf8,
})
```
Reads file at [filepath] as string using the given [Encoding].  
Set [skipInCliArgs] to _true_ to disallow changing [filepath] set in code
when script is run from command line.

Example:
```dart
String content = input.readAsString();
```

### readAsLines
```dart
List<String> readAsLines({
  String filepath = "inputs/input.txt",
  bool skipInCliArgs = false,
  Encoding encoding = utf8,
})
```
Reads file at [filepath] as list of lines using the given [Encoding].  
Set [skipInCliArgs] to _true_ to disallow changing [filepath] set in code
when script is run from command line.

Example:
```dart
List<String> content = input.readAsLines();
```

### readAsBytes
```dart
Uint8List readAsBytes({
  String filepath = "inputs/input.txt",
  bool skipInCliArgs = false,
}) {
```
Reads file at [filepath] as bytes.  
Set [skipInCliArgs] to _true_ to disallow changing [filepath] set in code
when script is run from command line.

Example:
```dart
Uint8List content = input.readAsBytes();
```

## Output

### writeAsString
```dart
void writeAsString(
  String content, {
  String filepath = "outputs/output.txt",
  bool skipInCliArgs = false,
  Encoding encoding = utf8,
})
```
Writes file at [filepath] with [content] as text using the given [Encoding].  
Set [skipInCliArgs] to _true_ to disallow changing [filepath] set in code
when script is run from command line.

Example:
```dart
output.writeAsString('foo');
```

#### Extension method
```dart
void String.writeAsString({
    String filepath = "outputs/output.txt",
    bool skipInCliArgs = false,
    Encoding encoding = utf8,
  })
```
Example:
```dart
'foo'.writeAsString();
```

### writeIterableAsString
```dart
void writeIterableAsString<T>(
  Iterable<T> content, {
  String filepath = "outputs/output.txt",
  bool skipInCliArgs = false,
  Encoding encoding = utf8,
  String separator = "\n",
})
```
Writes file at [filepath] with [this] joined to text using [separator]
and using the given [Encoding].  
Set [skipInCliArgs] to _true_ to disallow changing [filepath] set in code
when script is run from command line.
 
Example:
```dart
output.writeIterableAsString(['foo', 'bar']);
```

#### Extension method
```dart
void Iterable<T>.writeIterableAsString({
  String filepath = "outputs/output.txt",
  bool skipInCliArgs = false,
  Encoding encoding = utf8,
  String separator = "\n",
})
```
Example:
```dart
['foo', 'bar'].writeIterableAsString();
```

### writeAsBytes
```dart
void writeAsBytes(
  Uint8List content, {
  String filepath = "outputs/output.txt",
  bool skipInCliArgs = false,
})
```
Writes file at [filepath] with [content] as bytes.  
Set [skipInCliArgs] to _true_ to disallow changing [filepath] set in code
when script is run from command line.

Example:

```dart
output.writeAsBytes(Uint8List.fromList([2, 5]));
```

#### Extension method
```dart
void Uint8List.writeAsBytes({
  String filepath = "outputs/output.txt",
  bool skipInCliArgs = false,
})
```
Example:
```dart
Uint8List.fromList([2, 5]).writeAsBytes();
```

## Utils

### matchesAll
```dart
Iterable<RegExpMatch> String.matchesAll(RegExp regex, [int start = 0]) {
```
It's just [RegExp.allMatches()] reverted.

Example:
```dart
RegExp exp = RegExp(r'(\w+)');
var str = 'Dash is a bird';
Iterable<Match> matches = str.matchesAll(exp, 8);
for (final Match m in matches) {
  String match = m[0]!;
  print(match);
}
```
The output of the example is:  
a  
bird  

Copied from RegExp.

### matchesFirst
```dart
RegExpMatch? String.matchesFirst(RegExp regex) {
```
It's just [RegExp.firstMatch()] reverted.
  ///
Example:
```dart
final string = '[00:13.37] This is a chat message.';
final regExp = RegExp(r'c\w*');
final match = string.matchesFirst(regExp)!;
print(match[0]); // chat
```
Copied from RegExp.

### toCase
```dart
String String.toCase(Case toCase)
```
Convert from one developer case to provided case [toCase].

Throws [FormatException] when input string is not a supported case.  
Supported cases:
* camelCase
* PascalCase
* kebab-case
* snake_case
* UPPER_CASE_SNAKE_CASE

Example:
```dart
'my-var'.toCase(Case.camel); //myVar
```