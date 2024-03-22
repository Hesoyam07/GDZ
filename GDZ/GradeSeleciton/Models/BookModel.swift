//
//  GradeModel.swift
//  GDZ
//
//  Created by Дмитрий on 14.03.2024.
//

import Foundation

struct BookEntity: Decodable {
    let iTunesId: String?
    let title: String?
    let authors: String?
    let subject: String?
    let grade: Int?
    let publisher: String?
    let coverURL: String?
    let price: String?
    let pages: [PagesModelEntity]?
}

struct BookModel: Decodable {
    let iTunesProductId: String?
    let bookTitle: String?
    let bookAuthors: String?
    let bookSubject: String?
    let bookGrade: Int?
    let bookPublisher: String?
    let bookCoverURL: String?
    let price: String?
    let bookPages: [PagesModelEntity]?
    
    enum CodingKeys: String, CodingKey {
        case iTunesProductId = "iTunes_product_id"
        case bookTitle = "book_title"
        case bookAuthors = "book_authors"
        case bookSubject = "book_subject"
        case bookGrade = "book_grade"
        case bookPublisher = "book_publisher"
        case bookCoverURL = "book_cover_URL"
        case price
        case bookPages = "book_pages"
    }
    var dto: BookEntity {
        BookEntity(iTunesId: iTunesProductId,
                   title: bookTitle,
                   authors: bookAuthors,
                   subject: bookSubject,
                   grade: bookGrade,
                   publisher: bookPublisher,
                   coverURL: bookCoverURL,
                   price: price,
                   pages: bookPages)
    }
}
struct PagesModelEntity: Decodable {
    let pageBookId: String?
    let pageTitle: String?
    let pageDescription: String?
    let pageUnlocked: Bool?
    let sectionTitle: String?
    
    enum CodingKeys: String, CodingKey {
        case pageBookId = "page_book_id"
        case pageTitle = "page_title"
        case pageDescription = "page_description"
        case pageUnlocked = "page_unlocked"
        case sectionTitle = "section_title"
    }
    var dto: PageEntity {
        PageEntity(pageId: pageBookId,
                   title: pageTitle,
                   description: pageDescription,
                   isUnlocked: pageUnlocked,
                   sectionTitle: sectionTitle)
    }
}
struct PageEntity {
    let pageId: String?
    let title: String?
    let description: String?
    let isUnlocked: Bool?
    let sectionTitle: String?
}

