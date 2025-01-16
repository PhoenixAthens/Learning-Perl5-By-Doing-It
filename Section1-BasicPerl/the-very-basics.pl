#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
sub definingVariables {
    my $name = 'Somebody';
    my $age = 30;
    my $employee_salary = 330000.458;
    print("Name: $name\nAge: $age\nSalary: $employee_salary\n");
}
definingVariables();
    # Name: Somebody
    # Age: 30
    # Salary: 330000.458


sub definingArrays() {
    my @names = ("James","kaley","juno");
    print(
        "\$names[0]: $names[0]\n",
        "\$names[1]: $names[1]\n",
        "\$names[2]: $names[2]\n"
    );

    my @ages = (30, 40, 50);
    print(
        "\$ages[0]: $ages[0]\n",
        "\$ages[1]: $ages[1]\n",
        "\$ages[2]: $ages[2]\n"
    );

    my @mixed = ("James", 30, 40.5);
    print(
        "\$mixed[0]: $mixed[0]\n",
        "\$mixed[1]: $mixed[1]\n",
        "\$mixed[2]: $mixed[2]\n"
    );
}
definingArrays();
    # $names[0]: James
    # $names[1]: kaley
    # $names[2]: juno

    # $ages[0]: 30
    # $ages[1]: 40
    # $ages[2]: 50

    # $mixed[0]: James
    # $mixed[1]: 30
    # $mixed[2]: 40.5

sub definingHashes(){
    my %class = (
        "AJ",1,
        "BJ",2,
        "CJ",3,
        "DJ",4
    );
    print("Printing the pairs!\n");
    print("Name: \${'AJ'}, RN: $class{'AJ'}\n");
    print("Name: \${'BJ'}, RN: $class{'BJ'}\n");
    print("Name: \${'CJ'}, RN: $class{'CJ'}\n");
    print("Name: \${'DJ'}, RN: $class{'DJ'}\n");
}
definingHashes();
# Printing the pairs!
# Name: ${'AJ'}, RN: 1
# Name: ${'BJ'}, RN: 2
# Name: ${'CJ'}, RN: 3
# Name: ${'DJ'}, RN: 4
