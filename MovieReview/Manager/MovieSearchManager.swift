//
//  MoviewSearchManager.swift
//  MovieReview
//
//  Created by 정은경 on 2022/06/13.
//

import Alamofire
import Foundation

protocol MovieSearchManagerProtocol {
    func request(from keyword: String, completionHandler: @escaping (([Movie]) -> Void))
}

struct MovieSearchManager: MovieSearchManagerProtocol, Codable {
    func request(from keyword: String, completionHandler: @escaping ([Movie]) -> Void) {
        guard let url = URL(string: "https://openapi.naver.com/v1/search/movie.json") else { return }
        let parameters = MovieSearchRequestModel(query: keyword)
        let headers: HTTPHeaders = [
            "X-Naver-Client-Id": "YHXa5DWaPrnePJA0jhDY",
            "X-Naver-Client-Secret": "eeKXIM5EmH"
        ]
        AF.request(
            url,
            method: .get,
            parameters: parameters,
            headers: headers
        )
        .responseDecodable(of: MovieSearchResponseModel.self) { response in
            switch response.result {
            case .success(let result):
                completionHandler(result.items)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
