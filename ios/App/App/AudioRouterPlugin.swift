import Foundation
import Capacitor
import AVFoundation

@objc(AudioRouterPlugin)
public class AudioRouterPlugin: CAPPlugin {
    
    @objc func setSpeaker(_ call: CAPPluginCall) {
    let isSpeaker = call.getBool("isSpeaker") ?? false
    let session = AVAudioSession.sharedInstance()
    
    do {
        // Добавляем .defaultToSpeaker в категорию, это критично для корректной работы override
        try session.setCategory(.playAndRecord, mode: .voiceChat, options: [.allowBluetooth, .allowBluetoothA2DP, .defaultToSpeaker])
        
        if isSpeaker {
            try session.overrideOutputAudioPort(.speaker)
        } else {
            // Принудительно отключаем переопределение на спикер
            try session.overrideOutputAudioPort(.none)
        }
        
        // ВАЖНО: активируем сессию с флагом уведомления других приложений
        try session.setActive(true, options: .notifyOthersOnDeactivation)
        
        call.resolve(["isSpeaker": isSpeaker])
    } catch {
        call.reject("Error: \(error.localizedDescription)")
    }
}
}