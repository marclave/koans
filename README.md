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