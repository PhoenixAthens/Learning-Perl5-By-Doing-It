# Understanding the Nitty-Gritty Details!
> I've already mentioned a lot of this in the code-comments but still!
>
> If you happen to be reading this and have any questions, feel free to create an `issue` and ask right away. You can also contact me via the other social handles mentioned on my profile!

**Context:[`finding-text-in-file.pl`](https://github.com/PhoenixAthens/Learning-Perl5-By-Doing-It/blob/master/Section1-BasicPerl/finding-text-in-file.pl)**<br>
Q1:: How does this statement work in Perl? `open(INPUT,$fileName) or die("$fileName not found");`

A:: It’s utilizing **short-circuit logic**! If the `open()` function is able to open the file successfully, the expression on the left-hand side (LHS) of `or` returns `TRUE`, and the expression on the right-hand side (RHS) is not executed. Thus, the `die` subroutine is never called!

However, if the `open` function is unable to open the file for whatever reason, the expression on the LHS of `or` returns `FALSE`, and the expression isn’t short-circuited. This results in the `die` subroutine being executed, which terminates our program before any harm can be done!

**Context:[`finding-text-in-file.pl`](https://github.com/PhoenixAthens/Learning-Perl5-By-Doing-It/blob/master/Section1-BasicPerl/finding-text-in-file.pl)**<br>
Q2:: What's the meaning of `<INPUT>` in the while-loop? How does it work?

A:: Well, I did some research (AMZN Q 😅), so it goes something like this:<br>
- The `<INPUT>` construct is a file input operator that reads a single line from the file associated with the `INPUT` file-handle.
- Each time the loop iterates, the next line from the file is read and stored in the variable on the LHS of `=` sign.
- The loop continues until the end of the file is reached, at which point `<INPUT>` will return `undef`, causing the loop to exit.
> FYI: the `<input>` construct will read the `\n` at the end of each line as well, so no need to add `\n` at the end of `print` message string!

**Context:[`finding-text-in-file.pl`](https://github.com/PhoenixAthens/Learning-Perl5-By-Doing-It/blob/master/Section1-BasicPerl/finding-text-in-file.pl)**<br>
Q3:: How does this expression `$cl =~ / help /` in the while-loop work?

A:: Well, glad you asked!. This is how we check each line to see if there is a match for word `help` in it. The `/ help /` is a very basic regular-expression. 
You can read the expression `if($cl =~ / help /)` as, check if the line contained in `$cl` has a value that can be captured by the regular expression `/ help /`. You can adjust this regular expression like so `/help/`, to not only match the word `help` but words such as `helpless`, `helping`, etc. as well, that contain the letter `help` in order.

---

