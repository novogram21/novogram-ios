import <Capacitor/Capacitor.h>

// Регистрируем плагин и его метод
CAP_PLUGIN(AudioRouterPlugin, "AudioRouter",
    CAP_PLUGIN_METHOD(setSpeaker, CAPPluginReturnPromise);
)