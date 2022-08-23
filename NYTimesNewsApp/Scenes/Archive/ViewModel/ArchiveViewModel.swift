//
//  ArchiveViewModel.swift
//  NYTimesNewsApp
//
//  Created by Shamkhal Guliyev on 23.08.22.
//

import Foundation

class ArchiveViewModel {
    var items = [ArchiveResponseDoc]()
    
    var successCallback: (()->())?
    var errorCallback: ((String)->())?
    
    func getList() {
        ArchiveManager.shared.getArchiveNewsList { items, errorMessage in
            if let errorMessage = errorMessage {
                self.errorCallback?(errorMessage)
            } else if let docs = items?.response?.docs {
                self.items = docs
                self.successCallback?()
            }
        }
    }
}
