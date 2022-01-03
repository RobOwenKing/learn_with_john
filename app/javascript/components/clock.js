const updateClock = (date, clock) => {
  const timezone = clock.dataset?.timezone;
  let offsetTime;

  if (clock.dataset.timezone) {
    offsetTime = date.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit', timeZone: timezone });
  } else {
    offsetTime = date.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
  }

  clock.innerText = offsetTime;
};

const updateClocks = (clocks) => {
  const date = new Date();

  clocks.forEach((clock) => {
    updateClock(date, clock);
  });
};

export const initClocks = () => {
  const clocks = document.querySelectorAll('.clock');

  updateClocks(clocks);
};
