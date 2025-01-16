# Understanding the Nitty-Gritty Details!
> I've already mentioned a lot of this in the code-comments, but still.
>
> If you happen to be reading this and have any questions, feel free to create an `issue` and ask right away. You can also contact me via the other social handles mentioned on my profile.

**Context:[`finding-text-in-file.pl`](https://github.com/PhoenixAthens/Learning-Perl5-By-Doing-It/blob/master/Section1-BasicPerl/finding-text-in-file.pl)**<br>
Q1: How does this statement work in Perl? `open(INPUT,$fileName) or die("$fileName not found");`

A: It’s utilizing **short-circuit logic**! If the `open()` function is able to open the file successfully, the expression on the left-hand side (LHS) of `or` returns `TRUE`, and the expression on the right-hand side (RHS) is not executed. Thus, the `die` subroutine is never called.

However, if the `open` function is unable to open the file for whatever reason, the expression on the LHS of `or` returns `FALSE`, and the expression is not short-circuited. This results in the `die` subroutine being executed, which terminates our program before any harm can be done.

---
**Context:[`finding-text-in-file.pl`](https://github.com/PhoenixAthens/Learning-Perl5-By-Doing-It/blob/master/Section1-BasicPerl/finding-text-in-file.pl)**<br>
Q2: What is the meaning of `<INPUT>` in the while-loop?
How does it work?

A: Well, I did some research (AMZN Q 😅), so it goes something like this:<br>
- The `<INPUT>` construct is a file input operator that reads a single line from the file associated with the `INPUT` file-handle.
- Each time the loop iterates, the next line from the file is read and stored in the variable on the LHS of `=` sign.
- The loop continues until the end of the file is reached, at which point `<INPUT>` will return `undef`, causing the loop to exit.
> FYI: the `<input>` construct will read the `\n` at the end of each line as well, so no need to add `\n` at the end of `print` message string.

**Context:[`finding-text-in-file.pl`](https://github.com/PhoenixAthens/Learning-Perl5-By-Doing-It/blob/master/Section1-BasicPerl/finding-text-in-file.pl)**<br>
Q3: How does this expression `$cl =~ / help /` in the while-loop work?

A: Well, glad you asked.
This is how we check each line to see if there is a match for word `help` in it.
The `/ help /` is a very basic regular-expression. 
You can read the expression `if($cl =~ / help /)` as,
check if the line contained in `$cl` has a value that can be captured by the regular expression `/ help /`.
You can adjust this regular expression like so `/help/`,
to not only match the word `help` but words such as `helpless`, `helping`, etc. as well,
that contain the letters `'h' 'e' 'l' 'p'` in order.

---
**Context:[`writing-to-output-and-replacing-text.pl`](https://github.com/PhoenixAthens/Learning-Perl5-By-Doing-It/blob/master/Section1-BasicPerl/writing-to-output-and-replacing-text.pl)**<br>
Q4: What's the purpose of `$|=1` at `ln4`?

A: Perl buffers the output on `Unix`-based systems. To disable output-buffering we put `$|=1` at the start of our perl script.

**Context:[`writing-to-output-and-replacing-text.pl`](https://github.com/PhoenixAthens/Learning-Perl5-By-Doing-It/blob/master/Section1-BasicPerl/writing-to-output-and-replacing-text.pl)**<br>
Q5: What is the purpose of `'>'.$outputFile` in statement `open(OUTPUT,'>'.$outputFile) or die("$outputFile couldn't be created!\n");`?

A: `'>'.$outputFile` is how we concatenate strings in Perl. Like in `Java`, we use the `+` operator to concatenate two strings, in `Perl`, we use the `.` operator to concatenate strings, here them strings being the path to output file `$outputFile` and `>`. The purpose of doing this concatenation is in regard to how we create files in Perl. To create a file in perl, one must append `'>'` to the beginning of the path to the file. We could've also added `>` to the path like so
`my $outputFile = '>./Resources/output.txt';`, but that would've looked even more ambiguous, thus we went with the convention applied here.

**Context:[`writing-to-output-and-replacing-text.pl`](https://github.com/PhoenixAthens/Learning-Perl5-By-Doing-It/blob/master/Section1-BasicPerl/writing-to-output-and-replacing-text.pl)**<br>
Q6: How are you with the new regExp in this expression `$currLine =~ /\begg\b/`?

A: Well, `\b` defines the bounday for our capture-string, with `\b` we are telling the regExp engine how the boundary for the capture group is to be defined, surrounded by `\b` means that our string can be surrounded by a space, hyphen, full-stop, etc., but not by other letters.

**Context:[`writing-to-output-and-replacing-text.pl`](https://github.com/PhoenixAthens/Learning-Perl5-By-Doing-It/blob/master/Section1-BasicPerl/writing-to-output-and-replacing-text.pl)**<br>
Q6: What is up with this statement `$currLine =~ s/hen/DOG/ig;`>

A: This statement looks for lines with values that can be captured by `/hen/` and replaces them with `/DOG/` the purpose of `s/` before the first forward-slash is to say that we want to replace values from first capture group with `DOG`, the `i`, and `g` are flags, with `i` standing for `case-insensitive` (thus `hen` ,`HeN`, `HEn`, `HEN`, etc. will all open for capture) and `g` standing for `global` (meaning, replace all occurrences of `hen` with `DOG`, and not just the first one.) 

**Context:[`writing-to-output-and-replacing-text.pl`](https://github.com/PhoenixAthens/Learning-Perl5-By-Doing-It/blob/master/Section1-BasicPerl/writing-to-output-and-replacing-text.pl)**<br>
Q7: What's the meaning of this new `print` statement `print OUTPUT $currLine;`

A: I get it! It does look like a `syscall` but it's just saying "print to the file held by handler `OUTPUT` the string stored in variable `$currLine`".

----
Q8: How do you install an external Perl package, what's `cpan`?

A: To install external Perl packages, you can use the CPAN (Comprehensive Perl Archive Network) client, which is a command-line tool that comes bundled with Perl installation. CPAN is a vast repository of Perl modules and libraries contributed by the Perl community.

Here is how you can install an external Perl package using CPAN:
1. Open terminal or command-prompt;
2. Run the following command to start the CPAN shell:
```shell
perl -MCPAN -e shell
```
3. If this is your first time using CPAN, it will ask you a few configuration questions. You can accept the default options by pressing Enter.
4. Once the CPAN shell is loaded, you can search for the package you want to install. For example, to search for the "LWP::UserAgent" package, you can use the following command:
```shell
cpan> install LWP::UserAgent
```
5. CPAN will search for the package and its dependencies. If found, it will prompt you to confirm the installation. Type "yes" and press Enter to proceed.
6. CPAN will download the package and its dependencies, compile them, and install them on your system.
7. After the installation is complete, you can exit the CPAN shell by typing:
```shell
cpan> quit
```
Alternatively, you can install packages without entering the CPAN shell by using the `cpanm` command (which stands for "cpan minus"). This is a script that comes bundled with modern Perl distributions and provides a more user-friendly interface for installing packages. To install a package using `cpanm`, simply run:
```shell
cpanm LWP::UserAgent
```
This command will automatically install the package and its dependencies.

It is worth noting that you might need to have administrative privileges (run the commands with `sudo` on Unix-like systems) to install packages system-wide. If you do not have administrative privileges, you can install packages locally for your user account by configuring CPAN to use a local directory.

In summary, CPAN is the `Comprehensive Perl Archive Network`, a repository of Perl modules and libraries. You can use the `cpan` command-line tool or the `cpanm` script to search for and install external Perl packages from CPAN.

---
**Context:[`downloadHTML.pl`](https://github.com/PhoenixAthens/Learning-Perl5-By-Doing-It/blob/master/Section1-BasicPerl/downloadHTML.pl)**<br>

Q9: Can you explain the following program line by line
```perl5
#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use LWP::UserAgent;
use IO::Socket::SSL;

my $ua = LWP::UserAgent->new(cookie_jar=>{});
$ua->ssl_opts(
    'SSL_verify_mode' => $IO::Socket::SSL::SSL_VERIFY_NONE,
    'verify_hostname'=>0
);
my $request = HTTP::Request->new('GET', 'https://caveofpython.com');

my $response = $ua->request($request);

unless($response ->is_success()){
    die $response -> status_line();
}
my $content = $response -> decoded_content();
print($content);
print("completed");
```
A:
This Perl script is designed to download the HTML content of the website `https://caveofpython.com` using the LWP
(Library for WWW in Perl) module.
Here's a line-by-line explanation:
```shell
#!/usr/bin/perl
```
This line is called the "shebang" line,
and it tells the operating system which interpreter to use to execute the script.
In this case, it specifies that the script should be executed using the Perl interpreter.
```perl5
use strict;
use warnings FATAL => 'all';
```
These lines enable script mode and turn on all warnings, which helps catch potential errors and enforce good coding practices.
```perl5
use LWP::UserAgent;
use IO::Socket::SSL;
```
These lines import the necessary Perl modules for making HTTP requests (LWP::UserAgent) and handling the SSL/TLS connections (IO::Socket::SSL).
```perl5
my $ua = LWP::UserAgent->new(cookie_jar=>{});
```
This line creates a new instance of the `LWP::UserAgent` object, which is used to make HTTP requests. The `cookie_jar=>{}` option tells the user agent to store and send cookies with the requests.
```perl5
$ua -> ssl_opts(
    'SSL_verify_mode' => $IO::Socket::SSL::SSL_VERIFY_NONE,
    'verify_hostname' => 0
);
```
These lines configure the SSL options for the user agent. Specifically, it disables SSL certificate verification (`SSL_VERIFY_NONE`) and hostname verification (`verify_hostname=>0`). This is generally not recommended for production environments, as it can make the connection less secure.
```perl5
my $request = HTTP::Request->new('GET','https://caveofpython.com');
```
This line creates a new HTTP GET request object for the URL "https://caveofpython.com"
```perl5
my $response = $ua->request($request);
```
This line sends the HTTP request using the user agent and stores the server's response in the `$response` variable.
```perl5
unless($response->is_success()){
    die $response -> status_line(); 
}
```
These lines check if the server responded with a successful status code (e.g., 200 OK). If the response was not successful, it prints the status line (e.g., "404 Not Found") and terminates the script.
```perl5
my $content = $response -> decoded_content();
```
This line retrieves the decoded content (HTML, JSON, etc.) of the server's response and stores it in the `$content` variable.
```perl5
print($content);
print("completed");
```
These lines print the downloaded content to the console, followed by the string "completed."

In summary, this Perl script downloads the HTML content of the "https://caveofpython.com" website using the LWP module, disabling SSL certificate and hostname verification for simplicity. It then prints the downloaded content to the console, along with the string "completed."

---
Q10: why does the following code 
```perl5
sub operationsOnStrings_2 {
    my $stringVar = 'abc';
    print($stringVar * 2);
}
operationsOnStrings_2(); # 0
```
print `0`?

A: The code `print($stringVar * 2);` outputs 0 because when you try to multiply a string by a number in Perl, it treats the string as a number with a value of 0. 

In Perl, the multiplication operator `*` is overloaded to work with both numbers and strings. When one of the operands is a string, Perl tries to convert it to a number before performing the multiplication. 

The string `abc` cannot be converted to a valid number so Perl treats it as 0. Therefore, `abc * 2` becomes `0 * 2`, which result in `0`.

If you want to repeat a string multiple times, you should use the `x` operator instead of `*`. For example:
```perl5
sub operationsOnStrings_2 {
    my $stringVar = 'abc';
    print($stringVar x 2); # Outputs 'abcabc'
}
operationsOnStrings_2();
```
The `x` operator is specifically designed to repeat a string a given number of times. In the example above, `abc x 2` will output `abcabc`.

----
Q11: In the following code
```perl5
sub rangesAndLists(){
    my @listOfIntegers = (1..10);
    print("@listOfIntegers \n"); # 1 2 3 4 5 6 7 8 9 10

    my @customListOfIntegers = (2, 4..8, 10);
    print("@customListOfIntegers \n"); # 2 4 5 6 7 8 10

    my @listOfIntegersWithBreaks = (1..10);
    print("@listOfIntegersWithBreaks \n"); # 1 2 3 4 5 6 7 8 9 10

    # the following list will also contain the integers less than or equal to the floor of lower bound and upper bound
    my @listOfIntegersFromFloatRange = (2.1..8.5);
    print("@listOfIntegersFromFloatRange \n"); # 2 3 4 5 6 7 8

    my @listOfIntegersFromFloatRange_2 = (2.1..8.9);
    print("@listOfIntegersFromFloatRange_2 \n"); # 2 3 4 5 6 7 8

    # ranges on characters
    my @charList = ('aa'..'ae'); # there is no difference if we enclose 'aa' and 'ae' in double quotes rather than single quotes
    print("@charList \n"); # aa ab ac ad ae
    # as you can see in the output above, we didn't had to do extra work to get spaces between the values in the range,
    # the perl interpreter did that automatically for us!

    my @charList_2 = ("aa".."ae");
    print("@charList_2 \n"); # aa ab ac ad ae

    my $val1;
    my $val2;
    $val1, $val2 = @charList;
    print("$val1, $val2\n"); # aa, ab

}
rangesAndLists();
```
why do these lines 
```perl5
    my @charList_2 = ("aa".."ae");
    print("@charList_2 \n"); # aa ab ac ad ae

    my $val1;
    my $val2;
    $val1, $val2 = @charList;
    print("$val1, $val2\n"); # aa, ab
```
give the following error "Useless use of private variable in void context at lists-in-perl.pl line 89."

A: The error "Useless use of private variable in void context" occurs when you are using a variable in a context where the result is not being used or assigned to anything. In this case, the error is referring to the line
```perl5
$val1, $val2 = @charList;
```
The issue here is that `@charList` is an undefined array in your code snippet. When you try to assign values form an undefined array to `$val1` and `$val2`, Perl throws this warning because the assignment is essentially a no-op (no operation) since there are no values to assign.

To fix this, you need to initialize `@charList` with some values before trying to assign from it. For example:
```perl5
my @charList = ('a'..'e'); # Initialize @charList
my @charList_2 = ("aa".."ae");
print("@charList_2 \n"); # aa ab ac ad ae

my $val1;
my $val2;
($val1, $val2) = @charList; # Assign from @charList
print("$val1, $val2\n"); # Prints 'a, b'
```
In this modified code, `@charList` is initialized with values from `a` to `e`. Then, we assign `$val1` and `$val2` from `@charList`, the assignment is valid, and no warning is thrown.

It's generally a good practise to initialize your variables before using them to avoid such warnings and potential undefined behavior in your Perl programs.

---
Q12: Why is this perl code 
```perl5
my @numbers = (92,34,11,100,2,51,1034);
my @number_sorted_1 = sort @numbers;
print("@number_sorted_1\n");
```
giving me the following output "100 1034 11 2 34 51 92"?

A: The `sort` function in Perl, when used without a custom subroutine, sorts the elements as strings in ASCII order. This is why the numbers are sorted in the order "100 1034 11 2 34 51 92" instead of numerical order.

To sort the numbers numerically, you need to provide a custom sorting subroutine that uses the numerical comparison operator `<=>`.

Here is the corrected code:
```perl5
my @numbers = (92, 34, 11, 100, 2, 51, 1034);
my @number_sorted_1 = sort { $a <=> $b } @numbers;
print("@number_sorted_1\n"); # 2 11 34 51 92 100 1034
```
If you want to list to be sorted in descending order, use `{$b <=> $a}`. This code compares the elements `$a` and `$b` using the spaceship operator `<=>` (numeric comparison). Since `$b` comes before `$a` the sort order is reversed, and the list is sorted in descending order.

---
Q13: Why does the following code 
```perl5
#!/usr/bin/perl
use 5.18.0;
use warnings;
say "Perl version is $^V";
# Perl version is v5.38.2
```
print the perl version as '5.38.2' instead of the version specified using the 'use' directive?

A: The `use 5.18.0` directive doesn't change or set the Perl version that is actually running on your system. Instead, it serves as a version check that ensures your code will run on Perl version 5.18.0 or higher.

When you include `use 5.18.0`, you're telling Perl:
1. This code requires at least Perl version "5.18.0" to run
2. Enable all features that were available in Perl "5.18.0"
3. If the installed Perl version is lower than "5.18.0", the program will fail to run

The `$^V` special variable always shows the actual version of Perl that's currently installed and running on your system (in this case 5.38.2), not the minimum version specified in the `use` statement.

This behavior is intentional and helps with backward compatibility while ensuring code safety. It's similar to how feature flags work in Perl - you need to explicitly enable them even if they're available in your installed version, which helps maintain consistent behavior across different Perl installations.

If you want to see what minimum version your code requires, you could do:
```perl5
#!/usr/bin/perl
use 5.18.0;
use warnings;
say "Minimum required Perl version: 5.18.0";
say "Running Perl version $^V";
```
This would show both the minimum required version and the actual running version of Perl.

-----
Understanding the 'shebang' line `#!/usr/bin/perl`!
The shebang line starts with a pound sign and then an exclamation mark, and then it has the path to the Perl interpreter; this is a common Unix technique to run a script. The pound sign in the shebang indicates to the script language that this line is a comment and not to interpret this as code, the pound is immediately followed by the exclamation mark without any spaces or other characters. Together the pound sign and the exclamation mark tell Unix shell interpreter, something like Bash or Ksh, that this line is going to tell you how to run the script; thus after the '#!' we have the path to the Perl interpreter.

-----
Q14: What is the difference between the built-in command `say` and `print`?

A: The `say` command automatically includes a new-line character at the end of the string, whereas the `print` command does not. 

-----
Perl uses `;` as a separator and not as a terminator. Thus, even though it is not mandatory to put a semicolon at the end of a line in a Perl script, it is a good coding practice to do so.

------
Q15: Why can't I use `say` instead of `print` in the following program
```perl5
#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
sub counter_lines {
    my $fileName = "../Resources/my-man-jeeevs.txt";
    open(INPUT,$fileName) or die("$fileName not found");
    my @lineArray = <INPUT>;
    close(INPUT);
    my $lines = scalar(@lineArray);
    print("There are $lines in $fileName\n");
}
counter_lines();
# There are 7250 in ../Resources/my-man-jeeevs.txt
```
and when I do, why do I get this error "Undefined subroutine &main::say called at counting-lines-in-a-file.pl line 10."

A: the error occurs because the `say` function is not accessible by default in Perl - it was introduced in Perl 5.10.0 and needs to be explicitly enabled. There are two ways to fix this:
1. Add `use feature 'say';` at the beginning of your program:
```perl5
#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use feature 'say'; # enable the say feature
sub counter_lines {
    my $fileName = "../Resources/my-man-jeeevs.txt";
    open(INPUT,$fileName) or die("$fileName couldn't be found!");
    my @lineArray = <INPUT>;
    close(INPUT);
    my $lines = scalar(@lineArray);
    say "There are $lines in $fileName";
}
counter_lines();
```
2. Or use a variable declaration that automatically enables `say` along with other modern features:
```perl5
#!/usr/bin/perl
use v5.10; # This enables say and other features from Perl 5.10
use strict;
use warnings FATAL => 'all';
sub coutner_lines {
    my $fileName = "../Resources/my-man-jeeevs.txt";
    open(INPUT,$fileName) or die("$fileName");
    my @lineArray = <INPUT>;
    close(INPUT);
    my $lines = scalar(@lineArray);
    say "There are $lines in $fileName";
}
counter_lines();
```
The main differences between `say` and `print` are:
1. `say` automatically adds a newline (`\n`) at the end
2. `print` requires you to explicitly add `\n` if you want a newline
Both approaches will work, but using `use v5.10;` (or higher) is generally preferred as it enables other useful features as well.
