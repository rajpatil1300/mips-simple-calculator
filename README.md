# Simple MIPS Calculator

This project is a **command‑line calculator** written in MIPS assembly. It lets you repeatedly add, subtract, multiply, or divide two integers until you type **`q`** to quit.

---

## How it works (short version)

1. **Ask for an operation** – the program prints `Enter operation :` and waits for one character.

   * `+` → addition
   * `-` → subtraction
   * `*` → multiplication
   * `/` → integer division
   * `q` → quit the program
2. **Ask for two numbers** – after you choose an operator (except `q`), it asks for the first and second integer.
3. **Show the result** – the answer is printed, followed by a blank line.
4. **Repeat** – it jumps back to step 1 so you can keep calculating.

---

## What each part of the code does (friendly tour)

| Label / Section     | Job in plain English                                                                                               |
| ------------------- | ------------------------------------------------------------------------------------------------------------------ |
| `.data`             | Stores message strings that will be printed.                                                                       |
| `while:`            | The start of the main loop. Everything returns here after each calculation.                                        |
| **Operator input**  | Prints the prompt, reads one character into `$t2`, and checks if it is `q` (ASCII 113).                            |
| **Number input**    | Prints *first number* prompt → reads integer into `$t0`; prints *second number* prompt → reads integer into `$t1`. |
| **Operator check**  | Compares `$t2` with ASCII codes of `+`, `-`, `*`, `/` and jumps to `ADD`, `SUB`, `MUL`, or `DIV`.                  |
| **ADD / SUB / MUL** | Performs the arithmetic and jumps to `PRINT_RESULT`.                                                               |
| **DIV**             | Guards against division by zero. If divisor is zero, exits; else divides and jumps to `PRINT_RESULT`.              |
| **PRINT\_RESULT**   | Prints the answer in `$s0`, prints a newline, then jumps back to `while`.                                          |
| **EXIT**            | Ends the program with syscall service 10.                                                                          |

---

## Running the program in MARS

1. **Open [MARS](http://courses.missouristate.edu/KenVollmar/mars/).**
2. Load `calculator.asm`.
3. Click **Assemble**.
4. Click **Run**.
5. Use the console, e.g.:

```
Enter operation : +
Enter first Number: 7
Enter second Number: 5
12

Enter operation : q
```

> Press `q` at the operation prompt to exit.
