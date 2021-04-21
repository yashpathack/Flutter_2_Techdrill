class Person {
  // Name, Age, id
  String name;
  int age;
  int id;


  Person({this.id, this.name, this.age});

  Map <String, dynamic> toMap() {

    return {
      'id' : id,
      'name' : name,
      'age' : age
    };

   }

   @override
     String toString() {
       // TODO: implement toString
       return 'Person {id : $id, name: $name, age: $age}';
     }


}
