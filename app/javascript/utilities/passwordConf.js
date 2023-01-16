document.addEventListener('turbolinks:load', function(){
  var form = document.querySelector('.new_user')

  if (form) { form.addEventListener('input', checkPasswordConfirmation) }
})

function checkPasswordConfirmation() {
  var password = document.getElementById('user_password')
  var passwordConfirmation = document.getElementById('user_password_confirmation')

  var successIcon = this.querySelector('.octicon-thumbsup')
  var dangerIcon = this.querySelector('.octicon-thumbsdown')

  if (passwordConfirmation.value == "") {
    successIcon.classList.add('hide')
    dangerIcon.classList.add('hide') 
  } else if (passwordConfirmation.value == password.value) {
    successIcon.classList.remove('hide')
    dangerIcon.classList.add('hide')
  } else {
    successIcon.classList.add('hide')
    dangerIcon.classList.remove('hide')
  }
}
