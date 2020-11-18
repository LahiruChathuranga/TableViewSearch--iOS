//
//  ViewController.swift
//  TableViewSearchSample
//
//  Created by Lahiru Chathuranga on 11/18/20.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView! {didSet {
        tableView.delegate = self
        tableView.dataSource = self
    }}
    
    @IBOutlet weak var searchBar: UISearchBar! {didSet {
        searchBar.delegate = self
    }}
    
    
    // MARK: - Variable
    fileprivate let cellIdentifire = "SearchTVCell"
    var nameArray = [String]()
    var filteredNameArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTempNames()
    }
    
    func addTempNames() {
        nameArray = ["Nimal", "Kamal", "Sunil", "Gayan", "Lahiru", "Dasun", "Asanka", "Anil", "Dayan", "Sunimal", "Nirmal", "Kusum"]
        self.filteredNameArray = nameArray
        self.tableView.reloadData()
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifire) as? SearchTVCell {
            cell.textLabel?.text = self.filteredNameArray[indexPath.row]
            return cell
        }
        
        return UITableViewCell()
    }
}
extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filteredNameArray = searchText.isEmpty ? self.nameArray : self.nameArray.filter({$0.lowercased().contains(searchText.lowercased())})
        tableView.reloadData()
    }
}
