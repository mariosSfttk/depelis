//
//  FavoritesView+TableView.swift
//  DePelis
//
//  Created by Mario Vargas on 13/11/24.
//

import Foundation
import UIKit


extension FavoritesView: UITableViewDelegate, UITableViewDataSource {
    
    func configureTable() {
        tblFavMovies.delegate = self
        tblFavMovies.dataSource = self
        registerCell()
    }
    
    func registerCell() {
        tblFavMovies.register(FavMovieCell.self, forCellReuseIdentifier: FavMovieCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesObject.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavMovieCell.identifier) as! FavMovieCell
        cell.managedObject = self.managedObject
        cell.delegate = self
        let info = moviesObject[indexPath.row] as! Movies
        cell.setData(data: info)
        return cell
    }
    
    
}
