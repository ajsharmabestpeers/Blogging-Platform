document.addEventListener("DOMContentLoaded", function() {
    const textareas = document.querySelectorAll('.ckeditor');
    textareas.forEach(textarea => {
      ClassicEditor
        .create(textarea, {
        //   toolbar: ['bold', 'italic', 'link', 'undo', 'redo' ,  'heading' , 'uploadImage' , 'link', '|' , 
        //     'blockQuote', 'codeBlock',]  
        // })
        toolbar: [ 'undo', 'redo',
            '|', 'heading',
            '|', 'fontfamily', 'fontsize', 'fontColor', 'fontBackgroundColor',
            '|', 'bold', 'italic', 'strikethrough', 'subscript', 'superscript', 'code',
            '-', // break point
            '|', 'alignment',
            'link', 'uploadImage', 'blockQuote', 'codeBlock',
            '|', 'bulletedList', 'numberedList', 'todoList', 'outdent', 'indent']  
        })

        .catch(error => {
          console.error(error);
        });
    });
  });
  