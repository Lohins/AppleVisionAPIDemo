//
//  TextDetectionViewController.swift
//  AppleVisionDemo
//
//  Created by S.t on 2017/10/23.
//  Copyright © 2017年 S.t. All rights reserved.
//

import UIKit

class TextDetectionViewController: UIViewController {

    @IBOutlet var loadingView: UIActivityIndicatorView!
    
    @IBOutlet var selectImageItem: UIBarButtonItem!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var textLabel: UILabel!
    
    let viewModel = TextDetectionViewModel.init()
    
    let imagePicker = UIImagePickerController.init()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Text Detection"
        
        self.imagePicker.delegate = self
    }
    
    func updateImageData(){
        guard let image = self.imageView.image else {
            return
        }
        self.selectImageItem.isEnabled = false
        self.loadingView.startAnimating()
        self.viewModel.detectText(forImage: image, withCompletion: { (newImage) in
            DispatchQueue.main.async {
                self.selectImageItem.isEnabled = true
                self.imageView.image = newImage
                self.loadingView.stopAnimating()
                self.textLabel.text = "Finish Detecting."
            }
        })
    }

    @IBAction func selectImageAction(_ sender: Any) {
        self.navigationController?.present(self.imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    

}

extension TextDetectionViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else{
            return
        }
        
        self.imageView.image = image
        
        self.updateImageData()
    }
}
