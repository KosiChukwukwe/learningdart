void main() {
  /**
   * Practise for the chapter 9 - creating sub classes using extends
   */

  //the classes for these initialisation is below. lines 19 to 34

  final jon = Person('Jon', 'Snow');
  final jane = Student('Jane', 'Snow');
  print(jon.fullName);
  print(jane.fullName);

  final historyGrade = Grade.B;
  jane.grades.add(historyGrade);

  final jessie = SchoolBandMember('Jessie', 'Jones');
  final marty = StudentAthlete('Marty', 'McFly');

  final students = [jane, jessie, marty];
  print(jessie is Object);
  print(jessie is Person);
  print(jessie is Student);
  print(jessie is SchoolBandMember);
  print(jessie is! StudentAthlete);

  //First Mini Challenge on inheritance using extends:

  //QUESTION ONE

  /**
   * Create a class named Fruit with a String field 
   * named color and a method named describeColor, 
   * which uses color to print a message.
   */

  //Answer: the class are below

  //QUESTION TWO

  /**
   * Create a subclass of Fruit named Melon and 
   * then create two Melon subclasses 
   * named Watermelon and Cantaloupe.
   */

  //Answer: the classes are below - 97 to 112

  //QUESTION THREE

  /**
   *  Override describeColor in the Watermelon class to vary the output.
   */

  //Answer: lines 112 to 114

  // checking to see if the question three gives desired output

  final fruit = Fruit('green');
  fruit.describeColor();

  final watermelon = Watermelon('red');
  watermelon.describeColor();

  /**
   * Practise for the chapter 9 - creating abstract classes and
   * their resp. sub classes
   */

  //the classes for these initialisation is below. lines 19 to 34

  Animal platypus = Platypus();
  print(platypus.isAlive);
  platypus.eat();
  platypus.move();
  //platypus.layEggs();
  print(platypus);

  //Second Mini Challenge on abstract classes using implements:

  //QUESTION ONE

  /**
   * Create an interface called Bottle and add a method to it called open
   */

  //Answer: the class is below

  //QUESTION TWO

  /**
   * Create a concrete class called SodaBottle that implements Bottle and 
   * prints “Fizz fizz” when open is called.
   */

  //Answer: the class is below

  //QUESTION THREE

  /**
   *  Add a factory constructor to Bottle that returns a SodaBottle instance.
   */

  //Answer: lines 201

  //QUESTION FOUR

  /**
   * Instantiate SodaBottle by using the Bottle factory constructor 
   * and call open on the object.
   */

  // checking to see if the question four gives desired output

  final bottle = Bottle();
  final sodaBottle = bottle.open();

  //Third Mini Challenge on mixins:

  //QUESTION ONE

  /**
   * Create a class called Calculator with a method called sum that 
   * prints the sum of any two integers you give it.
   */

  //Answer: the class is in line 242

  //QUESTION TWO

  /**
   *  Extract the logic in sum to a mixin called Adder.
   */

  //QUESTION THREE

  /**
   *  Use the mixin in Calculator.
   */

  //Answers to 2 and 3: lines 244 to 248

  // checking to see if the question three gives desired output

  final adder = Calculator();
  adder.sum(7, 6);
}

enum Grade { A, B, C, D, F }

class Person {
  Person(this.givenName, this.surname);
  String givenName;
  String surname;
  String get fullName => '$givenName $surname';
  @override
  String toString() => fullName;
}

class Student extends Person {
  Student(String givenName, String surname) : super(givenName, surname);
  var grades = <Grade>[];

  @override
  String get fullName => '$surname, $givenName';
}

class SchoolBandMember extends Student {
  SchoolBandMember(String givenName, String surname)
      : super(givenName, surname);
  static const minimumPracticeTime = 2;
}

class StudentAthlete extends Student {
  StudentAthlete(String givenName, String surname) : super(givenName, surname);
  bool get isEligible => grades.every((grade) => grade != Grade.F);
}

class Fruit {
  Fruit(this.color);
  String color;

  void describeColor() {
    print('the color of this fruit is $color');
  }
}

class Melon extends Fruit {
  Melon(String color) : super(color);
}

class Watermelon extends Fruit {
  Watermelon(String color) : super(color);

  @override
  void describeColor() {
    print('i wish this fruit was not $color');
  }
}

class Cantaloupe extends Fruit {
  Cantaloupe(String color) : super(color);
}

abstract class Animal {
  bool isAlive = true;
  void eat();
  void move();

  @override
  String toString() {
    return "I'm a $runtimeType";
  }
}

class Platypus extends Animal {
  @override
  void eat() {
    print('Munch munch');
  }

  @override
  void move() {
    print('Glide glide');
  }

  void layEggs() {
    print('Plop plop');
  }
}

abstract class Bottle {
  factory Bottle() => SodaBottle();
  void open();
}

class SodaBottle implements Bottle {
  @override
  void open() {
    print('Fizz fizz');
  }
}

class Calculator with Adder {}

mixin Adder {
  void sum(int a, int b) {
    print(a + b);
  }
}
