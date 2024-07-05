# Understanding the Nitty-Gritty Details!
> I've already mentioned a lot of this in the code-comments but still!
>
> If you happen to be reading this and have any questions, feel free to create an `issue` and ask right away. You can also contact me via the other social handles mentioned on my profile!

**Context:[`finding-text-in-file.pl`](https://github.com/PhoenixAthens/Learning-Perl5-By-Doing-It/blob/master/Section1-BasicPerl/finding-text-in-file.pl)**<br>
Q1: How does this statement work in Perl? `open(INPUT,$fileName) or die("$fileName not found");`

A: It’s utilizing **short-circuit logic**! If the `open()` function is able to open the file successfully, the expression on the left-hand side (LHS) of `or` returns `TRUE`, and the expression on the right-hand side (RHS) is not executed. Thus, the `die` subroutine is never called!

However, if the `open` function is unable to open the file for whatever reason, the expression on the LHS of `or` returns `FALSE`, and the expression isn’t short-circuited. This results in the `die` subroutine being executed, which terminates our program before any harm can be done!

**Context:[`finding-text-in-file.pl`](https://github.com/PhoenixAthens/Learning-Perl5-By-Doing-It/blob/master/Section1-BasicPerl/finding-text-in-file.pl)**<br>
Q2: What's the meaning of `<INPUT>` in the while-loop? How does it work?

A: Well, I did some research (AMZN Q 😅), so it goes something like this:<br>
- The `<INPUT>` construct is a file input operator that reads a single line from the file associated with the `INPUT` file-handle.
- Each time the loop iterates, the next line from the file is read and stored in the variable on the LHS of `=` sign.
- The loop continues until the end of the file is reached, at which point `<INPUT>` will return `undef`, causing the loop to exit.
> FYI: the `<input>` construct will read the `\n` at the end of each line as well, so no need to add `\n` at the end of `print` message string!

**Context:[`finding-text-in-file.pl`](https://github.com/PhoenixAthens/Learning-Perl5-By-Doing-It/blob/master/Section1-BasicPerl/finding-text-in-file.pl)**<br>
Q3: How does this expression `$cl =~ / help /` in the while-loop work?

A: Well, glad you asked!. This is how we check each line to see if there is a match for word `help` in it. The `/ help /` is a very basic regular-expression. 
You can read the expression `if($cl =~ / help /)` as, check if the line contained in `$cl` has a value that can be captured by the regular expression `/ help /`. You can adjust this regular expression like so `/help/`, to not only match the word `help` but words such as `helpless`, `helping`, etc. as well, that contain the letters `'h' 'e' 'l' 'p'` in order.

---
**Context:[`writing-to-output-and-replacing-text.pl`](https://github.com/PhoenixAthens/Learning-Perl5-By-Doing-It/blob/master/Section1-BasicPerl/writing-to-output-and-replacing-text.pl)**<br>
Q4: What's the purpose of `$|=1` at `ln4`?

A: Perl buffers the output on `Unix`-based systems. To disable output-buffering we put `$|=1` at the start of our perl script.

**Context:[`writing-to-output-and-replacing-text.pl`](https://github.com/PhoenixAthens/Learning-Perl5-By-Doing-It/blob/master/Section1-BasicPerl/writing-to-output-and-replacing-text.pl)**<br>
Q5: What's the purpose of `'>'.$outputFile` in statement `open(OUTPUT,'>'.$outputFile) or die("$outputFile couldn't be created!\n");`?

A: `'>'.$outputFile` is how we concatenate strings in Perl. Like in `Java`, we use the `+` operator to concatenate two strings, in `Perl`, we use the `.` operator to concatenate strings, here them strings being the path to output file `$outputFile` and `>`. The purpose of doing this concatenation is in with regards with how we create files in Perl. To create a file in perl, one must append `'>'` to the beginning of the path to the file. We could've also added `>` to the path like so
`my $outputFile = '>./Resources/output.txt';`, but that would've looked even more ambiguous, thus we went with the convention applied here!

**Context:[`writing-to-output-and-replacing-text.pl`](https://github.com/PhoenixAthens/Learning-Perl5-By-Doing-It/blob/master/Section1-BasicPerl/writing-to-output-and-replacing-text.pl)**<br>
Q6: What's up with the new regExp in this expression `$currLine =~ /\begg\b/`?

A: Well, `\b` defines the bounday for our capture-string, with `\b` we are telling the regExp engine how the boundary for the capture group is to be defined, surrounded by `\b` means that our string can be surrounded by a space, hyphen, full-stop, etc, but not by other letters.

**Context:[`writing-to-output-and-replacing-text.pl`](https://github.com/PhoenixAthens/Learning-Perl5-By-Doing-It/blob/master/Section1-BasicPerl/writing-to-output-and-replacing-text.pl)**<br>
Q6: What's up with this statement `$currLine =~ s/hen/DOG/ig;`>

A: This statement looks for lines with values that can be captured by `/hen/` and replaces them with `/DOG/` the purpose of `s/` before the first forward-slash is to say that we want to replace values from first capture group with `DOG`, the `i`, and `g` are flags, with `i` standing for `case-insensitive` (thus `hen` ,`HeN`, `HEn`, `HEN`, etc. will all open for capture) and `g` standing for `global` (meaning, replace all occurrences of `hen` with `DOG`, and not just the first one.) 

**Context:[`writing-to-output-and-replacing-text.pl`](https://github.com/PhoenixAthens/Learning-Perl5-By-Doing-It/blob/master/Section1-BasicPerl/writing-to-output-and-replacing-text.pl)**<br>
Q7: What's the meaning of this new `print` statement `print OUTPUT $currLine;`

A: I get it! It does look like a `syscall` but it's just saying "print to the file held by handler `OUTPUT` the string stored in variable `$currLine`".

----
Q8: How do you install an external Perl package, what's `cpan`?

A: To install external Perl packages, you can use the CPAN (Comprehensive Perl Archive Network) client, which is a command-line tool that comes bundled with Perl installation. CPAN is a vast repository of Perl modules and libraries contributed by the Perl community.

Here's how you can install an external Perl package using CPAN:
1. Open your terminal or command-prompt;
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

It's worth noting that you might need to have administrative privileges (run the commands with `sudo` on Unix-like systems) to install packages system-wide. If you don't have administrative privileges, you can install packages locally for your user account by configuring CPAN to use a local directory.

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
This line creates a new HTTP GET request object for the URL "https://caveofpython.com".
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
These lines print the downloaded content to the console, followed by the string "completed".

In summary, this Perl script downloads the HTML content of the "https://caveofpython.com" website using the LWP module, disabling SSL certificate and hostname verification for simplicity. It then prints the downloaded content to the console, along with the string "completed".

---


