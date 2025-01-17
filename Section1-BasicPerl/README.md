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

-----
Q16: What is the purpose of using the `my` keyword when declaring a variable?
A: The `my` keyword makes the variable to be lexically scoped in the enclosing block or file, so that makes it a local variable to this file.

The variable with the dollar sign `$` is a scalar variable. A scalar type carries one variable, one value, and in this case, that value is a string.

Perl supports three different data types `scalar`, `array` and `hash`. A value can be a string, an integer, a floating point value, and perl will automatically convert between these types of values. In the literal sense, Perl does not have constants.

Just like we use `$` sign to create a scalar variable, we can use `@` sign to create an array.

We use the following statement `my $lines = scalar(@lineArray);`, to obtain the length of the array. When we use scalar sub-routine on an array, it returns a single value, i.e., the length of the array.

----
Q17: What's the difference between reading a file using
```perl5
my $fileName = "../Resources/fileName.txt";
open(INPUT,$fileName)
```
and 
```perl5
my $fileName = "../Resources/fileName.txt";
my $fh = IO::File->new($fileName,"r");
```

A: There are a bunch of differences between reading files using the above two methods
1. When reading file using `IO::File->new($fileName,"r")`, we are reading lines from the file, one line at a time, on the other hand, using `open(INPUT,$fileName)`, we read the entire file into memory at once. Reading lines from the file, one line at a time, we can read much bigger files without running out of memory.
2. To use `IO::File->new($fileName,"r")`, we write `use IO::File;` at the beginning of the file. This reads in the "IO File module", which is an object-oriented file-handling library. And later on with `my $fh = IO::File->new($fileName,"r")`, we create an object using this library and the object-interface is stored in the `$fh` scalar variable. Next, we use the following code to check if the object construction failed which would result in a `false` being stored in the `$fh` variable
```perl5
my $fileName = "../Resources/fileName.txt";
my $fh = IO::File->new($fileName,"r");
if (!$fh) { #checking if $fh stores false, i.e., the object construction failed!
    print("File could not be opened!\n");
    exit();
}
```
This method is better because we are reading one line at a time from the file and because there is plenty of error-handling in code to ensure safe exit if reading the file fails.

----
Let's understand the following code 
```perl5
#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use v5.10;
use IO::File;
main(@ARGV);
$|=1;
sub main {
    my $fileName = shift || "../Resources/my-man-jeeevs.txt";
    my $counter = countlines($fileName);
    say "$fileName has $counter lines!";
}
sub countlines {
    my $fName = shift;
    error("Missing filename") unless($fName);
    my $fh = IO::File->new($fName,"r") or error("File construction failed! Cannot open $fName ($!)\n");
    my $count = 0;
    $count++ while($fh->getline);
    $fh->close;
    return $count;
}
sub error {
    my $e = shift || "Unknown error!";
    say "$0 : $e";
    exit();
}
```
1. As you might have guessed, we declare a function with the keyword `sub` in perl, probably because in perl we call them subroutines instead of functions.
2. Parameters are passed as array of scalars and may be accessed with the `shift` keyword.
3. Now, when we call `main` at ln6, we pass to it a variable called `@ARGV`, this is actually a special array that is predefined by Perl to contain the parameters that were passed from the command line when this script was invoked.
4. You can see that we read from the arguments passed to main using the shift keyword at ln9, and we have an or operator with a literal string on its RHS `my $fileName = shift || "../Resources/my-man-jeeevs.txt";`. All we are doing here, is that if there is an argument passed when invoking the perl script, we store it in the scalar variable, and if not then we hardcode the value that must be stored in that variable through the literal string on the RHS of `||` operator.
5. Again, in the `countlines` subroutine, we use the `shift` function to read the paramater passed to it and something interesting happens on the next line, `error("Missing filename") unless($fName);` this is what is called a post-fix conditional, this is extremely useful when one wants to write clever one-liners in Perl. `error("Missing filename") unless($fName);` simply means that if $fName is empty, i.e., we forgot to pass a fileName as parameter when calling `countline`, call the function `error` with the given string literal as argument. In postfix conditionals we simply have the object of the conditional before the actual conditional itself.
6. On ln16, we have another variant of `or` which will result in the `error` subroutine being fired if object creation using `IO::File->new` fails. The difference between `||` and `or` is that 
7. On ln18, we encounter a postfix while loop, just like the postfix conditional, the object of the loop comes before the conditional, `$count++ while($fh->getline);`, we can read this statement as increment `count` while there are lines in the file.
8. On ln24, we see a default variable `$0`, which is a built-in scalar in Perl and stores the pathname for the current script. 

