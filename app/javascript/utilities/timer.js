document.addEventListener('turbolinks:load', function () {

  const getTimer = document.querySelector('.timer')

  if (getTimer) { setInterval(timeCount, 1000) }

  let time = getTimer.dataset.timer

  function timeCount() {
    if (time > 60) {
      getTimer.innerHTML = 'Time Left ' + Math.round(time / 60) + 'min'
    } else if (time < 60 && time > 0) {
      getTimer.innerHTML = 'Time left ' + Math.round(time) + 'sec'
    } else if (time <= 0) {
      window.location.href = window.location.href + '/result'
    }
    time--
  }
})
