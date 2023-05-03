import re


def power(content):
    pattern = "^0*10*$"
    if re.search(pattern, content):
        print(content + " TO JEST potega 2 w zapisie binarnym")
    else:
        print(content + " TO NIE JEST potega 2 zapisie binarnym")


def adress_ip(content):
    ipv4 = "^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$"
    if re.search(ipv4, content):
        print(content + " TO JEST adres IPv4")
    else:
        print(content + " TO NIE JEST adres IPv4")


power('0011')
power('0001')
adress_ip("300.300.200.100")
adress_ip("12.54.255.254")
