//
//  RodGrapthView.swift
//  
//
//  Created by 永田大祐 on 2021/10/11.
//

import SwiftUI

// https://ichi.pro/swiftui-bogurafu-43218640863280
@available(iOS 15.0, *)
struct RodGrapthView: View {

    @State var pickerSelection = 0
    @State var barValues : [[CGFloat]] =
        [
        [5,150,50,100,200,110,30,170,50],
        [200,110,30,170,50, 100,100,100,200],
        [10,20,50,100,120,90,180,200,40]
        ]

    var body: some View {
        ZStack{
            Color(.black).edgesIgnoringSafeArea(.all)

            VStack{
                Text("Bar Charts").foregroundColor(.white)
                    .font(.largeTitle)

                Picker(selection: $pickerSelection, label: Text("Stats"))
                    {
                    Text("Views").tag(0)
                    Text("Reads").tag(1)
                    Text("Fans").tag(2)
                }.pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 10)

                HStack(alignment: .center, spacing: 10)
                {
                    ForEach(barValues[pickerSelection], id: \.self){
                        data in
                        
                        BarView(value: data, cornerRadius: CGFloat(integerLiteral: 10*self.pickerSelection))
                    }
                }.padding(.top, 24).animation(.default)
            }
        }
    }


    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .darkGray
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
    }
}

@available(iOS 15.0, *)
struct BarView: View{

    var value: CGFloat
    var cornerRadius: CGFloat
    
    var body: some View {
        VStack {

            ZStack (alignment: .bottom) {
                
                RoundedRectangle(cornerRadius: cornerRadius)
                    .frame(width: 30, height: 200).foregroundColor(.black)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .frame(width: 30, height: value).foregroundColor(.green)
                /*
                 RoundedRectangle(cornerRadius: cornerRadius).fill(LinearGradient(gradient: Gradient(colors: [.purple, .red, .blue]), startPoint: .top, endPoint: .bottom))
                 .frame(width: 30, height: value)
                 */
                
            }.padding(.bottom, 8)
        }
        
    }
}

@available(iOS 15.0, *)
struct RodGrapthView_Previews: PreviewProvider {
    static var previews: some View {
        RodGrapthView()
    }
}
