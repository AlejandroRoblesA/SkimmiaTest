//
//  ProfileController.swift
//  Skimmia
//
//  Created by Alejandro Robles on 26/01/21.
//

import UIKit

//MARK: - Profile class
extension Profile: UIScrollViewDelegate {
    
    //MARK: - Life cycle
    override func viewDidAppear(_ animated: Bool) {
        fetchForm()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.delegate = self
        userNameTextField.delegate = self
        lastNameTextField.delegate = self
        setupNavigationBar()
        setupConstraints()
        scrollView.setupKeyboard()
        hideKeyboardWhenTappedAround()
    }
    
    //MARK: - Navigation Bar
    func setupNavigationBar(){
        navigationItem.title = "Usuario"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .clear
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Guardar", style: .plain, target: self, action: #selector(handleSave))
    }
    
    //MARK: - Validations
    func fieldsValidation() -> Bool{
        if (userNameTextField.text != ""){
            if (lastNameTextField.text != ""){
                if(biographyTextView.text != ""){
                    alert(title: "", message: "Su información se ha gurdado de forma correcta.")
                    return true
                }
                else{
                    alert(title: "Biografía", message: "Escriba su biografía.")
                }
            }
            else{
                alert(title: "Apellido", message: "Es necesario que escriba su apellido.")
            }
        }
        else{
            alert(title: "Nombre", message: "Es necesario que escriba su nombre.")
        }
        
        return false
    }
    
    func alert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let button = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
        alert.addAction(button)
        present(alert, animated: true, completion: nil)
    }
    
    @objc func handleSave(){
        dismissKeyboard()
        if (fieldsValidation()){
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let form = Form(context: context)
            
            form.name = userNameTextField.text
            form.lastName = lastNameTextField.text
            form.biography = biographyTextView.text
            
            do{
                try context.save()
            }
            catch{
                print(error.localizedDescription)
            }
        }
    }
    
    @objc func handleImage(){
        let controller = UIImagePickerController()
        controller.sourceType = .photoLibrary
        controller.delegate = self
        controller.allowsEditing = true
        present(controller, animated: true, completion: nil)
    }
    
    func fetchForm(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            dataForm = try context.fetch(Form.fetchRequest())
            
            if (dataForm?.count == 0){
                print("First Time")
            }
            else{
                DispatchQueue.main.async {
                    self.userNameTextField.text = self.dataForm?[0].name
                    self.lastNameTextField.text = self.dataForm?[0].lastName
                    self.biographyTextView.text = self.dataForm?[0].biography
                }
            }
        }
        catch{
            print(error.localizedDescription)
        }
    }
}

extension Profile: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


//MARK: - UIImagePicker
extension Profile: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage{
            photoUserImage.image = image
            
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
