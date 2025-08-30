<script setup lang="ts">
import { CalendarDate } from '@internationalized/date';
import { ref } from 'vue';

const open = ref(false);
const reject = ref(false);
const accept = ref(false);
const reschedule = ref(false);
const feedback_sent = ref(false);
const feedback_message = ref('');
const report_message = ref('');

const formattedDate = computed(() => {
  const date = selectedDate.value;
  return new Date(date.year, date.month - 1, date.day).toLocaleDateString(
    $t('language-code'),
    {
      weekday: 'short',
      year: 'numeric',
      month: 'long',
      day: 'numeric',
    }
  );
});

const selectedDate = shallowRef(
  (() => {
    const date = new Date();
    const day = date.getDay();
    let dayAdd = 1;
    if (day === 0) {
      dayAdd = 1;
    } else if (day === 6) {
      dayAdd = 2;
    }
    return new CalendarDate(
      date.getFullYear(),
      date.getMonth() + 1,
      date.getDate() + dayAdd
    );
  })()
);

const minDate = shallowRef(
  (() => {
    const date = new Date();
    const day = date.getDay();
    let dayAdd = 1;
    if (day === 0) {
      dayAdd = 1;
    } else if (day === 6) {
      dayAdd = 2;
    }
    return new CalendarDate(
      date.getFullYear(),
      date.getMonth() + 1,
      date.getDate() + dayAdd
    );
  })()
);

const maxDate = shallowRef(
  (() => {
    const date = new Date();
    let dayAdd = 1;
    let tomorrow = new Date(date.setDate(date.getDate() + dayAdd));
    while (tomorrow.getDay() === 0 || tomorrow.getDay() === 6) {
      dayAdd += 1;
      tomorrow = new Date(date.setDate(date.getDate() + dayAdd));
    }
    const nextWeek = new Date(tomorrow.setDate(tomorrow.getDate() + 7));
    while (nextWeek.getDay() === 0 || nextWeek.getDay() === 6) {
      dayAdd += 1;
      nextWeek = new Date(tomorrow.setDate(tomorrow.getDate() + dayAdd));
    }
    return new CalendarDate(
      nextWeek.getFullYear(),
      nextWeek.getMonth() + 1,
      nextWeek.getDate()
    );
  })()
);

const itemsTime = ref([
  '09:00 - 10:00',
  '10:00 - 11:00',
  '11:00 - 12:00',
  '12:00 - 13:00',
  '13:00 - 14:00',
  '14:00 - 15:00',
  '15:00 - 16:00',
  '16:00 - 17:00',
  '17:00 - 18:00',
]);
const selectedTime = ref('');
const feedback_message_reject = ref(false);
const feedback_message_report = ref(
  `You can come back to this page to report any violations made by the company/telemarketer on this call.`
);

