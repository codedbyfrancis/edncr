// plugins/ripple.client.ts
import { defineNuxtPlugin } from '#app';

export default defineNuxtPlugin(() => {
  return {
    provide: {},
    // register a global directive
    vueApp: {
      directive: {
        ripple: {
          mounted(el: HTMLElement) {
            el.style.position = 'relative';
            el.style.overflow = 'hidden';
            el.addEventListener('click', (e: MouseEvent) => {
              const rect = el.getBoundingClientRect();
              const ripple = document.createElement('span');
              const size = Math.max(rect.width, rect.height) * 2;
              ripple.style.position = 'absolute';
              ripple.style.width = ripple.style.height = `${size}px`;
              ripple.style.left = `${e.clientX - rect.left - size / 2}px`;
              ripple.style.top = `${e.clientY - rect.top - size / 2}px`;
              ripple.className =
                'rounded-full bg-white opacity-30 mix-blend-multiply pointer-events-none';
              ripple.style.animation = 'ripple 600ms ease-out forwards';
              el.appendChild(ripple);
              setTimeout(() => ripple.remove(), 700);
            });
          },
        },
      },
    } as any,
  };
});
