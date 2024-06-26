//
//  CASSignInView.swift
//  CleanArcSwift
//
//  Created by Hidayat Abisena on 24/05/24.
//

import SwiftUI

struct CASSignInView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State var email: String = ""
    @State var password: String = ""
    @State var showPassword: Bool = false
    @State var remember: Bool = false
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack{
                //MARK: - Header Sign In
                GeometryReader { proxy -> AnyView in
                    let height = proxy.frame(in: .global).height
                    AnyView(
                        ZStack {
                            UnevenRoundedRectangle(cornerRadii: .init(
                                bottomLeading: 60,
                                bottomTrailing: 60
                            ))
                            .fill(.black)
                            .offset(y: -height / 2)
                            .frame(height: 350)
                        }
                    )
                }
                .frame(maxHeight: getRect().height / 1.5)
                .overlay {
                    VStack {
                        Image(systemName: "apple.meditate")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 70, height: 70)
                            .foregroundStyle(.white)
                        Text("Welcome Back!")
                            .foregroundStyle(.white)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                    .padding(.bottom, 250)
                }
                
                //MARK: - Sign In Form
                ZStack {
                    VStack(spacing: 20) {
                        HStack {
                            Text("Sign In")
                                .font(.largeTitle)
                                .bold()
                            Spacer()
                        }
                        Group {
                            TextField("Username", text: $email)
                            HStack {
                                Group {
                                    if !showPassword {
                                        SecureField("Password", text: $password)
                                    } else {
                                        TextField("Password", text: $password)
                                    }
                                }
                                
                                Button(action: {showPassword.toggle()}, label: {
                                    Image(systemName: showPassword ? "eye.slash" : "eye")
                                        .foregroundStyle(.black)
                                })
                            }
                        }
                        .padding()
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        
                        
                        HStack {
                            Toggle(isOn: $remember) {
                               Text("Remember me")
                                    .font(.footnote)
                            }
                            .toggleStyle(iOSCheckboxToggleStyle())
                            Spacer()
                            Text("Forgot password")
                                .font(.footnote)
                                .bold()
                                .foregroundStyle(.gray)
                        }
                        
                        //MARK: - Auth Methods
                        Button(action: {}, label: {
                            Text("Log In")
                                .bold()
                        })
                        .frame(width: 350, height: 50)
                        .background(.black)
                        .foregroundStyle(.white)
                        .cornerRadius(10)
                        
                        LabelledDivider(label: "or")
                        
                        Group {
                            Button(action: {}, label: {
                                HStack {
                                    Image(.google50)
                                    Text("Continue with Google")
                                }
                            })
                            
                            Button(action: {}, label: {
                                HStack {
                                    Image(.apple50)
                                    Text("Continue with Apple")
                                }
                            })
                            Button(action: {}, label: {
                                HStack {
                                    Image(.facebook50)
                                    Text("Continue with Facebook")
                                }
                            })
                        }
                        .foregroundStyle(.black)
                        .font(.footnote)
                        .frame(width: 350, height: 50)
                        .background(
                            RoundedRectangle(
                                cornerRadius: 10,
                                style: .continuous
                            )
                            .stroke(.gray, lineWidth: 1)

                        )
                        
                        
                    }
                    .frame(width: 350, height: 50)
                    .padding(.top, 50)
                    .frame(width: getRect().width)
                }
                .frame(maxHeight: .infinity, alignment: .top)
                            
            }
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark.app")
                    .font(.title3)
                    .foregroundStyle(.white)
                    .padding()
            }
        }
    }
}

extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
    
    func getSafeArea() -> UIEdgeInsets {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        
        return window?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }, label: {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                configuration.label
            }
        })
        .foregroundStyle(.black)
    }
}

struct LabelledDivider: View {

    let label: String
    let horizontalPadding: CGFloat
    let color: Color

    init(label: String, horizontalPadding: CGFloat = 20, color: Color = .gray) {
        self.label = label
        self.horizontalPadding = horizontalPadding
        self.color = color
    }

    var body: some View {
        HStack {
            line
            Text(label).foregroundStyle(color)
            line
        }
    }

    var line: some View {
        VStack { Divider().background(color) }.padding(horizontalPadding)
    }
}

#Preview {
    CASSignInView()
}
