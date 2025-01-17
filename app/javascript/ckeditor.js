document.addEventListener("DOMContentLoaded", function() {
    const textareas = document.querySelectorAll('.ckeditor');
    textareas.forEach(textarea => {
      ClassicEditor
        .create(textarea, {
          toolbar: ['bold', 'italic', 'link', 'undo', 'redo' ,  'heading' , 'uploadImage' , 'link', '|' , 
            'blockQuote', 'codeBlock',]  
        })
        .catch(error => {
          console.error(error);
        });
    });
  });
  