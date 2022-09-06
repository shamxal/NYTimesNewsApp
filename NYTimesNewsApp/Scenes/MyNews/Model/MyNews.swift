//
//  MyNews.swift
//  NYTimesNewsApp
//
//  Created by Shamkhal Guliyev on 06.09.22.
//

import Foundation

struct NewsItems: Codable {
    let items: [MyNews]?
}

struct MyNews: Codable {
    let title: String
    let desc: String
    let url: String
}
