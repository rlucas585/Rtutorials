# Chapter 1: R basics

Some definitions before beginning:

* **R** is a **programming language**, designed specifically for statistical
computing. R can be run from the command line (a terminal), or from
within an IDE.
* **RStudio** is an **Integrated Development Environment** (**IDE**). An IDE
is a piece of software to provide a simpler user interface with all of the
associated tools a programmer might need while developing software (e.g. a
text editor, a compiler to construct a program from code, etc.).

If you have little to no programming experience, or if you prefer an IDE for
development, then RStudio is recommended. For this first chapter however, we
will go over the basics of R alone, before beginning with RStudio in the
second chapter.

## R installation

**Linux**: To install R on Linux, enter the command
`sudo apt-get install R.base` in terminal, and enter your root password.

Alternatively for Linux, or for Windows, you can go to the
[R website](https://www.r-project.org/),
click download at the top left, and select your OS.

On Linux, you can now run R from the command line with `R`.
On Windows you can search for R from the windows search bar to open an instance
of R.

## Running the R console

### First commands

R can be run by itself, and upon opening you'll see a screen similar to
this:

![R intro screen](../images/rintro.png)

This is the R console, where we can enter R commands that will be interpreted
to give us output.

A few basic commands to try out could be:

* `getwd()` - Returns the current working directory (the directory/folder that
  the R console is currently working from). A working directory is the current
  folder in your filesystem where R can read files from, and where it will save
  files to.
* `dir()` - Shows the directories present in the current working directory.
* `setwd(dir)` - `setwd(dir)` takes what is known as an **argument**, in this
case `dir`. An argument is data that we pass to a function/command that it will
use in some way. `dir` in this case is the directory that we want to set as our
new working directory. 
* `dir.create(name)` - Create a new directory named `name` in the current
  working directory.

To familiarise ourself with these commands, let's make a new directory to use
for this tutorial series, and move into it.

First, let's check where we are:

```
> getwd()
[1] "/home/rlucas"
```

Your output will obviously show your current directory rather than 'rlucas'.
Next, run `dir()`, and you should see all folders within your current working
directory.

```
> dir()
[1] "A Directory" "Another Directory"
```

Now, we're going to create a new directory with `dir.create(name)`. This is the
first time we will be using a function with an **argument**: when functions
take arguments, they expect a certain **type** of argument (such as a number, or
a word, variable types will be covered later). For `dir.create(name)`, 'name'
should be a **character** type, which means when we supply our argument, it
should be enclosed within double-quotes **"**:

```
> dir.create("OurNewDirectory")
```

There won't be any output from this command, but if we run `dir()`, we should
see our new directory.

Now, to move into the directory, all we have to do is run `setwd(dir)`, using
the same name as the directory we just created:

```
> setwd("OurNewDirectory")
```

Again, there won't be any output, but if we check our location with `getwd()`,
we'll find ourselves in our new directory.

To move backwards in a file system, use:

```
setwd("..")
```

### Arguments and Default values

In R, many functions have multiple arguments, which often have **default
values**. If an argument has a default value, then you can omit these arguments
when calling the function, and the default value will be used in its place.
With `setwd(dir)` and `dir.create(dir)`, we had to supply an argument, but
functions we use later on will allow us to ignore one or more of its arguments.

If you come across a command that you would like more information on, you can
use the `help()` function to get its manual page.

* LINUX - `help()` will return a page that you can scroll up and down in with
the arrow keys.
* WINDOWS - `help()` will open a page in a web browser that can be scrolled
through with the mouse.

If you ever are struggling to make a function work the way you expect it to,
it is always worth checking it's help page with `help(topic)`.

Arguments and default values of functions will be covered repeatedly in the
following chapters as new functions are introduced, so there should be numerous
examples to help understand the meaning of arguments and default values.

### Basic calculations

While using the R console, we can perform numerous mathematical functions. To
begin with, try entering a few simple calculations:

* `3 + 3` - (addition) will output 6.
* `3 - 2` - (subtraction) will output 1.
* `3 / 2` - (division) will output 1.5.
* `3 * 3` - (multiplication) will output 9.
* `2 ^ 4` - (raise to power of) will output 16. (`2 ** 4` is equivalent)
* `7 %/% 3` - (integer divide) will output 2. (Note the '/' between the
percentage symbols!)
* `7 %% 3` - (modulo) will output 1. (modulo is the remainder following
  division)

These operators are capable of acting in the same manner as a basic calculator,
but they are much more powerful when applied to *vectors*, as we shall see
later.

### Introducing variables

**Variables** are an essential part of most programming languages. A variable
simply **stores a value** under a convenient name.

In the R console, let's imagine we want to store the number of apples we own,
this can be done like so:

```
> apples <- 20
```

We will not see any output from this command. However, if we now enter a new
command: `ls()`, we will see "apples" listed.

`ls()` stands for **List Objects**, it can list the objects in any environment
in R (an environment can be thought of as an individual workspace within R,
where each environment can contains its own variables).
With no argument, it defaults to the default environment, which is the
one we have been using.

If we now enter `apples` into the command line, we receive `[1] 20` as output.
We can now use `apples` in any equation, and the number that we have stored
in this variable will be used.

* `apples * 3` will return 60.
* `apples / 5` will return 4.

We can declare as many variables as we want to in our R environment, and use
them in equations with one another. Try:

```
> bananas <- 3
> apples * bananas
[1] 60
```

To remove a variable once we no longer need it, we can use `rm(variable)` to
remove it from our environment.

To remove several variables, simply supply them to `rm()` as arguments
separated by commas: `rm(variable1, variable2)`.

To remove all variables in our environment, `rm(list=ls())` is a single command
that combines two functions and a variable assignment to clear our entire
environment.

### Variable types

Most programming languages feature different types of variable, and R is no
different. These types are:

* character - used for characters ('a', 'b', 'c') and strings ("abc", "def"). If
you are new to programming, a string is essentially a number of characters lined
up next to each other. Many languages treat characters and strings as different
data types, but in R they are treated as a single type.
* numeric - Also known as *double*, numbers that may have decimal place values
e.g. 2.5, 15.35 etc.
* integer - Whole numbers e.g. 2, 5, etc. When declared, must be done
suffixed by an **L** to specify that it is an integer value (var <- 2L).
* logical: TRUE and FALSE
* complex: 2 + 3i; complex numbers with real and imaginary parts.
* raw

Raw data type will not be covered here.

**Types** are essential, as many operations are not permitted on certain types.
Addition of doubles and integers for example is perfectly valid, but addition
of character strings is not accepted.

Let's determine the type of our variables declared before
(`apples` and `bananas`), and compare it to an integer type variable `oranges`
and a character type variable `name`.
We can do this with the `typeof` function.

```
> oranges <- 5L
> name <- "Alex"
>
> typeof(apples)
[1] "double"
> typeof(bananas)
[1] "double"
> typeof(oranges)
[1] "integer"
> typeof(name)
[1] "character"
```

Keep in mind that performing operations on variables may result in type changes.
For example, if you divide two integer types e.g. `20L / 6L`, the result will be
`3.3333`, with `typeof()` returning `double`. The integer division operator
`%/%` must be used to return a value of `3`, and a type value of `integer`.


### Chapter 1 Conclusion

With all the information above, you should be able to:

* Install, and run the R console.
* Run basic functions, understand how to pass arguments to a function, and know
  the meaning of a *default value* for an argument.
* Perform basic math operations in the console.
* Declare variables, and perform operations on the variables.
* Understand the typing of variables, and how they can be affected by
  operations.

With all of this, R can function effectively as a calculator, but not do much
more than that. In the next chapter, we'll cover the most basic
data structure of R: the vector; install RStudio and begin to prepare for more
complex calculations.
