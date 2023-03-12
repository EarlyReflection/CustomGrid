//
//  CustomGridView.swift
//  CustomGrid
//
//  Created by Vladimir Dvornikov on 12/03/2023.
//

import SwiftUI

struct CustomGridView<Content, T>: View where Content : View {
    let columns: Int
    let items: [T]
    let content: (T, CGFloat) -> Content
    
    var rows: Int {
        items.count / columns
    }
    
    var cellSize: CGFloat {
        UIScreen.main.bounds.width / CGFloat(columns)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    ForEach(0...rows, id: \.self) { rowIndex in
                        HStack {
                            ForEach(0..<columns) { columnIndex in
                                if let index = indexFor(row: rowIndex, column: columnIndex) {
                                    content(items[index], cellSize)
//                                        .frame(width: cellSize, height: cellSize)
                                } else {
                                   Spacer()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    private func indexFor(row: Int, column: Int) -> Int? {
        let index = row * columns + column
        return index < items.count ? index : nil
    }
    
}

struct CustomGridView_Previews: PreviewProvider {
    static var previews: some View {
        CustomGridView(columns: 3, items: [11, 22, 33, 44, 55, 66, 77]) { item, cellSize in
            Text("\(item)")
                .frame(width: cellSize, height: cellSize)
                .font(.largeTitle)
        }
    }
}




