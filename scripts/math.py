#!/usr/bin/python

def python_is_slow_at_iteration(number):
    counter = 0
    while True:
        if number % 2 == 0:
            number = number / 2
            counter += 1
            if number == 1:
                return counter
        else:
            number = number * 3 + 1
            counter += 1
            if number == 1:
                return counter


def collecting_result():
    biggest = 0
    start_point = 0
    for number in range(1, 99999):
        print(f"Counting number: {number}")
        counter = python_is_slow_at_iteration(number)
        print(f"Reached 1 after {counter} iterations\n")
        if counter > biggest:
            biggest = counter
            start_point = number
    return dict(first_number=start_point, chain_lengh=biggest)


print(collecting_result())
