# Helper options

A generic package created to handle your objects, widgets in a nicer way.

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
   Option<User>? user = await api.getUser();
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
```

with CustomWidget:
```dart
ParentWidget(
    child: CustomWidget<User?>(
    option: Option.of(user),
    empty: final OffStage(), // it is an optional widget to place
    builder: (final context, final user) {
      return Child();
    },
  ),
),
```


