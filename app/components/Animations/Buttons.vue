<template>
  <div>
    <h2>Button Animations</h2>
    <p>https://buttons.ibelick.com/</p>
    <div class="container mx-auto mt-10">
      <div class="flex flex-row gap-5">
        <button
          class="group relative inline-flex h-12 items-center justify-center overflow-hidden rounded-md bg-[var(--primary)] px-6 font-medium text-[var(--on-secondary)] transition hover:scale-110"
        >
          <span>Hover me</span>
          <div
            class="absolute inset-0 flex h-full w-full justify-center [transform:skew(-12deg)_translateX(-100%)] group-hover:duration-1000 group-hover:[transform:skew(-12deg)_translateX(100%)]"
          >
            <div class="relative h-full w-8 bg-white/20"></div>
          </div>
        </button>

        <button
          class="group relative inline-flex h-12 w-12 items-center justify-center overflow-hidden rounded-full bg-[var(--primary)] font-medium text-[var(--on-primary)] transition-all duration-300 hover:w-32"
        >
          <div
            class="inline-flex whitespace-nowrap opacity-0 transition-all duration-200 group-hover:-translate-x-3 group-hover:opacity-100"
          >
            Hover me
          </div>
          <div class="absolute right-3.5">
            <svg
              width="15"
              height="15"
              viewBox="0 0 15 15"
              fill="none"
              xmlns="http://www.w3.org/2000/svg"
              class="h-5 w-5"
            >
              <path
                d="M8.14645 3.14645C8.34171 2.95118 8.65829 2.95118 8.85355 3.14645L12.8536 7.14645C13.0488 7.34171 13.0488 7.65829 12.8536 7.85355L8.85355 11.8536C8.65829 12.0488 8.34171 12.0488 8.14645 11.8536C7.95118 11.6583 7.95118 11.3417 8.14645 11.1464L11.2929 8H2.5C2.22386 8 2 7.77614 2 7.5C2 7.22386 2.22386 7 2.5 7H11.2929L8.14645 3.85355C7.95118 3.65829 7.95118 3.34171 8.14645 3.14645Z"
                fill="currentColor"
                fill-rule="evenodd"
                clip-rule="evenodd"
              ></path>
            </svg>
          </div>
        </button>

        <button class="group relative">
          <div
            class="relative z-10 inline-flex h-12 items-center justify-center overflow-hidden rounded-md border border-[var(--on-surface)] bg-transparent px-6 font-medium text-[var(--on-surface)] transition-all duration-300 group-hover:-translate-x-3 group-hover:-translate-y-3"
          >
            Hover me
          </div>
          <div
            class="absolute inset-0 z-0 h-full w-full rounded-md transition-all duration-300 group-hover:-translate-x-3 group-hover:-translate-y-3 group-hover:[box-shadow:5px_5px_#a3a3a3,10px_10px_#d4d4d4,15px_15px_#e5e5e5]"
          ></div>
        </button>

        <button
          class="relative overflow-hidden px-6 py-3 font-semibold rounded-full text-inherit before:content-[''] before:absolute before:left-1/2 before:top-0 before:h-full before:w-0 before:-translate-x-1/2 before:bg-[var(--primary)] hover:text-[var(--on-primary)] before:transition-all before:duration-500 hover:before:w-full before:-z-10 z-10"
        >
          <span class="relative z-10">Hover Me</span>
        </button>
      </div>
    </div>
  </div>
</template>
