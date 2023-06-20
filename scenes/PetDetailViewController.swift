//
//  PetDetailViewController.swift
//  petstore
//
//  Created by Fábio Romão on 17/06/23.
//

import UIKit

class PetDetailViewController: UIViewController {

    var strName: String?
    var strDescription: String?
    var strAge: String?
    var strGender: String?
    var strImage: String?
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgPet: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblName.text = strName
        lblDescription.text = strDescription
        lblAge.text = strAge
        lblGender.text = strGender
        imgPet.downloaded(from: strImage ?? "")
    }


}
