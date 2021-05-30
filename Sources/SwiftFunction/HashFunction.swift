//
//  HashFunction.swift
//  
//
//  Created by 永田大祐 on 2021/05/31.
//

import Foundation

public struct HashFunction: Hashable
{
    var sectionIDHash: Int
    var itemIDHash: Int
    init<SectionID: Hashable, ItemID: Hashable>(sectionID: SectionID, itemID: ItemID)
    {
        sectionIDHash = sectionID.hashValue
        itemIDHash = itemID.hashValue
    }
}
