//
//  MainPageViewController.swift
//  AppleVisionDemo
//
//  Created by S.t on 2017/10/20.
//  Copyright © 2017年 S.t. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController {
    
    // MARK : Properties
    
    
    
    let viewModel = MainPageViewModel.init()

    @IBOutlet var contentTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Vision Kit Demo"

        self.contentTableView.delegate = self
        self.contentTableView.dataSource = self
        self.contentTableView.register(MP_FuncTableViewCell.classForCoder(), forCellReuseIdentifier: MP_FuncTableViewCell.identifier)
        self.contentTableView.tableFooterView = UIView.init()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



extension MainPageViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.number
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MP_FuncTableViewCell.identifier, for: indexPath) as? MP_FuncTableViewCell, let text = viewModel.title(forIndex: indexPath.row) else{
            fatalError("Invalid Index Path.")
        }
        //  Configure Cell Content.
        cell.configure(withText: text)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let functionType = VisionFunction(rawValue: indexPath.row) else{
            fatalError("Invalid Index Path.")
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch functionType {
        case .FaceDetection:
            print(functionType.text())
        case .RectangleDetection:
            print(functionType.text())
        case .BarcodeDetection:
            print(functionType.text())
        case .TextDetection:
            print(functionType.text())
        case .ObjectTracking:
            print(functionType.text())
        }

    }
}
