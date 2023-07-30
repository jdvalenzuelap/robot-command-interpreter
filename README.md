# Robot Command Interpreter

The Robot Command Interpreter is a simple program that translates human-friendly command-line inputs into commands that a robot can understand. 

The program interprets commands such as `"Robot please move 3 spaces ahead and then kindly turn 90 degrees"`. This command would be interpreted by the program as `"MOVE,3"` and `"TURN,90"`.

The project uses Lex and Yacc, tools for generating scanners and parsers respectively. The scanner is specified in `robot.l` and the parser in `robot.y`. 

## Features

- Translates commands to move a specific number of blocks, spaces, or positions ahead.
- Translates commands to turn a specific number of degrees.

## Grammar rules

1. **Kind Address**: Each command must **start or end** with a kind word like "please" or "kindly".

2. **Robot Call**: You must address the robot by its name, "Robot", at the **beginning of the file**. You can also do it at the beginning of each command, but it is not necessary.

3. **Move Commands**: To instruct the robot to move, use terms like `move`, `go`, or `advance`. These should be followed by a number representing the number of blocks, spaces, or positions to move ahead.

4. **Turn Commands**: To instruct the robot to turn, use the term `turn` followed by a number in degrees. Only the numbers 90, 180, 270, and 360 are accepted.

5. **And Then**: Commands can be chained together using the phrase `and then` or `, then`. Using line jumps is also considered as `and then`.

6. **Whitespace Ignored**: Spaces and tabs are ignored, so you can format your commands for readability.

7. **Unrecognized Words Ignored**: The parser will ignore any unrecognized words, allowing for some flexibility in command phrasing.

8. **End Command**: At the end of each command, you must specify the type of move, such as `blocks ahead`, `spaces ahead`, or `positions ahead` for move commands, and `degrees` for turn commands.

Remember, the system is case-sensitive, so all commands should be written in lower-case, except for the Robot's name (he can get mad).

## How to Use

First, clone the repository and navigate into the project directory:

```bash
git clone https://github.com/your_username/robot-command-interpreter.git
cd robot-command-interpreter
```

To build the project, use the provided Makefile:

```bash
make all
```

This will generate the robot executable.

To run the program with a specific input file, use:

```bash
./robot path_to_your_input_file
```

Example:

```bash
./robot success_input.txt
```

This will output the interpreted commands:
```bash
MOV,3
TURN,90
MOV,2
TURN,180
MOV,5
TURN,270
TURN,360
MOV,1
```

## Input File Format

The input file should contain commands for the robot. Each command should be on its own line. Here is an example of the format:

```bash
Robot please move 3 spaces ahead and then kindly turn 90 degrees
Robot go 2 blocks ahead please and then please turn 180 degrees
Robot kindly advance 5 positions ahead and then turn 270 degrees please
Robot please turn 360 degrees and then move 1 block ahead kindly
```

The program will interpret "move", "go", and "advance" as movement commands, and "turn" as rotation commands.

## Cleanup

To clean up the generated files, you can use the provided Makefile:

```bash
make clean
```

This will remove the robot executable and the lex.yy.c and y.tab.c files.

Enjoy!!!
