//
//  ServerConstants.swift
//  DePelis
//
//  Created by Mario Vargas on 09/11/24.
//

import Foundation



let API_KEY = "bb08c901ddd0212fe29f2310ea277f82"
let BASE_API_URL = "https://api.themoviedb.org/3/"
let AUTHENTICATION_LOGIN = "authentication/token/validate_with_login?api_key="
let URL_FOR_TOP_RATED_MOVIES = "https://api.themoviedb.org/3/movie/top_rated?api_key="
let URL_FOR_IMAGE = "https://image.tmdb.org/t/p/w500"


///Server operations
let OPERATION_REQUEST_TOKEN             = 10001
let OPERATION_VALIDATE_LOGIN            = 10002
let OPERATION_TOP_RATED_MOVIES            = 10003


