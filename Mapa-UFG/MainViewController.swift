//
//  ViewController.swift
//  Mapa-UFG
//
//  Created by Tiago Ferreira Hermano on 20/05/17.
//  Copyright © 2017 Tiago Hermano. All rights reserved.
//

import UIKit
import GoogleMaps

class MainViewController: UIViewController {

    @IBOutlet weak var googleMap: Map!
    @IBOutlet weak var circularMenuButton: UIButton!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    var selectedCategory: String?
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = false
        
        sideMenu()
        
        let map = Map()
        
        let campusSamambaia = CLLocation.init(latitude: -16.6021102, longitude: -49.2656253)
        let mapView = map.setInitialMap(location: campusSamambaia)
        
//        let reuni = CLLocationCoordinate2D(latitude: -16.6035343, longitude: -49.2664894)
//        let marker = Marker(nome: "Reuni", descricao: "Lanchonete", localizacao: reuni, icone: #imageLiteral(resourceName: "PLACEHOLDERS-1"))
//        marker.map = mapView
        
//        map.drawPath(destination: reuni)
        
        view.insertSubview(mapView, at: 1)
        
        print("Categoria Selecionada: \(self.selectedCategory)")
        
//        let mapView = Map.setInitialMap()
//        view = mapView
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func sideMenu() {
        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

