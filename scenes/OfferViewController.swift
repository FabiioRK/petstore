//
//  OfferViewController.swift
//  petstore
//
//  Created by Fábio Romão on 01/05/23.
//

import UIKit

class OfferViewController: UIViewController {
    
    @IBOutlet weak var offerTableView: UITableView!
    
    let dataSource = OfferProductDataSource.createMenuItens()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        offerTableView.dataSource = self
        offerTableView.delegate = self

        self.navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "", style: .plain, target: nil, action: nil)

    }

}

extension OfferViewController: UITableViewDataSource, UITableViewDelegate {
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "offerCell") as! OfferProductCell
        
        if let image = UIImage(named: item?.productImage ?? "") {
            cell.offerProductImage.image = image
        }
        
        cell.offerProductTitle.text = item!.productName
        
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
        
        guard let indexPath = offerTableView.indexPathForSelectedRow else {
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
