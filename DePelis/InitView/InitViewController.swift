//
//  InitViewController.swift
//  DePelis
//
//  Created by Mario Vargas on 09/11/24.
//

import UIKit
import CoreData


protocol ProtocolInitViewController {
    var presenter: ProtocolInitViewPresenter? { get set }
    var userName: String? { get set }
    var managedObject: NSManagedObjectContext! { get set }
    
    func receiveMovies(movies: [Results])
}

class InitViewController: UIViewController, ProtocolInitViewController {
    var managedObject: NSManagedObjectContext!
    var movies = [Results]()
    var filteredMovies = [Results]() {
        didSet {
            DispatchQueue.main.async {
                self.tblMovies.reloadData()
            }
        }
    }
    var presenter: (any ProtocolInitViewPresenter)?
    var counterPage: Int = 1
    var isSearching = false
    var userName: String?
    
    
    var headerView: UIView = {
      let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .colorNavigation
        return view
    }()
    
    var iconSearch: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.image = UIImage(systemName: Strings.Icons.magnifyingglassIcon)
        imgView.backgroundColor = .colorTextBackground
        imgView.tintColor = .colorNavigation
        imgView.layer.cornerRadius = 8
        imgView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        imgView.layer.borderWidth = 2
        imgView.layer.borderColor = UIColor.colorTextBackground.cgColor
        return imgView
    }()
    
    lazy var txtSearch: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.borderStyle = .roundedRect
        txt.font = UIFont.systemFont(ofSize: 18)
        txt.placeholder = Strings.WelcomeScreen.searchText
        txt.addTarget(self, action: #selector(updateTextField), for: .editingChanged)
        txt.backgroundColor = .colorTextBackground
        return txt
    }()
        
    var tblMovies: UITableView = {
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
        // Do any additional setup after loading the view.
        
        addingSubViews()
        setupComponentsView()
        
        configureTable()
        
        view.backgroundColor = .colorBackground
        sendRequest()
        
    }
    
    func receiveMovies(movies: [Results]) {
        self.movies = self.movies + movies
        filterMovies(movies: self.movies)
    }
    
    func sendRequest() {
        Loader.sharedInstance.showIndicator(view: self)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.presenter?.invokeTopRatedService(forPage: self.counterPage)
        }
    }
    
    func filterMovies(movies: [Results]) {
        self.filteredMovies = movies
    }
    
    @objc
    func didPressLogout() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    func updateTextField(_ textField: UITextField) {
        if txtSearch.text?.count == 0 {
            filterMovies(movies: self.movies)
            isSearching = false
        } else {
            isSearching = true
            let tempMovies = self.movies.filter{$0.title.uppercased().contains(txtSearch.text!.uppercased())}
            filterMovies(movies: tempMovies)
        }
    }


}
