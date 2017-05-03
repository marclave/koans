# koans
Getting started with Ruby


## Key points 

### Assertions

assert takes one or more arguments: boolean toAssert, string message

comparision can be done as input as follows
```
one = 1
two = 2

assert one == two
```

Even more cool, there is an `assert_equal`
```
houseGuests = 10
housePlates = 4
assert_equal houseGuests, housePlates
```

### nil

Firstly, you can either fo `kind_of?` or `is_a?` which both return true || false depending on if the class is of obj or if class is a superclass of obj. Or if its included in obj

### Objects

Everything appears to be an object so far, including nil

`nil.to_s` and `nil.inspect` both return an empty string

No two objects has the same `id`

It appears the small integers ID patterns is as follows:
```
2*integer_value + 1

```

### Arrays (About)

Same as every other language so far for arrays..

Oh this is neat, appending to an array can be done like

```
arrayName << 333

```

Can do `array.first` and can also do `array.last`. Also similar to python can index by negative like so `arr[-1]`

`array[0..2]` Will take the zero index to second index `inclusive`

Where as `array[0...2]` Will take the zero index to second index `exclusive`


### Arrays (Assignments)

Similar to golang, a non parrallel assignment is as follows
```
friends = ["John", "Smith"]
```

Something new, can do parallel assignments

```
  first_name, last_name = ["John", "Smith"]
  assert_equal "John", first_name
  assert_equal "Smith", last_name
```

`splat` is very cool, right now i would define it as breaking up an array without actually needing to loop over it.

`double splat` is even cooler
```
def go(x:, y:)
end

point = { x: 100, y: 200 }
go(**point)
``` 

### Hashes

Similar to golang except using the `=>` symbol

the `#[]` will return the value if it exists, else `nil`. If we use the `#fetch` there are different options we can use.

Taken from http://ruby-doc.org/core-1.9.3/Hash.html#method-i-fetch

For example if we wrap with an assert raise for KeyError.

```
assert_raise(KeyError) do
  hash.fetch(:doesnt_exist)
end
```

For the bonus question it appeared I could not just use the literal, I am guessing for how the assert_equal handles the input?

If hashes are unordered, we can still do a compare and see if the two sets are equal

a hashes keys class are `Array`, same with a hashes values class

Merging two hashes will take the hash being merged into old hash and if there are duplicates it will over write the old ones

When instantiating a new `Hash` you can specify a default value in `h = Hash.new("default")`

The `test_default_value_is_the_same_object` caught me off guard, but makes sense


### Strings

Single and double quotes can be used for strings, need to check Stembolt coding guidelines

If nesting `""` inside a string, use `''` to wrap, no need for escape characters

Flexible quoting is my favourite, similar to `"{0} first thing, {1} second".format(1, 2)` in python

```
a = %(flexible quotes can handle both ' and " characters)
```


Can do concatenation with `+` operator.

Bonus question, first glance it feels more clean, however my guess is it doesnt need to create a new string every time. It is modifying the original.

Single quotes do not interpret escape chars, double quotes do.

Only double strings interpolate

join and split for strings and arrays are just that like python


### Symbols

The reason they converted the symbols to strings was to compare the function, otherwise we couldn't.


Symbols are immutable.

### Regular Expressions


If you want to see if a pattern is in a string, can do the following

```
assert_equal "match", "some matching content"[/match/]

```

If it doesnt match it returns a `nil`

So if `*` can match an empty string... It appears that it would be never? Tested on whitespace and trailing characters

`*` is greedy because, depending on the tokenizing, I am sure it performs a lot of backtracking and incase the input data has not been messaged or handled properly, we could match up on a lot of information.


`select` is an enumerator, so if you want to use it on an array for example

```
numbers = [1, 2, 3, 4]
evenNumbers = numbers.select { |number| number.even? }
```

I Enjoy the enumerator.

Normal regular expression identifiers

Capitalization of a shortcut negates it, can also use `^`

`"\A"` is start of the string, where as `"\z"` is the end of the string


Caret anchors tho the start of lines

Dollar sign anchors to end of lines

Scan is similar to findall

### Methods


Able to call a function without parenthesis, feeling uneasy want to see if this a best practice


Function names are made into symbols as soon as they are created

### Keyword Arguments

Alongside using default values, you can use keyword arguments. the main difference from appearance is when you call the function and you want to override the keyword value you must explicitly do so, instead of implicitly like default values


If you do not specify a value with a keyword argument that means it is required

```
def foo(a, b: 'letterB')
  [a, b]
end

```


### Constants

Is it best practice to have a class of constants, then ref them from other files? Or just have a constants file. I do this in c a lot so need to check.


top level constants are ref'd by `::` where as full path `ClassName::constant` is for the class constant


lexicol scope has precidence over inheritance


For the last question there is no context for `LEGS` in the lexical scope so inheritance takes the cake


### Control statements

Every statement returns a value, so this means we can use if statements in this way


New keyword `unless <condition>` evaluates to `if !<condition>`

`next` statements are cool, they only run the next line if a condition is true. Looks to remove the indentation of a single if statement

There is the `.times` which if you do `10.times do ... end` it will do that block ten times


### About true and false

`nil` is treated as false, where everything except false is treated as true: 
```
1
0
[]
{}
...
```
### Triangle Project

See `about_triangle_project.rb`


### Exceptions

`rescue` allows us to handle certain exceptions

if you `fail` and provide a message, that is the exception message if you `rescue` it properly.
the flow is
```
begin
...
rescue
...
ensure [optional]
```

Can also raise and rescue new exceptions


### Triangle Project 2

See `triangle.rb`


### Iteration

Blocks are cool for iterations, but also I feel as though less readable unless you have had ruby experience

Breaks can be before `if` statement instead of nested inside if one liner

Collect appears to be similar to the `map` from python

Oh haha it totally is


findall and select are, at the highest level, interchangeable

`.find` finds the first occurence, based on a condition, in an array


`inject` amalgamates all elements of iterator, can use a block to perform an operation.

Ruby way of summing an array `my_array.inject(0, :+)`

Bonus question

My first thought is that if it failed to open it will return `nil` to file
so then in the `assert_equal` it will fail
Where as if you just tried to do `File.open` you would have to do a begin..rescue

On discussion, it closes the file automatically where as you have to manually close it with returning it

### Blocks

`block_given` will be useful

blocks can change variables in outer scope


Explained lambdas in ruby for me http://culttt.com/2015/05/13/what-are-lambdas-in-ruby/


### Sandwhich

See `about_sandwhich_code.rb`

### Scoring project

See `about_scoring_project.rb`


### Classes

Similar to python


formal accessor for instance variables

```
fido.instance_variable_get("@name")
```

Because initialize gets run on every instantiation, thus needing the proper arguments if required.
