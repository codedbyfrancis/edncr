export default defineNuxtPlugin(() => {
  if (process.server) return;

  // Create and load the OneSignal SDK script
  const script = document.createElement('script');
  script.src = 'https://cdn.onesignal.com/sdks/web/v16/OneSignalSDK.page.js';
  script.defer = true;
  script.onload = () => {
    // Initialize OneSignal once the SDK is loaded
    (window as any).OneSignalDeferred = (window as any).OneSignalDeferred || [];
    (window as any).OneSignalDeferred.push(async (OneSignal: any) => {
      await OneSignal.init({
        appId: '733cfb84-f996-423f-9602-e41b3e49a0d9',
        safari_web_id:
          'web.onesignal.auto.459ab5a0-25ed-43f1-a7b1-99d986ce9992',
        notifyButton: {
          enable: false,
        },
        allowLocalhostAsSecureOrigin: true,
      });
      // Show the permission prompt manually
      OneSignal.Notifications.requestPermission().then((result: string) => {
        console.log('Permission result:', result); // "granted" | "denied"
      });
    });
  };

  document.head.appendChild(script);
});