const callReject = async () => {
  feedback_sent.value = true;
  feedback_message_reject.value =
    'The company mentioned above is not permitted to call you.';
  feedback_message.value = 'Call is rejected.';
  // alert('Reject.');
};
const callAccept = async () => {
  feedback_sent.value = true;
  feedback_message.value = 'Call is accepted.';
  // alert('Accept.');
};
const callReschedule = async () => {
  feedback_sent.value = true;
  feedback_message.value = 'Call is rescheduled.';
  // alert('Reschedule.');
};
const callEndcr = async () => {
  feedback_sent.value = true;
  feedback_message.value = 'You have eDNCR this call.';
  // alert('eDNCR.');
};
const callReport = async () => {
  feedback_sent.value = true;
  feedback_message.value = 'You have reported this call.';
  // alert('Report.');
};
const value = ref<File[]>([]);
</script>
<template>
  <div v-if="!feedback_sent" class="flex flex-col gap-1 px-2 py-10">
    <h2>What would you like to do?</h2>

    <UDrawer
      title="Drawer with description"
      description="Lorem ipsum dolor sit amet, consectetur adipiscing elit."
      :ui="{
        content: 'rounded-t-4xl',
      }"
    >
      <div
        class="group hover:bg-[var(--surface-container)]/10"
        @click="open = true"
      >
        <div class="button rounded-t-4xl">
          <UIcon name="material-symbols:check-circle-rounded" class="p-5" />
          <div class="flex flex-col">
            <span class="font-medium text-lg">Reject</span>
            <span class="label"
              >Reject the call or automatically selected after 3 days of
              inactivity.</span
            >
          </div>
        </div>
      </div>

      <template #content>
        <div class="drawer_content">
          <h2>Reject</h2>
          <p>
            Reject the call or automatically selected after 3 days of
            inactivity.
          </p>
          <div class="my-5 flex flex-col justify-center items-center">
            <div class="w-full lg:w-1/2">
              <UCheckbox
                class="mb-3"
                v-model="reject"
                size="xl"
                label="I confirm to reject this call."
              />
              <UTooltip
                text="Confirm to reject the call by checking the checkbox."
              >
                <UButton
                  @click="callReject"
                  :disabled="!reject"
                  icon="material-symbols:phone-disabled-outline-rounded"
                  size="xl"
                  variant="solid"
                  :ui="{
                    base: 'cursor-pointer bg-[var(--primary)]/95 text-[var(--on-primary)]/90 hover:bg-[var(--primary)] hover:text-[var(--on-primary)] w-full rounded-full justify-center py-4 text-xl',
                  }"
                  >Reject</UButton
                ></UTooltip
              >
            </div>
          </div>
        </div>
      </template>
    </UDrawer>

    <!-- <NuxtLink to="#" class="group">
      <div class="button rounded-t-4xl">
        <UIcon name="material-symbols:check-circle-rounded" class="p-5" />
        <div class="flex flex-col">
          <span class="font-medium text-lg">Reject</span>
          <span class="label"
            >Reject the call or automatically selected after 3 days of
            inactivity.</span
          >
        </div>
      </div>
    </NuxtLink> -->

    <UDrawer
      title="Drawer with description"
      description="Lorem ipsum dolor sit amet, consectetur adipiscing elit."
      :ui="{
        content: 'rounded-t-4xl',
      }"
    >
      <div class="group hover:bg-[var(--surface-container)]/10">
        <div class="button">
          <UIcon name="material-symbols:check-circle-rounded" class="p-5" />
          <div class="flex flex-col">
            <span class="font-medium text-lg">Accept</span>
            <span class="label"
              >Allow this caller to call you at any given time.</span
            >
          </div>
        </div>
      </div>

      <template #content>
        <div class="drawer_content">
          <h2>Accept</h2>
          <p>Allow this caller to call you at any given time.</p>
          <div class="my-5 flex flex-col justify-center items-center">
            <div class="w-full lg:w-1/2">
              <UCheckbox
                class="mb-3"
                v-model="accept"
                size="xl"
                label="I confirm to accept this call."
              />
              <UTooltip
                text="Confirm to accept the call by checking the checkbox."
              >
                <UButton
                  @click="callAccept"
                  :disabled="!accept"
                  icon="material-symbols:phone-callback-outline-rounded"
                  size="xl"
                  variant="solid"
                  :ui="{
                    base: 'cursor-pointer bg-[var(--primary)]/95 text-[var(--on-primary)]/90 hover:bg-[var(--primary)] hover:text-[var(--on-primary)] w-full rounded-full justify-center py-4 text-xl',
                  }"
                  >Accept</UButton
                ></UTooltip
              >
            </div>
          </div>
        </div>
      </template>
    </UDrawer>

    <!-- <NuxtLink to="#" class="group">
      <div class="button">
        <UIcon name="material-symbols:check-circle-rounded" class="p-5" />
        <div class="flex flex-col">
          <span class="font-medium text-lg">Accept</span>
          <span class="label"
            >Allow this caller to call you at any given time.</span
          >
        </div>
      </div>
    </NuxtLink> -->

    <UDrawer
      title="Drawer with description"
      description="Lorem ipsum dolor sit amet, consectetur adipiscing elit."
      :ui="{
        content: 'rounded-t-4xl',
      }"
    >
      <div class="group hover:bg-[var(--surface-container)]/10">
        <div class="button">
          <UIcon name="material-symbols:check-circle-rounded" class="p-5" />
          <div class="flex flex-col">
            <span class="font-medium text-lg">Reschedule</span>
            <span class="label"
              >Allow the caller to call you on your prefered date and
              time.</span
            >
          </div>
        </div>
      </div>

      <template #content>
        <div class="drawer_content">
          <h2>Reschedule</h2>
          <p>Allow the caller to call you on your prefered date and time.</p>
          <div class="my-5 flex flex-col items-center">
            <div>
              <UCalendar
                v-model="selectedDate"
                :min-value="minDate"
                :max-value="maxDate"
                size="xl"
              />
              <USelect
                v-model="selectedTime"
                :items="itemsTime"
                class="w-full py-2 my-3"
                :ui="{
                  base: 'bg-[var(--primary)] text-[var(--on-primary)] text-lg',
                  content: 'bg-[var(--primary)] ',
                  itemLabel: 'text-[var(--on-primary-fixed)] text-lg',
                  itemTrailingIcon: 'bg-[var(--on-primary-fixed)]',
                }"
              />
            </div>
            <div class="flex flex-col">
              <div>
                Selected:
                {{ formattedDate }},
                {{ selectedTime ? selectedTime : 'Select time.' }}
              </div>
            </div>

            <div class="w-full lg:w-1/2">
              <UTooltip text="Select date and time.">
                <UCheckbox
                  :disabled="!selectedDate || !selectedTime"
                  class="mt-5 m-3"
                  v-model="reschedule"
                  size="xl"
                  label="I confirm to reschedule this call."
                />
              </UTooltip>
              <UTooltip
                text="Confirm to reschedule the call by checking the checkbox."
              >
                <UButton
                  @click="callReschedule"
                  :disabled="!reschedule"
                  icon="material-symbols:calendar-month-outline-rounded"
                  size="xl"
                  variant="solid"
                  :ui="{
                    base: 'cursor-pointer bg-[var(--primary)]/95 text-[var(--on-primary)]/90 hover:bg-[var(--primary)] hover:text-[var(--on-primary)] w-full rounded-full justify-center py-4 text-xl',
                  }"
                  >Reschedule</UButton
                ></UTooltip
              >
            </div>
          </div>
        </div>
      </template>
    </UDrawer>

    <!-- <NuxtLink to="#" class="group">
      <div class="button">
        <UIcon name="material-symbols:check-circle-rounded" class="p-5" />
        <div class="flex flex-col">
          <span class="font-medium text-lg">Reschedule</span>
          <span class="label"
            >Allow the caller to call you on your prefered date and time.</span
          >
        </div>
      </div>
    </NuxtLink> -->

    <UDrawer
      title="Drawer with description"
      description="Lorem ipsum dolor sit amet, consectetur adipiscing elit."
      :ui="{
        content: 'rounded-t-4xl',
      }"
    >
      <div class="group hover:bg-[var(--surface-container)]/10">
        <div class="button rounded-b-4xl">
          <UIcon name="material-symbols:check-circle-rounded" class="p-5" />
          <div class="flex flex-col">
            <span class="font-medium text-lg">eDNCR</span>
            <span class="label"
              >Customize eDNCR for this company or business category.</span
            >
          </div>
        </div>
      </div>

      <template #content>
        <div class="drawer_content">
          <h2>eDNCR</h2>
          <p>Customize eDNCR for this company or business category.</p>
          <div class="my-5 flex flex-col justify-center items-center">
            <div class="w-full lg:w-1/2">
              <UCheckbox
                class="mb-3"
                v-model="reject"
                size="xl"
                label="I confirm to eDNCR this call."
              />
              <UTooltip
                text="Confirm to eDNCR the call by checking the checkbox."
              >
                <UButton
                  @click="callEndcr"
                  :disabled="!reject"
                  icon="material-symbols:shield-lock-outline-rounded"
                  size="xl"
                  variant="solid"
                  :ui="{
                    base: 'cursor-pointer bg-[var(--primary)]/95 text-[var(--on-primary)]/90 hover:bg-[var(--primary)] hover:text-[var(--on-primary)] w-full rounded-full justify-center py-4 text-xl',
                  }"
                  >eDNCR</UButton
                ></UTooltip
              >
            </div>
          </div>
        </div>
      </template>
    </UDrawer>

    <!-- <NuxtLink to="#" class="group">
      <div class="button rounded-b-4xl">
        <UIcon name="material-symbols:check-circle-rounded" class="p-5" />
        <div class="flex flex-col">
          <span class="font-medium text-lg">eDNCR</span>
          <span class="label"
            >Customize eDNCR for this company or business category.</span
          >
        </div>
      </div>
    </NuxtLink> -->
  </div>
  <div v-else class="px-2">
    <div>
      <h2>Submitted</h2>
      <div
        class="my-5 py-4 rounded-2xl text-center bg-[var(--surface-container)] text-[var(--on-surface-container)]"
      >
        <h3>{{ feedback_message }}</h3>
        <p class="text-lg" v-if="feedback_message_reject">
          {{ feedback_message_reject }}
        </p>
        <p class="text-lg" v-if="feedback_message_report">
          {{ feedback_message_report }}
        </p>
      </div>
    </div>
    <div>
      <div>
        <h3>Report this call</h3>
        <p>
          If you found any violations on this call, e.i. Content of call is not
          about the correct details.
        </p>
      </div>
      <div>
        <UDrawer
          title="Drawer with description"
          description="Lorem ipsum dolor sit amet, consectetur adipiscing elit."
          :ui="{
            content: 'rounded-t-4xl',
          }"
        >
          <div class="group">
            <UTooltip text="Report this call.">
              <UButton
                icon="material-symbols:report-outline-rounded"
                size="xl"
                variant="solid"
                :ui="{
                  base: 'cursor-pointer bg-[var(--error-container)]/95 text-[var(--on-error-container)]/90 hover:bg-[var(--error-container)] hover:text-[var(--on-error-container)] w-full rounded-full justify-center py-4 text-xl',
                }"
                >Report this call</UButton
              ></UTooltip
            >
          </div>

          <template #content>
            <div class="drawer_content">
              <h3>Report this call</h3>
              <p>
                Report this company or business category for any telemarketing
                violations.
              </p>
              <div class="my-5 flex flex-col justify-center items-center">
                <div class="w-full lg:w-1/2">
                  <p
                    class="my-3 py-3 text-center rounded-md bg-[var(--error-container)] text-[var(--on-error-container)]"
                  >
                    Any tampering of screenshots or false accusation are illegal
                    and can be used against you.
                  </p>

                  <label>Describe the violation</label>
                  <UTextarea
                    v-model="report_message"
                    :maxrows="10"
                    autoresize
                    class="w-full mb-3"
                    :ui="{
                      base: 'rounded-2xl text-lg',
                    }"
                  />
                  <UFileUpload
                    icon="i-lucide-image"
                    layout="list"
                    :interactive="true"
                    multiple
                    label="Drop your screenshots here"
                    description="SVG, PNG, JPG or GIF (max. 2MB)"
                    class="w-full min-h-24"
                    :ui="{
                      base: 'rounded-2xl',
                    }"
                  >
                    <template #actions="{ open }">
                      <UButton
                        label="Select images"
                        icon="i-lucide-upload"
                        color="neutral"
                        variant="outline"
                        @click="open()"
                      />
                    </template>

                    <template #files-bottom="{ removeFile, files }">
                      <UButton
                        v-if="files?.length"
                        label="Remove all files"
                        color="primary"
                        @click="removeFile()"
                      />
                    </template>
                  </UFileUpload>
                </div>
                <div class="w-full lg:w-1/2 mt-5">
                  <UCheckbox
                    class="mb-3 justify-center"
                    v-model="reject"
                    size="xl"
                    label="I confirm to report this call."
                  />
                  <UTooltip text="Report this call.">
                    <UButton
                      @click="callReport"
                      :disabled="!reject"
                      icon="material-symbols:report-outline-rounded"
                      size="xl"
                      variant="solid"
                      :ui="{
                        base: 'cursor-pointer bg-[var(--primary)]/95 text-[var(--on-primary)]/90 hover:bg-[var(--primary)] hover:text-[var(--on-primary)] w-full rounded-full justify-center py-4 text-xl',
                      }"
                      >Report</UButton
                    ></UTooltip
                  >
                </div>
              </div>
            </div>
          </template>
        </UDrawer>
      </div>
    </div>
  </div>
</template>
<style lang="css" scoped>
@reference 'tailwindcss';

.button {
  @apply cursor-pointer px-8 py-4 bg-[var(--primary)]/95 group-hover:bg-[var(--primary)] text-[var(--on-primary)] group-hover:text-[var(--on-primary)]/90 flex flex-row gap-2 items-center;
  .label {
    @apply text-[var(--on-primary)]/70 group-hover:text-[var(--on-primary)]/70;
  }
}
.drawer_content {
  @apply px-4 pb-10;
}
div[disabled] {
  pointer-events: none;
  opacity: 0.1;
}
</style>
