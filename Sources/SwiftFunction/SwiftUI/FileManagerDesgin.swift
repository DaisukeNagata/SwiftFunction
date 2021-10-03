//
//  FileManagerView.swift
//  
//
//  Created by 永田大祐 on 2021/09/02.
//

import SwiftUI

@available(iOS 14.0, *)
struct FileManagerView: View {
    var body: some View {
        Text("\(getDocumentsDirectory().appendingPathComponent("test"))")
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

@available(iOS 14.0, *)
struct FileManagerView_Previews: PreviewProvider {
    static var previews: some View {
        FileManagerView()
    }
}
