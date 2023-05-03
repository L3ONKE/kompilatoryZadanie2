import re


def power(content):
    pattern = "^0*10*$"
    if re.search(pattern, content):
        print(content + " TO JEST potega 2 w zapisie binarnym")
    else:
        print(content + " TO NIE JEST potega 2 zapisie binarnym")


power('0011')
power('0001')