-----
Q18: What's the difference between `||` and `or` in Perl?
A: In Perl, `||` and `or` serve similar logical 'OR' operation but have different operator precedence, which can lead to different behavior:
1. `||` has higher precedence than assignment `=`.
2. `or` has lower precedence than assignment `=`.
In our code, we have two examples:
```perl5
my $fileName = shift || "../Resources/my-man-jeeevs.txt";
```
and 
```perl5
my $fh = IO::File->new($fName,"r") or error("File construction failed! Cannot open $fName ($!)\n");

```
The first uses `||` because you want the default filename to be assigned if `shift` returns undefined or false. It is evaluated as 
```perl5
my $fileName = (shift || "../Resources/my-man-jeeevs.txt");
```
The second case uses `or` for control flow because you want the assignment to happen first, and only if it fails (return false), then execute the error function. It's effectively:
```perl5
(my $fh = IO::File->new($fName,"r")) or error("File construction failed!");
```
If you had used `||` in the file opening case, you might get unexpected behavior because of the precedence rules.

As a general rule of thumb:
- Use `||` for value assignment with defaults
- Use `or` for control flow and error handling
This is why you commonly see `or die()` in Perl code rather than `|| die()` when opening files or performing similar operations where you want to check if the operation succeeded.

----
Q19: what is the meaning of saying that `$x = 23; $x+=100` in this case, i.e., compound assignment, `$x` is evaluated only once, whereas in case of `$x = $x + 100` it is evaluated twice?

A: This distinction is about how many times the variable's memory location needs to be accessed and refers to potential optimization, specifically when dealing with complex expressions rather than simple variables.

Let's break it down:
For `$x = $x + 100;`
1. First evaluation: Read the value of `$x` from its memory location.
2. Add 100 to that value.
3. Second evaluation: Write the result back to `$x`'s memory location.

For `$x += 100;`
1. The operation can be optimized to directly modify the value at `$x`'s memory location.
2. The memory location of `$x` only needs to be determined once.

This difference becomes more significant when dealing with more complex expressions, especially array or hash elements. For example:
```perl5
$array[$complex_expression] = $array[$complex_expression] + 100;  # complex_expression is evaluated twice
```
versus
```perl5
$array[$complex_expression] += 100;  # complex_expression is evaluated only once
```
In the first case, `$complex_expression` needs to be evaluated twice to determine the array index, while in the second case, using the compound assignment operator, the index is only computed once.

For simpler scalar variables like `$x`, modern compilers and interpreters will typically optimize both forms to be equally efficient, so there is no practical performance difference. The real benefit of compound assignment becomes apparent when working with more complex expressions like array indexing, object properties, or any expression where computing the location of the variable is non-trivial.

-----
Q20: What is the purpose of the `qq` operator in perl?
A: The `qq` operator in Perl is a string quoting operator that works like double quotes (`""`). It is particularly useful when you need string interpolation (expanding variables within strings) and when you need to include quotes within your strings.

Here are some key uses and features of `qq`:
1. Basic variable interpolation:
```perl5
my $name = 'John';
my $greeting = qq(Hello, $name!);  # Same as "Hello, $name!"
```
2. Alternative delimiters - you can use different delimiters which help avoid escaping quotes:
```perl5
# These are all equivalent:
my $str1 = qq(I don't need to escape 'quotes' here);
my $str2 = qq{I don't need to escape 'quotes' here};
my $str3 = qq[I don't need to escape 'quotes' here];
```
3. Especially useful when dealing with HTML or SQL:
```perl5
my $html = qq{
    <a href="some/url">Click here</a>
};

my $sql = qq{
    SELECT * FROM table 
    WHERE name = '$name'
};
```
4. Escape sequences are interpreted:
```perl5
my $text = qq(First line\nSecond line);  # \n creates a newline
```
The main advantage of using `qq` over regular double quotes are:
- More flexibility in choosing delimiters
- Better readability when dealing with nested quotes
- Clearer intent in the code that you want interpolation
- Ability to span multiple lines cleanly
Think of `qq` as a more versatile version of double quotes, particularly useful when dealing with complex strings that contain quotes or when you want to make string interpolation more explicit in your code.

