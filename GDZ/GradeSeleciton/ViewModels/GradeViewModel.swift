//
//  GradeViewModel.swift
//  GDZ
//
//  Created by Дмитрий on 14.03.2024.
//

import Foundation
import UIKit

final class GradeViewModel {
    private let fireBaseDB = FirebaseRemoteDBService()
    let gradesArr = ["1 класс","2 класс","3 класс","4 класс",
                     "5 класс","6 класс","7 класс","8 класс","9 класс","10 класс","11 класс"]
    
    func fetchBooks(grade: Int, completion: @escaping (Result<[BookModel], NetworkError>) -> Void) {
        fireBaseDB.getBooks(grade: grade) { result in
            completion(result)
        }
    }
}

