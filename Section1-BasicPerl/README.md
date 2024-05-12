# Understanding the Nitty-Gritty Details!
> I've already mentioned a lot of this in the code-comments but still!

**Context:[`finding-text-in-file.pl`](https://github.com/PhoenixAthens/Learning-Perl5-By-Doing-It/blob/master/Section1-BasicPerl/finding-text-in-file.pl)**<br>
Q1:: How does this statement work in Perl? `open(INPUT,$fileName) or die("$fileName not found");`

A:: It’s utilizing **short-circuit logic**! If the `open()` function is able to open the file successfully, the expression on the left-hand side (LHS) of `or` returns `TRUE`, and the expression on the right-hand side (RHS) is not executed. Thus, the `die` subroutine is never called!

However, if the `open` function is unable to open the file for whatever reason, the expression on the LHS of `or` returns `FALSE`, and the expression isn’t short-circuited. This results in the `die` subroutine being executed, which terminates our program before any harm can be done!

**Context:[`finding-text-in-file.pl`](https://github.com/PhoenixAthens/Learning-Perl5-By-Doing-It/blob/master/Section1-BasicPerl/finding-text-in-file.pl)**<br>
Q2:: What's the meaning of `<INPUT>` in the while-loop? How does it work?

A:: Well, I did some research (chatGPT 😅), so it goes something like this:<br>
- The `<INPUT>` construct is a file input operator that reads a single line from the file associated with the `INPUT` file-handle.
- Each time the loop iterates, the next line from the file is read and stored in the variable on the LHS of `=` sign.
- The loop continues until the end of the file is reached, at which point `<INPUT>` will return `undef`, causing the loop to exit.

**Context:[`finding-text-in-file.pl`](https://github.com/PhoenixAthens/Learning-Perl5-By-Doing-It/blob/master/Section1-BasicPerl/finding-text-in-file.pl)**<br>
Q3:: 