-----
If you were wondering, yeah!!, you can write foreach in postfix form as well, like so
```perl5
my @readme = ("jk","fk","lk","pk");
say foreach @readme;
# jk
# fk
# lk
# pk
```

----
Q21: What is the purpose of the `qw` operator in Perl?
A: The `qw` (quote word) operator in Perl is used to create a list of strings by splitting on whitespace, without having to write quotes and commas manually. It's particularly useful when you need to create arrays or lists of words.

Here are some key uses and examples:
1. Basic list creation:
```perl5
# There are equivalent:
my @array1 = ('apple', 'banana', 'orange');
my @array2 = qw(apple banana orange);
```
2. Module import statements:
```perl5
#Instead of writing:
use Cwd ('realpath', 'cwd', 'getcwd');

# you can write
use Cwd qw(realpath cwd getcwd);
```
3. Different delimiters can be used:
```perl5
#All of these are equivalent:
my @array = qw(one two three);
my @array = qw/one two three/;
my @array = qw{one two three};
my @array = qw[one two three];
```
4. Creating lists of symbol or flags:
```perl5
my @permissions = qw(read write execute);
my @options  = qw(-f -f --help);
```
5. Special usage with `:ALL` for module imports:
```perl5
#Import all exportable functions from a module
use Some::Module qw(:ALL);
```
Key points about `qw`:
- It automatically splits on whitespaces
- No need for quotes or commas
- No variable interpolation (variables are treated as literal text)
- Whitespace at the beginning and end is ignored
- Each word becomes a separate element in the list

Example showing the difference between `qq` and `qw`:
```perl5
my $name = "John";
my @list1 = qw($name hello world);  # Creates ('$name', 'hello', 'world')
my @list2 = qq($name hello world);  # Creates "John hello world" as a single string
```
The `qw` operator is particularly useful when you need to create lists of simple strings making the code more readable and less error-prone by eliminating the need for quotes and commas.

----
Q22: What's `Cwd`?
A: `Cwd` (Current Working Directory) is a core Perl module that provides functions for working with the current working directory and handling file paths. It is particularly useful for getting and manipulating directory paths in a platform-independent way.

Here are the main functions provided by `Cwd`:
1. Getting the current working directory:
```perl5
use Cwd;
my $current_dir = getcwd(); # Get current working directory
# or
my $current_dir = cwd(); #Alternative method
```
2. Getting absolute (full) paths:
```perl5
use Cwd qw(abs_path realpath);

my $abs_path = abs_path("../relative/path");  # Convert relative path to absolute
my $real_path = realpath("./my_symlink");     # Resolve symbolic links to real path
```
3. Getting the fast version of getcwd (may not be as reliable):
```perl5
use Cwd qw(fastcwd);
my $dir = fastcwd(); # faster but might not work in all edge cases
```
4. Creating a Cwd object (OOP interface):
```perl5
my $dir_obj = Cwd->new();
my $current = $dir_obj->getcwd();
```
Common use cases:
```perl5
use Cwd;

# Get full path of a file in current directory
my $file = 'config.txt';
my $full_path = getcwd() . "/$file";

# Make sure we're in the right directory for operations
my $original_dir = getcwd();
chdir("/some/other/path") or die "Cannot change directory: $!";
# Do some work...
chdir($original_dir) or die "Cannot change back: $!";  # Return to original directory
```
The module is particularly useful when:
- You need to know the absolute location of files.
- You're writing scripts that need to change directories and return to previous locations.
- You need to resolve symbolic links to their actual paths
- You want to ensure path handling works across different operating systems.

`Cwd` is a core module, so it's available in all Perl installation without needing additional installation from CPAN.

-----
A thing about `hashes` in Perl:
A `hash` is a special kind of array in Perl that associates keys and values, we declare a hash with a `%` sign, like so
```perl5
my %hash = ("one"=>"uno","two"=>"dos","three"=>"tres");
# the key can be a bare-word, i.e., we can write the string without quotations
my %hash2 = (one=>"one", two=>"two", three=>"three");
```
`=>` is the association symbol in perl that is used to associate a key with a value.

