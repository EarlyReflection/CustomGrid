//
//  ContentView.swift
//  CustomGrid
//
//  Created by Vladimir Dvornikov on 12/03/2023.
//

import SwiftUI

struct ContentView: View {
    
    let columns = 3
    var cellSize: CGFloat {
        UIScreen.main.bounds.width / CGFloat(columns)
    }
    
    let systemImageNames = ["house", "gear", "person.crop.circle", "folder.fill", "doc.fill", "calendar", "camera.fill", "music.note", "car.fill", "airplane", "tram.fill", "flame.fill", "bolt.fill", "bolt.horizontal.fill", "star.fill", "flag.fill", "paperclip", "pencil", "briefcase.fill", "printer.fill"]
    
    
    var body: some View {
        CustomGridView(columns: columns, items: systemImageNames) { item, cellSize in
            Image(systemName: "\(item)")
                .resizable()
                .scaledToFit()
                .padding()
                .frame(width: cellSize, height: cellSize)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
