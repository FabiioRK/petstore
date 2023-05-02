//
//  HomeProductViewController.swift
//  petstore
//
//  Created by Fábio Romão on 30/04/23.
//

import UIKit

class ProductViewController: UIViewController {
    
    var strTitle: String?
    var strDescription: String?
    var strImage: String?
    var strPrice: String?
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblTitle.text = strTitle
        lblDescription.text = strDescription
        lblPrice.text = strPrice
        imgProduct.image = UIImage(named: strImage!)
    }
    


}
