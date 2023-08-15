# DeTeTe
Tool for quick data transforming.

It is pre-configured VS Code workspace with simple API for manipulating files. Any file located in _bin_ directory is executed upon saving for very quick iterating. 

## Setup
1. Download ZIP of this repository or fork it and clone.
2. open _DeTeTe.code-workspace in VS Code (File -> Open Workspace from File...)
3. VS Code will ask if you trust the authors of the files in this folder, you can anser 'no', review code and disable restricted mode later. If you choose 'yes', VS Code will install 3 extensions (dart, file watcher and vs code runner) and enable running dart files in _bin_ directory when the file is saved.
4. Run `dart pub get` in VS Code terminal do download dependencies.

## Usage basics
You can write single use scripts in _bin/scratchpad.dart_. If you wish to keep script for longer, you can duplicate file _bin/template.dart_ and name it appropriately.  
Your code goes into `transform()` method. Three things are required:
1. Read input(s)  
  `var content = input.readAsString(filepath: "inputs/input1.txt");`
2. Modify data  
  `content = content.replaceAll("foo", "bar");`
3. Write output(s)  
  `output.writeAsString(content, filepath: "outputs/output1.txt");`


API supports chain calls to allow writing short code:
```dart
input
    .readAsString(filepath: "inputs/input1.txt")
    .replaceAll("foo", "bar")
    .writeAsString(filepath: "outputs/output1.txt");
```
Complete example and more here: [EXAMPLES](docs/EXAMPLES.md)

## Running your script from command line
Your script can be run from command line providing alternative paths for inputs and outputs. For clarity input path and output path lists are separated.  
`dart run bin/scratchpad.dart -i inputs/arg1.txt inputs/arg2.txt -o outputs/arg1.txt`  
This will map provided paths to inputs/outputs in script in order of execution. For code:
```dart
  var content1 = input.readAsLines(filepath: "inputs/input1.txt");
  content1.sublist(0, 5).writeIterableAsString(filepath: "outputs/output1.txt");
  var content2 = input.readAsLines(filepath: "inputs/input2.txt");
  var outputContent1 = content1 + content2;
  output.writeIterableAsString(outputContent1,
      filepath: "outputs/output2.txt", skipInCliArgs: true);
```
Mapping will be as follows:
* `inputs/input1.txt` will be replaced with `inputs/arg1.txt`
* `outputs/output1.txt` will be replaced with `outputs/arg1.txt`
* `inputs/input2.txt` will be replaced with `inputs/arg2.txt`
* `outputs/output2.txt` will NOT be replaced, because `skipInCliArgs` parameter is used, which disables assigning new path from command line arguments  

> NOTE:
> Counts of paths provided in `-i` and `-o` arguments must be equal to inputs/outputs defined in code (minus those with `skipInCliArgs` set to `true`). Script will terminate if not enought path are provided. When too much paths are provided script will run normally.

## API 
API documentation can be found here: [API](docs/API.md)