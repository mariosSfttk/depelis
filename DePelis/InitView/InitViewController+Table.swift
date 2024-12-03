//
//  InitViewController+Table.swift
//  DePelis
//
//  Created by Mario Vargas on 09/11/24.
//

import Foundation
import UIKit


extension InitViewController: UITableViewDelegate, UITableViewDataSource {
    
    func configureTable() {
        tblMovies.delegate = self
        tblMovies.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! MovieCell
        let info = filteredMovies[indexPath.row]
        cell.setData(data: info)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(DetailViewRouter.start(results: filteredMovies[indexPath.row], managedObject: self.managedObject).view!, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if !isSearching {
            if indexPath.row == filteredMovies.count - 1 {
                counterPage += 1
                sendRequest()
            }
        }
    }
    
    
}
