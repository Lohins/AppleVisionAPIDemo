//
//  BarcodeDetectionViewController.swift
//  AppleVisionDemo
//
//  Created by S.t on 2017/10/23.
//  Copyright © 2017年 S.t. All rights reserved.
//

import UIKit

class BarcodeDetectionViewController: UIViewController {

    // Properties
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var selectImageItem: UIBarButtonItem!
    @IBOutlet var loadingView: UIActivityIndicatorView!
    
    @IBOutlet var textLabel: UILabel!
    
    let viewModel = BarcodeDetectionViewModel.init()
    
    let imagePicker = UIImagePickerController.init()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Barcode Detection"
        
        self.imagePicker.delegate = self
    }


    @IBAction func selectImageAction(_ sender: Any) {
        self.navigationController?.present(self.imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func dismissAction(_ sender: Any) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    func updateImageData(){
        guard let image = self.imageView.image else {
            return
        }
        self.selectImageItem.isEnabled = false
        self.loadingView.startAnimating()
        self.viewModel.barcodeDetect(forImage: image, withCompleter: { (image) in
            DispatchQueue.main.async {
                self.selectImageItem.isEnabled = true
                self.imageView.image = image
                self.loadingView.stopAnimating()
                self.textLabel.text = "Finish Detecting."
            }

        })
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension BarcodeDetectionViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else{
            return
        }
        
        self.imageView.image = image
        
        self.updateImageData()
    }
}
