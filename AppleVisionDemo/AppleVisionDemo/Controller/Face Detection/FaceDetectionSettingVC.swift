//
//  FaceDetectionSettingVC.swift
//  AppleVisionDemo
//
//  Created by S.t on 2017/10/22.
//  Copyright © 2017年 S.t. All rights reserved.
//

import UIKit


protocol FaceDetectionSettingProtocol {
    func updateImageDisplay()
}

class FaceDetectionSettingVC: UITableViewController {
    
    var delegate: FaceDetectionSettingProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(FaceDetectionSettingTVC.classForCoder(), forCellReuseIdentifier: FaceDetectionSettingTVC.identifier)
        
        self.tableView.tableFooterView = UIView.init()
        self.tableView.tableHeaderView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 20, height: 20))
    }
    
    @IBAction func doneAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        self.delegate?.updateImageDisplay()
    }
    
    
    private enum Section : Int{
        case FaceDetectionType
        case MarkColor
        case MarkWidth
        
        var numberOfRows: Int{
            switch self {
            case .FaceDetectionType:
                return 2
            case .MarkColor:
                return 4
            case .MarkWidth:
                return 2
            }
        }
        
        static var count: Int{
            return Section.MarkWidth.rawValue + 1
        }
        
        var text: String{
            switch self {
            case .FaceDetectionType:
                return "Face Detection Type"
            case .MarkColor:
                return "Mark Color"
            case .MarkWidth:
                return "Mark Width"
            }
        }
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return Section.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = Section(rawValue:section) else{
            fatalError("Invalid index path.")
        }
        return section.numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let section = Section(rawValue: section) else{
            fatalError("Invalid index path.")
        }
        return section.text
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FaceDetectionSettingTVC.identifier, for: indexPath) as? FaceDetectionSettingTVC, let section = Section(rawValue: indexPath.section) else{
            fatalError("Invalid index path.")
        }
        var viewModel : FD_SettingViewModelProtocol?
        switch section {
        case .FaceDetectionType:
            guard let type = FaceDetectionType(rawValue: indexPath.row) else{
                fatalError("Invalid Index.")
            }
            viewModel = FD_SettingTypeViewModel(model: type)
        case .MarkColor:
            guard let markColor = MarkColor(rawValue: indexPath.row) else{
                fatalError("Invalid Index.")
            }
            viewModel = FD_SettingMarkColorViewModel(model: markColor)
        case .MarkWidth:
            guard let markWidth = MarkWidth(rawValue: indexPath.row) else{
                fatalError("Invalid Index.")
            }
            viewModel = FD_SettingMarkWidthViewModel(model: markWidth)
        }
        
        if let viewModel = viewModel{
            cell.configure(withModel: viewModel)

        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView.init(frame: CGRect.init(x: 0, y: 0, width: 10, height: 20))
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let section = Section(rawValue: indexPath.section) else{
            fatalError("Invalid index path.")
        }
        switch section {
        case .FaceDetectionType:
            let oldValue = UserDefaults.faceDetectionType()
            guard indexPath.row != oldValue.rawValue else{return}
            
            if let newValue = FaceDetectionType(rawValue: indexPath.row){
                UserDefaults.setFaceDetectionType(withType: newValue)
            }
        case .MarkColor:
            let oldValue = UserDefaults.markColor()
            guard oldValue.rawValue != indexPath.row else{return}
            
            if let newValue = MarkColor(rawValue: indexPath.row){
                UserDefaults.setMarkColor(withType: newValue)
            }
        case .MarkWidth:
            let oldValue = UserDefaults.markWidth()
            guard oldValue.rawValue != indexPath.row else{return}
            
            if let newValue = MarkWidth(rawValue: indexPath.row){
                UserDefaults.setMarkWidth(withType: newValue)
            }
        }
        
        tableView.reloadSections(IndexSet.init(integer: indexPath.section), with: .automatic)
    }

}
