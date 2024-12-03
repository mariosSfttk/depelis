//
//  FavoritesView.swift
//  DePelis
//
//  Created by Mario Vargas on 12/11/24.
//

import UIKit
import CoreData


protocol ProtocolFavoritesView {
    var presenter: ProtocolFavoritesPresenter? { get set }
    var managedObject: NSManagedObjectContext! { get set }
}


class FavoritesView: UIViewController, ProtocolFavoritesView {
    var managedObject: NSManagedObjectContext!
    
    var presenter: ProtocolFavoritesPresenter?
    var moviesObject: [NSManagedObject] = []
    
    
    var hasMovies = false
    
    var safeView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .colorNavigation
        return view
    }()
    
    var tblFavMovies: UITableView = {
      let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.allowsSelection = true
        table.separatorStyle = .none
        table.register(MovieCell.self, forCellReuseIdentifier: "Cell")
        table.backgroundColor = .colorBackground
        return table
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .colorBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchMovies()
        addingSubViews()
        setupComponentsView()
        configureTable()
    }
    
    
    @objc
    func createFavorite() {
            self.fetchMovies()
    }
    
    func fetchMovies() {
        let moviesRequest = NSFetchRequest<NSManagedObject>(entityName: Strings.CoreData.entityName)
        do {
            self.moviesObject = try managedObject.fetch(moviesRequest)
            self.hasMovies = self.moviesObject.count > 0
                        
        }catch {
            
        }
        
        DispatchQueue.main.async {
            self.tblFavMovies.reloadData()
        }
    }
}
