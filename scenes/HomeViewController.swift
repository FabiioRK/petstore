//
//  HomeViewController.swift
//  petstore
//
//  Created by Fábio Romão on 27/04/23.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    let dataSource = HomeProductDataSource.createMenuItens()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeTableView.dataSource = self
        homeTableView.delegate = self

        self.navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "", style: .plain, target: nil, action: nil)

    }

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var array = Array(dataSource.keys)
        array = array.sorted {
            $0 < $1
        }
        return dataSource[array[section]]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var array = Array(dataSource.keys)
        array = array.sorted {
            $0 < $1
        }
        let item =  dataSource[array[indexPath.section]]?[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell") as! HomeProductCell
        
        if let image = UIImage(named: item?.productImage ?? "") {
            cell.homeProductImage.image = image
        }
        
        cell.homeProductTitle.text = item!.productName
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var array = Array(dataSource.keys)
        array = array.sorted {
            $0 < $1
        }
        return array[section]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("CELULA SELECIONADA")
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! ProductViewController
        
        guard let indexPath = homeTableView.indexPathForSelectedRow else {
            controller.strTitle = ""
            controller.strDescription = ""
            controller.strImage = ""
            controller.strPrice = ""
            return
        }
        
        var array = Array(dataSource.keys)
        array = array.sorted {
            $0 < $1
        }
        
        if let item =  dataSource[array[indexPath.section]]?[indexPath.row] {
            controller.strTitle = item.productName
            controller.strDescription = item.productDescription
            controller.strImage = item.productImage
            controller.strPrice = item.productPrice
        }
        
        
    }
}
