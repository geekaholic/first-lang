# First-Lang Project

`First-Lang` is a programming language designed for newcomers. Currently it is only an early draft and there is a basic [Ruby based interpreter](./bin/fl) implemented. For basic syntax highlighting for VIM checkout the `misc` directory.

## First-Lang by Examples

Below is an example of how the language syntax will look. Not all of the language features are implemented so please take a look at [./samples](./samples) and [./tests](./tests) directories for what is currently supported.

```
# Data types
# Scalars
Var a, b
# Lists/Arrays
Var @a, @b
# Hashes/Dictionaries
Var %a, %b
# Classes / Objects
Var *obj
Class *Person
# Interfaces
Interface |Processable
# Mixin
Mixin ~ABC
# Constants
Const PI, TRUE, FALSE, NULL

# Assignment
Let age = 35
Var cost_of_living
Const PI = 3.141519

# Can annotate numbers for readability
Let cost_of_living = 3,000.dollars * 12.months

# Conditional
If cost_of_living > 100,000.dollars Then
  Println "That's insane! Time to move!"
Elseif cost_of_living >= 50,000.dollars Then
  Println "Pretty expensive"
Else
  Println "Good job!"
End

Select cost_of_living
  When >100,000
    Println "Insane!"
  When >=50,000
    Println "Expensive!"
  Else
    Println "Good Job!"
End

# Loops
For i = 1 To 100 Step 2
  Println i
End

Let j = 100
While j > 1
  # Redefining Let doesn't matter but might be more readable
  Let j = j - 2
  Println "Counting down #{j}"
End

# Infinite Loop
Let z = 0
Loop
  z = z + 1
  Println z
End

Loop
  j = j + 1
  Println j
While j <= 100

# Lists / Arrays
Let @fruits = ["Apple", "Orange", "Grape"]

# Dictionaries / Hashes
Let %fruit_prices = {
  "Apple" : 0.99.dollars,
  "Orange": 1.25.dollars
}

Foreach fruit In @fruits
  Println fruit
End

@fruits.Foreach fruit
  Println fruit
End

Foreach fruit, price In %fruit_prices
  Println "#{fruit} costs #{price}"
End

%fruit_prices.Foreach fruit, price
  Println "#{fruit} costs #{price}"
End

# Functions
Let h = 5.ft, w = 200.lb
Let bmi = calculate_bmi(weight = w, height = h)
Println "Watch your weight!" If bmi > 25

Function calculate_bmi(height, weight)
  Let bmi = (weight / height) * 703
  Return bmi
End

# Objects
Var *a_customer
Let *a_person = New *Person("John", "Doe")
*a_customer = *a_person # Casting

# Classes
Class *Person
  # Public attributes are directly accessible
  Public Var first_name, last_name
  Var status = FALSE, logged_in = FALSE

  # Special optional method called for initializing
  Method Constructor(first_name, last_name)
    # Self is a special reference to current object
    Self.first_name = first_name
    Self.last_name = last_name
  End

  # Special optional method called for cleanup
  Method Destructor()
    Self.status = NULL
  End

  # Method is alias for Function
  Method full_name()
    Return Self.first_name + ' ' + Self.last_name
  End

  # Singleton methods
  Method Singleton.get_full_name(first_name, last_name)
    Return first_name + ' ' + last_name
  End
End

Class *Customer, Inherit *Person, Implements |Loggable
  # Mix a Mixin
  Mix ~Loggable

  Method Constructor(first_name, last_name, user_name, email)
    # Call parent's constructor
    Super(first_name, last_name)
    Self.user_name = user_name
    Self.email = email
    Self.status = TRUE
  End
End

# Interfaces
Interface |Loggable
  Function login(user_name, password) Return :User
  Function logout()
  Function logged_in?() Return TRUE
End

# Mixin for DuckTyping
Mixin ~Loggable
  Function login(user_name, password)
    If user_name == Self.user_name && password == Self.password Then
      Self.logged_in = TRUE
      Return Self
    End
    Return NULL
  End

  Function loggin_in?()
    Return Self.logged_in
  End
End
```
## Experimenting with First-Lang interpreter

There is an experimental interpreter runtime which requires you to have `Ruby` preinstalled.

```
$ ./bin/fl ./samples/hello.fl
```

To execute from STDIN

```
$ cat ./samples/hello.fl | ./bin/fl -
```

Alternately you can use Docker to get a shell with first-lang preinstalled in a container.

```
$ docker-compose run --rm first-lang /bin/bash
```

Or try using [Play-with-docker](https://labs.play-with-docker.com/?stack=https://raw.githubusercontent.com/geekaholic/first-lang/docker-support/docker-compose.yml), which would download and build the container on the cloud. Once everything has settled attach to the running container.

[![Try in PWD](https://raw.githubusercontent.com/play-with-docker/stacks/master/assets/images/button.png)](https://labs.play-with-docker.com/?stack=https://raw.githubusercontent.com/geekaholic/first-lang/master/docker-compose.yml)

```
$ docker attach $(docker ps -q)
root@77851e85544f:/first-lang/samples# fl hello.fl
root@77851e85544f:/first-lang/samples# vi hello.fl
```

### Running First-Lang on iOS!

It's now possible to play with First-Lang on iOS thanks to the amazing work being done by the folks at [iSH](https://github.com/tbodt/ish). As iSH is still in development and not yet officially available via the AppStore, you will need to head over to [iSH github](https://github.com/tbodt/ish) and either build via source or install via TestFlight. Once installed launch iSH and install packages `ruby, git and vim` to get started.

```
$ apk add ruby git vim
$ git clone https://github.com/geekaholic/first-lang.git

```
