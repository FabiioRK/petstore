//
//  AdoptPetViewController.swift
//  petstore
//
//  Created by Fábio Romão on 17/06/23.
//

import UIKit

class AdoptPetViewController: UIViewController {
    
    @IBOutlet weak var adoptTableView: UITableView!

    let petList = PetList()
    var pets: [Pets]!
    var animals: [(section: String, details: [String])] = []
//    var animalsImage: [(section: String, details: [String])] = []
    let loadingViewController = LoadingViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        petList.fetchAnimals()
        
        loadingViewController.modalTransitionStyle = .coverVertical
        loadingViewController.modalPresentationStyle = .fullScreen
        self.present(loadingViewController, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    func setDelegates() {
        adoptTableView.delegate   = self
        adoptTableView.dataSource = self
        petList.delegate   = self
    }

}

extension AdoptPetViewController: AnimalList {
    func displayAnimalList() {
        self.pets = petList.animals
        
        var stringValues: [String: [String]] = [:]
//        var imageValues: [String: [String]] = [:]

        if let animals = petList.animals {
            for animal in animals {
                let name = animal.name ?? ""
//                let photos = animal.photoURL ?? ""
                
                if name != "" {
                    let initial = name.prefix(1).capitalized
                    stringValues[initial, default: []].append(name)
                }
//                if photos != "" {
//                    let initial = name.prefix(1).capitalized
//                    imageValues[initial, default: []].append(photos)
//
//                }
//                else if photos == "" {
//                    let initial = name.prefix(1).capitalized
//                    imageValues[initial, default: []].append("")
//                }
            }
            
            for (key, value) in stringValues {
                self.animals.append((section: key, details: value))
            }
            
//            for (key, value) in imageValues {
//                self.animalsImage.append((section: key, details: value))
//            }
        }
        adoptTableView.reloadData()
        self.loadingViewController.loadingOff()
    }
    
    func displayTestData() {
        self.animals = []
    }
}


extension AdoptPetViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       return "Animals"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if petList.animals == nil {
            return 0
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if petList.animals == nil {
            return 0
        }
        
        return petList.animals?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = petList.animals?[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "adoptCell") as? AdoptPetCell {
            cell.adoptPetTitle.text = item?.name
            cell.adoptPetImage.downloaded(from: item?.photoURL ?? "")
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! PetDetailViewController
        
        guard let indexPath = adoptTableView.indexPathForSelectedRow else {
            controller.strName = ""
            controller.strDescription = ""
            controller.strImage = ""
            controller.strAge = ""
            controller.strGender = ""
            return
        }
        
        if let item = petList.animals?[indexPath.row] {
            controller.strName = item.name
            controller.strDescription = item.description
            controller.strImage = item.photoURL
            controller.strAge = item.age
            controller.strGender = item.gender
        }
    }
}

extension AdoptPetViewController: UITableViewDelegate {}

