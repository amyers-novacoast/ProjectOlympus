//
//  ContactsViewController.swift
//  TableViewTest
//
//  Created by Emily Thomas on 9/19/18.
//  Copyright © 2018 TS Myers. All rights reserved.
//

import UIKit
import Firebase
//import FirebaseCore
//import FirebaseFirestore

class contactsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let cellId = "cellId"
    let routesTableView = UITableView()
    private var routes = RouteAPI.getRoutes()
    let db = Firestore.firestore()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return routes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! RouteTableViewCell
//        cell.textLabel?.text = routes[indexPath.row].name
        cell.route = routes[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func setUpNavigation() {
        navigationItem.title = "Routes"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)]
    }
    
    func reloadWithNewRoute() {

        
        print("Current number of routes: \(routes.count)")

        routes = RouteAPI.getRoutes()
        routes.sort(by:{ $0.sortRating! < $1.sortRating!})
        routesTableView.reloadData()
        print("Updated number of routes: \(routes.count)")
        
    }
    
    @objc func moveToSecond() {
        show(SecondViewController(), sender: self)
    }
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .orange
        view.addSubview(routesTableView)

        routesTableView.translatesAutoresizingMaskIntoConstraints = false
        routesTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        routesTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        routesTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        routesTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true

        routesTableView.register(RouteTableViewCell.self, forCellReuseIdentifier: cellId)
        routesTableView.delegate = self
        routesTableView.dataSource = self
        
        setUpNavigation()
        // Do any additional setup after loading the view.
        let nextButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(moveToSecond))
        navigationItem.rightBarButtonItem = nextButton
        print("View Did Load")
    
        let settingsButton = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(showMenu))
        navigationItem.leftBarButtonItem = settingsButton
        print("Loading Settings")
        
    }

    let settingsLauncher = SettingsLauncher()
    
    @objc func showMenu() {
        settingsLauncher.showSettings()
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadWithNewRoute()
        
    }

}

