# Helper options

A generic package created to handle your objects, widgets in a nicer way.

1. Redundancy of getters with non-option approach
2. Need to use liftNonNull or `!` with non-option approach because more likely that you will produce bugs as you
   have more getters and var names
3. Possibility to use arrow methods where its much shorter
4. If dart ppl decide that for some crazy reason replace `!` with & you would need to do that in 1M places
5. You can add more helper methods into class rather than adding it separately into different files. (Open pull request)
6. It avoids casting, so basically operator `!` is same as `T` on an object which is defined as `T?` by using optional
   we don't have this problem as there is no casting operation
7. General speaking Flutter ppl are not recommending the usage of `!` and saying that this should avoid as much
   as possible
8. Optionally allows the caller to continue a chain of fluent method calls. (arrow methods)

## Explanation with examples:
It is a generic class to determine the state of the object:

```dart

// A sample class object
class User {
  const User(this.username);
  final String username;
}

```

traditional way:

```dart

// in your business logic
User? user = await api.getUser();
  if (user == null) {
  // do this
  final userName = user.username;
} else {
  // do this
}

```

with helper_options:

```dart

// in your business logic
Option<User> user = Option.of(await api.getUser());
  if (user.isPresent) {
    // do this while getting value as
  final userName = user.value.username;
} else {
  // do this
}

```

Looks cool nah!!!

You may explore options too:

```dart

// this option class comes with other helper methods like
user.empty(); // Creates an empty Option.
user.filter(); // Returns an Option with this Option's value, if there is a value present and it matches the predicate.  Otherwise, returns an empty Option.
user.flatMap(); // Returns an Option provided by applying the mapper to this Option's value,if present.  Otherwise, returns an empty Option.
user.orElse(); // Returns this Option's value, if present.  Otherwise, returns other.
user.orNull(); // Returns this Option's value, if present.  Otherwise, returns null.
user.orElseThrow(); // Returns this Option's value, if present. Otherwise, throws the result of calling supplyError().
user.ifPresent(final val){
// Invokes consume() with this Option's value, if present.
// Otherwise, if orElse is passed, invokes it, otherwise does nothing. 
}

```
---

### OptionWidget:
In another example, we are going to have a super `OptionWidget` to generate the Widget as your data is there:

Traditional way:
```dart

class CustomWidget extends StatelessWidget {
  const CustomWidget({this.user});
  final User? user;

  bool get isEmptyUser => user == null;
  @override
  Widget build(final BuildContext context) {
    if (isEmptyUser) {
      return SizedBox();
    }

    return childWidget();
  }
}

// and then calling in a parent data like this:

ParentWidget(
  child: CustomWidget(user: user),
);

```

with CustomWidget:
```dart

ParentWidget(
  child: OptionWidget<User?>(
    option: Option.of(user),
    empty: final OffStage(), // it is an optional widget to place
    builder: (final context, final user) {
      return Child();
    },
  ),
),

```

> Note: You can use this function in a nicer way with all the objects including primitive data types or custom one  
