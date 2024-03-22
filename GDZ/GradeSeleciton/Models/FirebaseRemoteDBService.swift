//
//  FirebaseRemoteDBService.swift
//  GDZ
//
//  Created by Дмитрий on 15.03.2024.
//

import Foundation
import Firebase
import FirebaseCore
import FirebaseDatabase

enum NetworkError: Error {
    case dataNotLoaded(description: String)
    case network(description: String)
    case decodingFailure(description: String)
}
private struct FirebaseConstants {
    static let urlDataBase = "https://gdzdnurulin-default-rtdb.europe-west1.firebasedatabase.app"
    static let referenceChild = "books"
    static let childQuery = "book_grade"
}
final class FirebaseRemoteDBService {
    private let ref = Database.database(url: FirebaseConstants.urlDataBase).reference()
    func getBooks(grade: Int, completion: @escaping (Result<[BookModel], NetworkError>) -> Void) {
        ref.child(FirebaseConstants.referenceChild).queryOrdered(byChild:FirebaseConstants.childQuery).queryEqual(toValue: grade).observe(.value, with: { (snapshot) in
            let childrenSnapshotValue = try! snapshot.children.compactMap({ ($0 as? DataSnapshot)?.value}) as! [[String: Any]]
            do {
                let data = try JSONSerialization.data(withJSONObject: childrenSnapshotValue)
                let jsonDecoder = JSONDecoder()
                let model = try jsonDecoder.decode([BookModel].self, from: data)
                completion(.success(model))
            } catch {
                completion(.failure(NetworkError.decodingFailure(description: "Data can't be decoded")))
            }
        }) { error in
            completion(.failure(NetworkError.network(description: "Network error")))
        }
    }
}



