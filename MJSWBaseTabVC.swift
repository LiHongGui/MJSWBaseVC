//
//  MJSWBaseVC.swift
//  MJSWBaseVC
//
//  Created by MichaelLi on 2020/11/19.
//

import UIKit
let cellID = "cellID"
class MJSWBaseTabVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = String(format: "UITableViewDefauleCell %d",indexPath.row)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }

    // MARK: 懒加载
//    lazy var tableView : UITableView = UITableView()
    lazy var tableView : UITableView? = {
        let tempTableView = UITableView (frame: self.view.bounds, style:.plain)
        tempTableView.delegate = self
        tempTableView.dataSource = self
        tempTableView.backgroundColor = UIColor.white
        tempTableView.separatorStyle = .singleLine
        return tempTableView
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        self.view.addSubview(tableView!)
        print("mjNavBarHeight:%d\(MJMichaelSW.mjNavBarHeight)")
    }
    
}
extension MJSWBaseTabVC {
    static var setupUI :CGFloat {
        return 1
    }
}
