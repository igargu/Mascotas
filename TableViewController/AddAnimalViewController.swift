import UIKit

class AddAnimalViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet var tfAddAnimalName: UITextField!
    @IBOutlet var tfAddAnimalFamily: UITextField!
    @IBOutlet var ivAddAnimal: UIImage!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var animal: Animal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func undWindToAddAnimal (sender: UIStoryboardSegue){
        guard let segue = sender.source as? AnimalListViewController,
                let animal = segue.animal else {
            return
        }
        tfAddAnimalName.text = animal.name
        tfAddAnimalFamily.text = animal.family
        ivAddAnimal = animal.imgAnimal
    }
    
    func configure(with animal: Animal) {
        self.animal = animal
    }
    
    @IBAction func bbiSaveAction(_ sender: UIButton) {
        animal = Animal(name: tfAddAnimalName.text ?? "", family: tfAddAnimalFamily.text ?? "", imgAnimal: ivAddAnimal)
        Animal.animals.append(animal!)
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let button=sender as? UIBarButtonItem,
              button===saveButton
        else{
            return
        }
        animal = Animal(name: tfAddAnimalName.text ?? "", family: tfAddAnimalFamily.text ?? "", imgAnimal: ivAddAnimal)
    }
    
    @IBAction func bbiCancelAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectPhotoImageView(_ sender: Any) {
        // Hide the keyboard.
        tfAddAnimalName.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set mascotaImageView to display the selected image.
        ivAddAnimal = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
}
