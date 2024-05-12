# Understanding the Nitty-Gritty Details!
> I've already mentioned a lot of this in the code-comments but still!


Q1:: How does this statement work in Perl? `open(INPUT,$fileName) or die("$fileName not found");`

A:: It’s utilizing **short-circuit logic**! If the `open()` function is able to open the file successfully, the expression on the left-hand side (LHS) of `or` returns `TRUE`, and the expression on the right-hand side (RHS) is not executed. Thus, the `die` subroutine is never called!

However, if the `open` function is unable to open the file for whatever reason, the expression on the LHS of `or` returns `FALSE`, and the expression isn’t short-circuited. This results in the `die` subroutine being executed, which terminates our program before any harm can be done!

Q2:: 