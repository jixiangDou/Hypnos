//
//  ContentView.swift
//  Hypnos
//
//  Created by George Dou on 2021/02/27.
//

import SwiftUI

struct WeatherView: View {
    
    @State private var isNight = false
    var body: some View {

        ZStack{
            BackgroundView(isNight: $isNight)
            VStack{
                CityNameView( cityName: "Cuperino, CA")
                WeatherThatDayView(temperature: 76, weatherIconName: isNight ? "moon.stars.fill" : "cloud.sun.fill")

                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "TUE", weatherIconName: "sun.max.fill", temperatureOfDay: 74)
                    
                    WeatherDayView(dayOfWeek: "WED", weatherIconName: "cloud.sun.bolt.fill", temperatureOfDay: 73)
                    
                    WeatherDayView(dayOfWeek: "THR", weatherIconName: "tornado", temperatureOfDay: 78)
                    
                    WeatherDayView(dayOfWeek: "FRI", weatherIconName: "wind.snow", temperatureOfDay: 59)
                    
                    WeatherDayView(dayOfWeek: "SAT", weatherIconName: "cloud.bolt.fill", temperatureOfDay: 66)
                    
                }
                Spacer()
                
                Button{
                    isNight.toggle()
                }label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                
                

                
                
                Spacer()
                
                
                
            }
        }
    }
}

struct WeathertView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
            .previewLayout(.device)
            .previewDevice("iPhone 12 Pro")
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var weatherIconName: String
    var temperatureOfDay: Int
    var body: some View {
        VStack(spacing:12.5) {
            Text(dayOfWeek)
                .font(.system(size: 20,weight:.medium))
                .foregroundColor(.white)
            Image(systemName:weatherIconName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:40,height:40)
            Text("\(temperatureOfDay)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CityNameView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}
struct WeatherThatDayView: View {
    var temperature: Int
    var weatherIconName: String
    var body: some View {
        VStack(spacing:8) {
            Image(systemName: weatherIconName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

        
struct WeatherButton: View{
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View{
        Text(title)
            .frame(width: 280, height: 50)
            .foregroundColor(textColor)
            .background(backgroundColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
    
}
