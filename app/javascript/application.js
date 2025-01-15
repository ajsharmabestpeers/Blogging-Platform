// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// app/javascript/application.js
import "@hotwired/turbo-rails"
import "controllers"
import "popper"
import "bootstrap"
import Rails from '@rails/ujs'
Rails.start()
// import ClassicEditor from 'ckeditor5/build/ckeditor';

// document.addEventListener("turbolinks:load", function() {
//   if (document.querySelector('.ckeditor')) {
//     ClassicEditor
//       .create(document.querySelector('.ckeditor'))
//       .catch(error => {
//         console.error(error);
//       });
//   }
// });
