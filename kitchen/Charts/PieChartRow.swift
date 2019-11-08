//
//  PieChartRow.swift
//  ChartView
//
//  Created by András Samu on 2019. 06. 12..
//  Copyright © 2019. András Samu. All rights reserved.
//

import SwiftUI

public struct PieChartRow : View {
    var data: [DataCharts]
    var accentColor: Color
    var slices: [PieSlice] {
        var tempSlices:[PieSlice] = []
        var lastEndDeg:Double = 0
        let maxValue = data.compactMap {$0.num }.reduce(0, +)
        for slice in data {
            let normalized:Double = Double(slice.num)/Double(maxValue)
            let startDeg = lastEndDeg
            let endDeg = lastEndDeg + (normalized * 360)
            lastEndDeg = endDeg
            tempSlices.append(PieSlice(startDeg: startDeg, endDeg: endDeg, value: slice.num, normalizedValue: normalized, color : slice.color, categorie : slice.categorie))
        }
        return tempSlices
    }
    public var body: some View {
        GeometryReader { geometry in
            ZStack{
                ForEach(0..<self.slices.count){ i in
                    PieChartCell(rect: geometry.frame(in: .local), startDeg: self.slices[i].startDeg, endDeg: self.slices[i].endDeg, index: i,backgroundColor: self.slices[i].color,accentColor: self.slices[i].color, categorie: self.slices[i].categorie)
                }
            }
        }
    }
}

#if DEBUG
struct PieChartRow_Previews : PreviewProvider {
    static var previews: some View {
        PieChartRow(data : [
        DataCharts(num :56, categorie: "Cal", color: Color.red),
        DataCharts(num :56, categorie: "Cal", color: Color.blue)
        ], accentColor: Color(red: 225.0/255.0, green: 97.0/255.0, blue: 76.0/255.0)).frame(width: 100, height: 100)
        
    }
}
#endif
