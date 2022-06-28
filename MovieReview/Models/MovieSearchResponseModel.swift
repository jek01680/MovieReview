//
//  MovieSearchResultModel.swift
//  MovieReview
//
//  Created by 정은경 on 2022/06/13.
//

import Foundation

struct MovieSearchResponseModel: Decodable {
    var items: [Movie] = []
}
