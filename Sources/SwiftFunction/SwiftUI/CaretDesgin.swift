//
//  CaretDesgin.swift
//  
//
//  Created by 永田大祐 on 2021/06/24.
//

import SwiftUI

@available(iOS 14.0, *)
struct CaretContentView: View {

    @State var text: String = ""

    @State var text2: String = ""
    
    @State var spacing: CGFloat = 0
    
    @State var didTap  = false

    var body: some View {
        VStack {
            HStack(alignment: .bottom, spacing: spacing) {

                SATextField(tag: 0, placeholder: "placeholder", changeHandler: { (newString) in
                    self.text = newString
                }, onCommitHandler: {
                    // write something
                })
                self.text.isEmpty == false ?
                    HorizontalLine(color: self.didTap ? Color.red : Color.black) :
                    HorizontalLine(color: self.didTap ? Color.black : Color.red)

                SATextField(tag: 1, placeholder: "placeholder2", changeHandler: { (newString) in
                    self.text2 = newString
                }, onCommitHandler: {
                    // write something
                })
                text2.isEmpty == false ?
                    HorizontalLine(color: didTap ? Color.red : Color.black) :
                    HorizontalLine(color: didTap ? Color.black : Color.red)
            }
        }.position(.init(x: UIScreen.main.bounds.width/2+50, y: UIScreen.main.bounds.height/2))
    }
}
@available(iOS 14.0, *)
struct CaretContentView_Previews: PreviewProvider {
    static var previews: some View {
        CaretContentView()
    }
}
@available(iOS 14.0, *)
struct HorizontalLine: View {

    private var color: Color? = nil
    private var height: CGFloat = 1.0
    private var shape: HorizontalLineShape?

    init(color: Color, height: CGFloat = 1.0) {
        self.color = color
        self.height = height
    }

    var body: some View {
        HorizontalLineShape().fill(self.color!).frame(minWidth: 0, maxWidth: .infinity, minHeight: height, maxHeight: height)
    }
}
@available(iOS 14.0, *)
struct HorizontalLineShape: Shape {

    func path(in rect: CGRect) -> Path {

        let fill = CGRect(x: -rect.size.width, y: 0, width: rect.size.width, height: rect.size.height)
        var path = Path()
        path.addRoundedRect(in: fill, cornerSize: CGSize(width: 2, height: 2))

        return path
    }
}
@available(iOS 14.0, *)
class Model: ObservableObject {
    @Published var text = ""
    var placeholder = "Placeholder"
}

@available(iOS 14.0, *)
struct SATextField: UIViewRepresentable {
    private let tmpView = WrappableTextField()

    //var exposed to SwiftUI object init
    var tag:Int = 0
    var placeholder:String?
    var changeHandler:((String)->Void)?
    var onCommitHandler:(()->Void)?
    
    func makeUIView(context: UIViewRepresentableContext<SATextField>) -> WrappableTextField {
        tmpView.tag = tag
        tmpView.delegate = tmpView
        tmpView.placeholder = placeholder
        tmpView.onCommitHandler = onCommitHandler
        tmpView.textFieldChangedHandler = changeHandler
        return tmpView
    }
    
    func updateUIView(_ uiView: WrappableTextField, context: UIViewRepresentableContext<SATextField>) {
        uiView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        uiView.setContentHuggingPriority(.defaultLow, for: .horizontal)
    }
}
@available(iOS 14.0, *)
class WrappableTextField: UITextField, UITextFieldDelegate {
    var textFieldChangedHandler: ((String)->Void)?
    var onCommitHandler: (()->Void)?
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = textField.superview?.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let currentValue = textField.text as NSString? {
            let proposedValue = currentValue.replacingCharacters(in: range, with: string)
            textFieldChangedHandler?(proposedValue as String)
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        onCommitHandler?()
    }
}
