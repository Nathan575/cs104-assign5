#!/usr/bin/env bash

# (The absolute path to the program is provided as the first and only argument.)
CALCULATOR=$1

echo "We've set up a GitHub Actions Workflow that will run all"
echo "of the shell scripts in this directory as a series of tests."
echo
echo "To fail any test, you should use the exit 1 command;"
echo "To end a test early as a success, you should use the exit 0 command."

echo "Invoke your program with the \$CALCULATOR variable; an example is below"


# Test 01: Ensure the program runs without error with a simple, valid invocation.
if ! $CALCULATOR 1 + 1; then  # If the return code of $PROGRAM is non-zero (i.e. error)...
  echo 'ERROR! A valid run of the calculator (1 + 1) failed!'
  exit 1
fi

# Test 02: Ensure simple case has correct output...
if [[ $($CALCULATOR 1 + 1) -ne 2 ]]; then  # If the output of the program is not 2...
  echo 'ERROR! A valid run of the calculator (1 + 1) failed to produce 2 as an output!'
  exit 1
fi

# Test 03: Ensure program errors with an invalid operand
if $CALCULATOR 3 @ 2; then  # If the return code of $PROGRAM is zero (i.e. success)...
  echo 'ERROR! An invalid run of the application (3 @ 2) apparently succeeded?!'
  exit 1
fi




# Test 04: Ensure negative addition has correct output...
if [[ $($CALCULATOR 10 + -5) -ne 5 ]]; then  # If the output of the program is not 5...
  echo 'ERROR! A valid run of the calculator (10 + -5) failed to produce 5 as an output!'
  exit 1
fi

# Test 05: Ensure subtraction works correctly...
if [[ $($CALCULATOR 10 - 5) -ne 5 ]]; then  # If the output of the program is not 5...
  echo 'ERROR! A valid run of the calculator (10 - 5) failed to produce 5 as an output!'
  exit 1
fi

# Test 06: Ensure multiplication works correctly...
if [[ $($CALCULATOR 4 * 5) -ne 20 ]]; then  # If the output of the program is not 20...
  echo 'ERROR! A valid run of the calculator (4 * 5) failed to produce 20 as an output!'
  exit 1
fi

# Test 07: Ensure division works correctly...
if [[ $($CALCULATOR 10 / 2) -ne 5 ]]; then  # If the output of the program is not 5...
  echo 'ERROR! A valid run of the calculator (10 / 2) failed to produce 5 as an output!'
  exit 1
fi

# Test 08: Ensure division by zero results in an error...
if $($CALCULATOR 10 / 0); then  # If the return code of $PROGRAM is zero (i.e. success)...
  echo 'ERROR! Division by zero (10 / 0) did not fail as expected!'
  exit 1
fi

# Test 09: Ensure the program works with quiet mode (-q flag)
if [[ $($CALCULATOR -q 1 + 1) -ne 2 ]]; then  # If the output of the program is not 2...
  echo 'ERROR! A valid run of the calculator in quiet mode (1 + 1) failed to produce 2 as an output!'
  exit 1
fi

# Test 10: Ensure program handles multiple operations correctly (Chained operations)
if [[ $($CALCULATOR 2 + 3) -ne 5 ]]; then  # If the output of the program is not 5...
  echo 'ERROR! A valid run of the calculator (2 + 3) failed to produce 5 as an output!'
  exit 1
fi
if [[ $($CALCULATOR 5 * 2) -ne 10 ]]; then  # If the output of the program is not 10...
  echo 'ERROR! A valid run of the calculator (5 * 2) failed to produce 10 as an output!'
  exit 1
fi

# Test 11: Ensure negative subtraction has correct output...
if [[ $($CALCULATOR 5 - 10) -ne -5 ]]; then  # If the output of the program is not -5...
  echo 'ERROR! A valid run of the calculator (5 - 10) failed to produce -5 as an output!'
  exit 1
fi