document.addEventListener('turbolinks:load', function(){

  if (document.querySelector('.user-signup-form')){
    let form = document.querySelector('.user-signup-form')
    form.addEventListener('submit', function(event){
      let errors = false
      let username = document.getElementById('user_username').value
      let password = document.getElementById('user_password').value
      let password_confirmation = document.getElementById('user_password_confirmation').value
      document.getElementById('formErrors').innerHTML = ''

      if (username.length < 3){
        errors = true
        document.getElementById('formErrors').innerHTML += `<p class="alert alert-danger">Username must be at least 3 characters</p>`
      }

      if (username.length > 50){
        errors = true
        document.getElementById('formErrors').innerHTML += `<p class="alert alert-danger">Username must not exceed 50 characters</p>`
      }

      if (password === ''){
        errors = true
        document.getElementById('formErrors').innerHTML += `<p class="alert alert-danger">Password must not blank</p>`
      }

      if (password_confirmation === ''){
        errors = true
        document.getElementById('formErrors').innerHTML += `<p class="alert alert-danger">Password confirmation must not blank</p>`
      }

      if (password_confirmation != password){
        errors = true
        document.getElementById('formErrors').innerHTML += `<p class="alert alert-danger"p>Password must be match</p>`
      }

      fetch (`/api/username_exists?username=${username}`)
        .then(data => data.json())
        .then(obj => {
          let response = obj.user_exist
            if(obj.user_exist){
              errors = true
              document.getElementById('formErrors').innerHTML = `<p class="alert alert-danger">Username already exists</p>`
            }
        })
        if (errors) {
          event.preventDefault()
        }


      })

    }
  })
