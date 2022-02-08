import UIKit

struct Animal {
    var name: String
    var family: String
    var imgAnimal: UIImage? = nil
}

extension Animal {
    static var animals = [
        Animal(name: "Abbath", family: "Gato", imgAnimal:UIImage(named:"ivPersianCat")),
        Animal(name: "Sparky", family: "Perro", imgAnimal:UIImage(named:"ivCorgiDog")),
        Animal(name: "Señor Bigotes", family: "Hamster", imgAnimal:UIImage(named:"ivHamster")),
        Animal(name: "Saltitos", family: "Conejo", imgAnimal:UIImage(named:"ivBunny")),
        Animal(name: "BebeAgua", family: "Pez", imgAnimal:UIImage(named:"ivClownFish")),
        Animal(name: "Stevie Wonder", family: "Topo", imgAnimal:UIImage(named:"ivTopo"))
    ]
}
