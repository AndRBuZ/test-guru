document.addEventListener('turbolinks:load', function() {
  const registration_form = document.getElementById('new_user')

  if (registration_form) new checkPasswordConfirmation(registration_form)
})

class checkPasswordConfirmation {
  constructor(form) {
      this.form = form
      this.password = form.elements.user_password
      this.passwordConfirmation = form.elements.user_password_confirmation

      this.event()
    }

  checkPassword() {
    const successIcon = this.form.querySelector('.octicon-thumbsup')
    const dangerIcon = this.form.querySelector('.octicon-thumbsdown')
    if (this.passwordConfirmation.value == "") {
      successIcon.classList.add('hide')
      dangerIcon.classList.add('hide') 
    } else if (this.passwordConfirmation.value == this.password.value) {
      successIcon.classList.remove('hide')
      dangerIcon.classList.add('hide')
    } else {
      successIcon.classList.add('hide')
      dangerIcon.classList.remove('hide')
    }
  }

  event() {
    this.form.addEventListener('input', this.checkPassword.bind(this))
  }
}
