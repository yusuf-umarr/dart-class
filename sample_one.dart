void main() {
  Cat c1 = Cat();
  print(c1.makeSound());
}

class Animal {
  void makeSound() {
    print("Some generic animal sound.");
  }
}

class Dog extends Animal {
  @override
  void makeSound() {
    print("Woof!");
  }
}

class Cat extends Animal {
  @override
  String makeSound() {
    // print("Meow!");
    return "Meow";
  }
}

// }