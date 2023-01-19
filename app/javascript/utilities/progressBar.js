document.addEventListener('turbolinks:load', function () {

  const progressBar = document.querySelector('.progressBar-fill')
  if (progressBar) {
    let questionNumber = progressBar.dataset.questionNumber
    let questionCount = progressBar.dataset.questionCount

    if (questionNumber && questionCount) {
      let progressFill = ((questionNumber) / (questionCount)) * 100
      progressBar.style.width = progressFill + "%"
    }
  }
})