Now, when we want to print the hash, we can use the `each` construct as shown below
```perl5
my %hash = ("one"=>"uno","two"=>"dos","three"=>"tres");
while(my ($k,$v) = each(%hash)){
    say qq|$k -> $v|;
}
```
the `each` operator is used to read values one at a time from the hash.

The thing to remember about hashes is that the key-value pair are not stored in any given order within a hash. Hashes are also called "associative arrays" and internally uses a hash-table to calculate the index based on the key. The keys in a hash are unique and duplicates are not allowed.

Just like we did with arrays, if we wish to access a single value from a hash, we can use the following syntax
```perl5
my %hsh = (1=>"eins",2=>"zwei",3=>"drei",4=>"vier",5=>"fünf",6=>"sechs",7=>"sieben",8=>"acht",9=>"neun",10=>"zehn");
$hsh{3}; # we used the $ sign
```
and if we wish to access multiple values we can do the following
```perl5
my %hsh = (1=>"eins",2=>"zwei",3=>"drei",4=>"vier",5=>"fünf",6=>"sechs",7=>"sieben",8=>"acht",9=>"neun",10=>"zehn");
%hsh{1,2,3} # we used the percent sign
```

We can add values to a hash like so
```perl5
my %hsh = (1=>"eins",2=>"zwei",3=>"drei",4=>"vier",5=>"fünf",6=>"sechs",7=>"sieben",8=>"acht",9=>"neun",10=>"zehn");
$hsh{12} = "zwolf";
```

Modify values
```perl5
my %hsh = (1=>"eins",2=>"zwei",3=>"drei",4=>"vier",5=>"fünf",6=>"sechs",7=>"sieben",8=>"acht",9=>"neun",10=>"zehn");
$hsh{2}="do";
```

and delete values, like so
```perl5
my %hsh = (1=>"eins",2=>"zwei",3=>"drei",4=>"vier",5=>"fünf",6=>"sechs",7=>"sieben",8=>"acht",9=>"neun",10=>"zehn");
delete $hsh{5};
```

We can remove multiple values from the hash in a similar manner like so
```perl5
delete %hsh{1,2,3};
foreach my $k (sort{$a<=>$b}(keys(%hsh))){
    print qq|$k -> $hsh{$k}; |;
}
# 4 -> vier; 5 -> fünf; 6 -> sechs; 7 -> sieben; 8 -> acht; 9 -> neun; 10 -> zehn; 11 -> elf; 
```

Since the key-value pairs in a hash are not sorted, we can sort them using the following construct
```perl5
my %hsh = (1=>"eins",2=>"zwei",3=>"drei",4=>"vier",5=>"fünf",6=>"sechs",7=>"sieben",8=>"acht",9=>"neun",10=>"zehn");
foreach my $k (sort{$a<=>$b}(keys(%hsh))){
    say qq|$k -> $hsh{$k}|;
}
```
the `sort` function sorts the keys based on their numeric value and the `keys` function gives us a list of keys from the hash.

----
Perl doesn't support constants, but every perl distribution ships with the pragma `constant` which can be used to declare constants, like so
```perl5
use constant PI => 3.14;
use constant author => "Khanna";
```
We can also declare constants like so
```perl5
use constant{
    first  => 1,
    second => 2,
    third  => 3,
};
```
Since constant is a pragma and not a block, one must remember to add a semicolon after the closing curly-brace.

Just like we do in hashes, the constants are also declared with the `=>` operator.

we can put a comma after the last constant in the block constant declaration.

Another way to declare a constant would be to use the function declaration like so
```perl5
sub PI { 3.14 }
# above is a simple function that returns the value 3.14
```
As a matter of fact the `use constant` pragma implements the constants internally in the manner shown above, i.e., using the function definition.

-----
We can write postfix if conditional as follows
```perl5
my $x = 1;
say 'true' if $x == 1;
```
postfix `if` is only valid when we have a single conditional, if however, we have multiple branches in the conditional, like say, `elsif`, and `else` block, we have to use the traditional block-oriented prefix syntax.

Perl also supports `unless`, which can be seen as negated if, it can be used in block-style conditionals, but its main use is for writing simple conditionals, like so
```perl5
my $x = 1;
my $y = 1;
say "They are the same" unless $x != $y; # this only executed if the conditional in 'unless' is false
# i.e., print "They are the same" if x is equal to y
say "They are the same" if !($x!=$y); 
# this is the same
```


-----
