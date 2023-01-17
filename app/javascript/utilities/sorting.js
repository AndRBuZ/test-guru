document.addEventListener('turbolinks:load', function() { 
  const control = document.querySelector('.sort-by-title')

  if (control) { control.addEventListener('click', sortRowsByTitle) }
})

function sortRowsByTitle() {
  const table = document.querySelector('table')

  let rows = [].slice.call(table.querySelector('tbody').getElementsByTagName('tr'))

  if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
    rows = rows.sort(compareRowsAsc)
    this.querySelector('.octicon-arrow-up').classList.remove('hide')
    this.querySelector('.octicon-arrow-down').classList.add('hide')
  } else {
    rows = rows.sort(compareRowsDesc)
    this.querySelector('.octicon-arrow-down').classList.remove('hide')
    this.querySelector('.octicon-arrow-up').classList.add('hide')
  }

  const tBody = document.querySelector('tbody')
  tBody.innerHTML = ''
  for (let i = 0; i < rows.length; i++) {
    tBody.appendChild(rows[i])
  }

}

function compareRowsAsc(row1, row2) {
  let testTitle1 = row1.querySelector('td').textContent
  let testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) { return -1 }
  if (testTitle1 > testTitle2) { return 1 }
  return 0
}

function compareRowsDesc(row1, row2) {
  let testTitle1 = row1.querySelector('td').textContent
  let testTitle2 = row2.querySelector('td').textContent
  
  if (testTitle1 < testTitle2) { return 1 }
  if (testTitle1 > testTitle2) { return -1 }
  return 0
}
