
import SwiftUI

struct SpeedometerView: View {
    var speed: Int
    
    var body: some View {
        ZStack {
            // Полукруглая дуга
            Circle()
                .trim(from: 0, to: 0.5)
                .stroke(
                    AngularGradient(
                        gradient: Gradient(colors: [.orange, .brown.opacity(0.4)]),
                        center: .center
                    ),
                    style: StrokeStyle(lineWidth: 16, lineCap: .round)
                )
                .rotationEffect(.degrees(180))
                .frame(width: 220, height: 220)
            
            // Деления
            ForEach(0..<9) { i in
                let angle = Double(i) * .pi / 8
                let radius: CGFloat = 90
                let x = cos(angle - .pi) * radius
                let y = sin(angle - .pi) * radius
                
                Text("\(i * 10)")
                    .font(.system(size: 12))
                    .foregroundColor(.white)
                    .position(x: 110 + x, y: 110 + y)
            }
            
            // Стрелка
            Needle(angle: angleForSpeed(speed))
            
            // Центр
            Circle()
                .fill(Color(red: 0.1, green: 0.2, blue: 0.2))
                .frame(width: 60, height: 60)
                .overlay(
                    Text("\(speed)")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                )
        }
        .frame(width: 220, height: 220)
    }
    
    func angleForSpeed(_ speed: Int) -> Angle {
        let clamped = min(max(speed, 0), 80)
        let percent = Double(clamped) / 80.0
        
        // Диапазон углов от -π/2 (0 км/ч) до π/2 (80 км/ч)
        let angleRadians = -Double.pi / 2 + Double.pi * percent
        return Angle(radians: angleRadians)
    }
}

struct Needle: View {
    var angle: Angle
    
    var body: some View {
        Rectangle()
            .fill(Color.orange)
            .frame(width: 3, height: 60)
            .offset(y: -30)
            .rotationEffect(angle)
            .animation(.easeInOut(duration: 0.3), value: angle)
    }
}






#Preview {
    SpeedometerView(speed: 40)
}
