//
//  InitViewEntity.swift
//  DePelis
//
//  Created by Mario Vargas on 09/11/24.
//

import Foundation


struct TopRateMovies: Codable {
    let page: Int
    let results: [Results]
}

struct Results: Codable {
    let adult: Bool
    let backdrop_path: String
    let original_title: String
    let overview: String
    let release_date: String
    let title: String
    let vote_average: Double
    let poster_path: String
    let original_language: String
}
