//
//  FaceDetectionViewController.swift
//  AppleVisionDemo
//
//  Created by S.t on 2017/10/22.
//  Copyright © 2017年 S.t. All rights reserved.
//

import UIKit

import Vision

class FaceDetectionViewController: UIViewController {
    
    // MARK : Properties
    
    let imagePicker = UIImagePickerController.init()
    @IBOutlet var selectImageButtonItem: UIBarButtonItem!
    
    @IBOutlet var activityView: UIActivityIndicatorView!
    
    @IBOutlet var textLabel: UILabel!
    
    @IBOutlet var imageView: UIImageView!
    
    let viewModel = FaceDetectionViewModel()
    
    // Save the file url of selected image.
    var image : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Face Detection"
        
        self.imagePicker.delegate = self
    }
    
    func reloadImageData(){
        if let image = self.image {
            self.textLabel.text = "Detection begins."
            self.activityView.startAnimating()
            self.selectImageButtonItem.isEnabled = false
            self.imageView.image = image
            self.viewModel.generateImage(image: image, Completion: { (newImage) in
                DispatchQueue.main.async {
                    self.activityView.stopAnimating()
                    self.selectImageButtonItem.isEnabled = true
                    self.imageView.image = newImage
                    self.textLabel.text = "Detection finished."
                }
            })
        }
    }
    
    // MARK : Actions
    
    @IBAction func oneTapAction(_ sender: Any) {
        print("Tap print.")
        self.navigationController?.present(self.imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier{
            if identifier == "FaceDetectionSettingSegue"{
                if let destination = segue.destination as? FaceDetectionSettingVC{
                    destination.delegate = self
                }
            }
        }
    }

}

extension FaceDetectionViewController: FaceDetectionSettingProtocol{
    func updateImageDisplay() {
        self.reloadImageData()
    }
}


extension FaceDetectionViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else{
            return
        }
        self.image = image
        self.imageView.image = image
        
//        self.faceDetection()
//        self.faceLandmark()
        self.reloadImageData()
    }
    
}
