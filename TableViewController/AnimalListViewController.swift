import UIKit

class AnimalListViewController: UITableViewController {
    
    static let showDetailSegueIdentifier = "ShowReminderDetailSegue"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Self.showDetailSegueIdentifier,
           let destination = segue.destination as? AddAnimalViewController,
           let cell = sender as? UITableViewCell,
           let indexPath = tableView.indexPath(for: cell) {
            let animal = Animal.animals[indexPath.row]
            destination.configure(with: animal)
        }
    }
    
    var animal:Animal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func configure(with animal:Animal) {
        self.animal = animal
    }
    
    @IBAction func undWindToAnimalList (sender: UIStoryboardSegue){
        guard let segue = sender.source as? AddAnimalViewController,
                let animal = segue.animal else {
            return
        }
        let newIndexPath = IndexPath(row: Animal.animals.count, section:0)
        Animal.animals.append(animal)
        tableView.insertRows(at: [newIndexPath], with: .automatic)
        
    }
    
}

extension AnimalListViewController {
    
    static let animalListCellIdentifier = "AnimalListCell"
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Animal.animals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Self.animalListCellIdentifier, for: indexPath) as? AnimalListCell else {
            fatalError("Unable to dequeue ReminderCell")
    }
        let animal = Animal.animals[indexPath.row]
        cell.lbName.text = animal.name
        cell.lbFamily.text = animal.family
        cell.imgAnimal.image = animal.imgAnimal
        return cell
    }
}
