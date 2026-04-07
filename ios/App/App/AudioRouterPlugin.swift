import Foundation
import Capacitor
import AVFoundation

@objc(AudioRouterPlugin)
public class AudioRouterPlugin: CAPPlugin {
    
    @objc func setSpeaker(_ call: CAPPluginCall) {
        let isSpeaker = call.getBool("isSpeaker") ?? false
        let session = AVAudioSession.sharedInstance()
        
        do {
            // Настраиваем сессию для звонков
            try session.setCategory(.playAndRecord, mode: .voiceChat, options: [.allowBluetooth])
            
            // Жестко переопределяем выход звука
            if isSpeaker {
                try session.overrideOutputAudioPort(.speaker)
                print("📱 Нативный лог: Звук выведен на ГРОМКУЮ связь")
            } else {
                try session.overrideOutputAudioPort(.none) // .none переводит звук обратно в разговорный динамик (ухо)
                print("📱 Нативный лог: Звук выведен в УШНОЙ динамик")
            }
            
            try session.setActive(true)
            call.resolve(["success": true])
            
        } catch {
            call.reject("Ошибка переключения звука: \(error.localizedDescription)")
        }
    }
}