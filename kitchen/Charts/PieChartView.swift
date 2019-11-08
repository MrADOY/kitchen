//
//  PieChartView.swift
//  ChartView
//
//  Created by András Samu on 2019. 06. 12..
//  Copyright © 2019. András Samu. All rights reserved.
//

import SwiftUI

public struct PieChartView : View {
    public var data: [DataCharts]
    public var title: String
    public var style: ChartStyle
    public var formSize:CGSize
    public init(data: [DataCharts], title: String, legend: String? = nil, style: ChartStyle = Styles.pieChartStyleOne, form: CGSize? = Form.medium ){
        self.data = data
        self.title = title
        self.style = style
        self.formSize = form!
    }
    
    public var body: some View {
        ZStack{
            VStack(alignment: .center){
                HStack{
                    Text(self.title)
                        .font(.subheadline)
                    .foregroundColor(self.style.textColor)
                    Spacer()
                }
                PieChartRow(data: data, accentColor: self.style.accentColor)
                    .foregroundColor(self.style.accentColor)
                
                HStack{
                    ForEach(data, id: \.self) { recette in
                        RectangleCharts(data : recette)
                    }
                }
                .padding(.top)
            }
        }.frame(width: 700, height: 400)
    }
}

struct RectangleCharts: View {
    var data : DataCharts
    var body: some View {
        HStack(spacing: -1.0){
        Rectangle()
            .fill(data.color)
            .frame(width : 50, height : 50)

            Text(data.categorie)
                .font(.caption)
                .fontWeight(.thin)
                .padding(.leading)
        }
    }
}


#if DEBUG
struct PieChartView_Previews : PreviewProvider {
    static var previews: some View {
        
        PieChartView(data : [
            DataCharts(num :56, categorie: "Cal", color: Color.red),
            DataCharts(num :56, categorie: "Cal", color: Color.blue)
        ], title: "Title", legend: "Legend")
    }
}
#endif
