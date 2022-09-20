//
//  CreateNewsController.swift
//  NYTimesNewsApp
//
//  Created by Shamkhal Guliyev on 17.09.22.
//

import UIKit

class CreateNewsController: UIViewController {
    @IBOutlet private weak var titleTextField: UITextField!
    @IBOutlet private weak var descTextView: UITextView!
    @IBOutlet private weak var photoImage: UIImageView!
    @IBOutlet private weak var createButton: UIButton!
    
    var isPhotoSelected = false
    let viewModel = CreateNewsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(removeKeyboard)))
        
        descTextView.setupBorder(1)
        createButton.setupBorder(1)
    }
    
    @objc fileprivate func removeKeyboard() {
//        view.endEditing(true)
        descTextView.resignFirstResponder()
        titleTextField.resignFirstResponder()
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Choose one option", message: "", preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let camera = UIAlertAction(title: "Camera", style: .default) { _ in
            self.setupImagePicker(type: .camera)
        }
        let gallery = UIAlertAction(title: "Photo Library", style: .default) { _ in
            self.setupImagePicker(type: .photoLibrary)
        }
        alertController.addAction(camera)
        alertController.addAction(gallery)
        alertController.addAction(cancel)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func createButtonTapped(_ sender: Any) {
        if let textCheck = titleTextField.text?.isEmpty, !textCheck, !descTextView.text.isEmpty {
            if isPhotoSelected {
                viewModel.uploadImage(image: photoImage.image ?? UIImage(), name: titleTextField.text ?? "") {
                    self.viewModel.createNews(title: self.titleTextField.text ?? "",
                                              desc: self.descTextView.text) {
                        
                        self.descTextView.text = ""
                        self.titleTextField.text = ""
                        self.photoImage.image = nil
                    }
                }
            } else {
                viewModel.createNews(title: titleTextField.text ?? "",
                                     desc: descTextView.text) {
                    
                    self.descTextView.text = ""
                    self.titleTextField.text = ""
                }
            }
        }
    }
}

extension CreateNewsController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

extension CreateNewsController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func setupImagePicker(type: UIImagePickerController.SourceType) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = type
//        pickerController.mediaTypes = ["public.movie", "public.image"]
        present(pickerController, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as? UIImage
        photoImage.image = image
        isPhotoSelected = true
        picker.dismiss(animated: true, completion: nil)
    }
}
