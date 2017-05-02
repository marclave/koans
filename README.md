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