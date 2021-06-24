//
//  BaseDataManager.swift
//  Alamofire
//
//  Created by Ibrahimme Morelo on 24/06/21.
//

import Alamofire

class BaseDataManager {
    func request<T: Decodable>(with url: String,
                               model: T.Type,
                               decoderStrategy: JSONDecoder.KeyDecodingStrategy = JSONDecoder.KeyDecodingStrategy.convertFromSnakeCase,
                               onSuccess: @escaping (_ response: T) -> Void,
                               onError: @escaping () -> Void) {
        let url: String = url
        let decoder: JSONDecoder = JSONDecoder()
        decoder.keyDecodingStrategy = decoderStrategy
        AF.request(url)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseDecodable(of: model.self, decoder: decoder) { response in
                switch response.result {
                case Result.success:
                    guard let value: T = response.value else {
                        onError()
                        return
                    }
                    onSuccess(value)
                case Result.failure:
                    onError()
                }
            }
    }
}
