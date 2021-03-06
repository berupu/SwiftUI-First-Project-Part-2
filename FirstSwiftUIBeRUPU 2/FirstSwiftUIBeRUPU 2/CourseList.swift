//
//  CourseList.swift
//  FirstSwiftUIBeRUPU 2
//
//  Created by be RUPU on 26/1/22.
//

import SwiftUI

struct CourseList: View {
   @ObservedObject var store = CourseStore()
    @State var show  = false
    @State var active  = false
    @State var activeIndex  = -1
    @State var activeView = CGSize.zero
    
    var body: some View {
        ZStack {
            Color.black.opacity(active ? 0.5 : 0) //self.activeView.height/500
                .animation(.linear, value: active)
                .edgesIgnoringSafeArea(.all)
                
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 30.0) {
                    
                    Text("Courses")
                        .font(.largeTitle).bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 30)
                        .padding(.top, 30)
                        .blur(radius: active ? 20 : 0)
                    
                    ForEach(store.courses.indices, id: \.self) { index in
                        GeometryReader { geometry in
                            CourseView(show: self.$store.courses[index].show,
                                       course: self.store.courses[index],
                                       active: self.$active,
                                       index: index,
                                       activeIndex: self.$activeIndex, activeView: self.$activeView
                            )
                                .offset(y: self.store.courses[index].show ? -geometry.frame(in: .global).minY : 0)
                                     .opacity(self.activeIndex != index && self.active ? 0 : 1)
                                     //.scaleEffect(self.activeIndex != index && self.active ? 0.5: 1)
                                     //.offset(x: self.activeIndex != index && self.active ? screen.width : 0)
                        }
                        .frame(height: 280)
                        .frame(maxWidth: self.store.courses[index].show ? .infinity : screen.width - 60)
                        .zIndex(self.store.courses[index].show ? 1 : 0)
                    }
                }
                .frame(width: screen.width)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0), value: show)
            }
            .statusBar(hidden: active ? true : false)
        }
        //.animation(.linear, value: active)
        
       
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}


struct CourseView: View {
    @Binding var show: Bool
    var course: Course
    @Binding var active: Bool
    var index: Int
    @Binding var activeIndex: Int
    @Binding var activeView: CGSize
    
    var body: some View {
        ZStack(alignment: .top) {
            
            VStack(alignment: .leading, spacing: 30.0) {
                Text("Take your SwiftUI couse to the app store with advanced technique like API data, package and CMS")
                
                Text("About this course")
                    .font(.title).bold()
                
                Text("Take your SwiftUI couse to the app store with advanced technique like API data, package and CMS. Take your SwiftUI couse to the app store with advanced technique like API data, package and CMS.Take your SwiftUI couse to the app store with advanced technique like API data, package and CMSTake your SwiftUI couse to the app store with advanced technique like API data, package and CMSTake your SwiftUI couse to the app store with advanced technique like API data, package and CMSTake your SwiftUI couse to the app store with advanced technique like API data, package and CMSTake your SwiftUI couse to the app store with advanced technique like API data, package and CMS")
                
                Text("Take your SwiftUI couse to the app store with advanced technique like API data, package and CMS. Take your SwiftUI couse to the app store with advanced technique like API data,  store with advanced technique like API data, package and CMSTake your SwiftUI couse to the app store with advanced technique like API data, package and CMSTake your SwiftUI couse to the app store with advanced technique like API data, package and CMS")
            }
            .padding(30)
            .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? .infinity : 280)
            .offset(y: show ? 460 : 0)
            .background(Color("background3"))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .opacity(show ? 1 : 0)
            
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 8.0) {
                        Text(course.title)
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .bold))
                        Text(course.subtitle)
                            .foregroundColor(Color.white.opacity(0.7))
                    }
                    Spacer()
                    ZStack {
                        Image(course.logo)
                            .opacity(show ? 0 : 0)
                        
                        VStack {
                            Image(systemName: "xmark")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white)
                        }
                        .frame(width: 36, height: 36)
                        .background(.black)
                        .clipShape(Circle())
                        .opacity(show ? 1 : 0)
                    }
                }
                Spacer()
                Image(course.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .frame(height: 140, alignment: .top)
                
            }
            .padding(show ? 30 : 20)
            .padding(.top, show ? 30 : 0)
    //        .frame(width: show ? screen.width : screen.width - 60, height: show ? screen.height : 280)
            .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? 460 : 280)
            .background(course.color)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: course.color .opacity(0.3), radius: 20, x: 0, y: 20)
            .gesture(
                show ?
                
                DragGesture().onChanged { value in
                    guard value.translation.height > 300 else {return}
                    guard value.translation.height < 0 else {return}
                    self.activeView = value.translation
                }
                .onEnded { value in
                    if self.activeView.height > 50 {
                        self.show = false
                        self.active = false
                        self.activeIndex = -1
                    }
                        self.activeView = .zero
                    }
                : nil
            )
            
            
            .onTapGesture {
                self.show.toggle()
                self.active.toggle()
                if self.show {
                    self.activeIndex = self.index
                } else {
                    self.activeIndex = -1
                }
            }
            
            if show {
//                CourseDetail(course: course, show: $show, active: $active, activeIndex: $activeIndex)
//                    .background(Color.white)
            }
        }
        .frame(height: show ? screen.height : 280)
        //.scaleEffect(1 - self.activeView.height / 1000)
        //.rotation3DEffect(Angle(degrees: Double(self.activeView.height / 10)), axis: (x: 0, y: 0, z: 0))
        .hueRotation(Angle(degrees: Double(self.activeView.height)))
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0), value: show)
        .gesture(
            show ?
            
            DragGesture().onChanged { value in
                guard value.translation.height > 300 else {return}
                guard value.translation.height < 0 else {return}
                self.activeView = value.translation
            }
            .onEnded { value in
                if self.activeView.height > 50 {
                    self.show = false
                    self.active = false
                    self.activeIndex = -1
                }
                    self.activeView = .zero
                }
            : nil
        )
        .edgesIgnoringSafeArea(.all)
    }
}

struct Course: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var image: String
    var logo: String
    var color: Color
    var show: Bool
}

var courseData = [Course(title: "Prototype design in SwiftUI", subtitle: "18 sections", image: "Card2", logo: "Logo1", color: Color.blue, show: false),
     
    Course(title: "SwiftUI Advanced", subtitle: "20 sections", image: "Card3", logo: "Logo1", color: Color.pink, show: false),
  
    Course(title: "UI desogn for Developers", subtitle: "24 sections", image: "Card4", logo: "Logo2", color: Color.cyan, show: false)
      
]
