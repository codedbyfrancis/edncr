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
        appId: import.meta.env.NUXT_PUBLIC_APP_ID,
        safari_web_id: import.meta.env.NUXT_PUBLIC_SAFARI_WEB_ID,
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
