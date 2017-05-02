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