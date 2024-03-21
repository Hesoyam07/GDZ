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
                     "5 класс","6 класс","7 класс","8 класс","9 класс","10 класс","11 класс", "12 класс"]
    
    func fetchBooks(grade: Int, completion: (Result<BookModel, NetworkError>) -> Void) {
        fireBaseDB.getBooks(grade: grade) { result in
            switch result {
            case .success(let data):
                print("recevied data \(data)")
            case .failure(let error):
                print("error is \(error)")
                //self.showAlert(error: error.localizedDescription)
            }
        }
        
    }
  
//    private func pushVC() {
//        let vc = ViewController()
//        navigationController?.pushViewController(vc, animated: true)
//    }
}
