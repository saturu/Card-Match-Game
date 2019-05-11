import 'dart:math';

class Animal{
  String name;
  String imageUrl;

  Animal(this.name, this.imageUrl);

  @override
  String toString() {
    return 'Animal{name: $name}';
  }

}
List<Animal> getFiveAnimals(){
  List<Animal> allAnimals = [
    Animal("Caracal Caracal", "caracal.png"),
    Animal("Lynx Lynx", "lynx_lynx.png"),
    Animal("Acinonyx Jubatus","Acinonyx_jubatus.png"),
    Animal("Panthera Pardus", "panthera_pardus.png",),
    Animal("Uncia Uncia", "uncia_uncia.png",),
    Animal("Aka Puma", "aka_puma.png",),
    Animal("Panthere Onca", "panthere_onca.png",),
    Animal("Neofelis Nebulosa","neofelis_nebulosa.png",),
    Animal("Panthera Leo", "panthera_leo.png",),
    Animal("Panthera Tigris", "panthera_tigris.png",)
  ];
  allAnimals.shuffle(Random.secure());
  print(allAnimals);
  List<Animal> fiveAnimal = [];
  for(int i = 0 ; i<5;i++){
    fiveAnimal.add(allAnimals[i]);

  }

  return fiveAnimal;
}









