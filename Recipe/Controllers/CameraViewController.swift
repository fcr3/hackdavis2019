//
//  CameraViewController.swift
//  Recipe
//
//  Created by Flaviano Reyes on 2/10/19.
//  Copyright © 2019 Christian Reyes. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    weak var imgPickerDelegate: (UINavigationControllerDelegate & UIImagePickerControllerDelegate)?
    let imagePicker = UIImagePickerController()
    var tableData: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    @IBAction func pressedCamera(_ sender: UIBarButtonItem) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary) {
            
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : AnyObject]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            let vision = Vision.vision()
            let textRecognizer = vision.cloudTextRecognizer()
            let img = VisionImage(image: pickedImage)
            // recognise
            textRecognizer.process(img) { result, error in
                guard error == nil, let r = result else {
                    return
                }
                let resultText = r.text
                print(resultText)
                
                for block in r.blocks {
                    for line in block.lines {
                        for element in line.elements {
                            self.tableData.append(element.text.lowercased())
                        }
                    }
                }
                
                
                
                
            }
            
        }
        
        dismiss(animated: true, completion: nil)
    }

}
