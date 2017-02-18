function InitSummernote() {
    $('.summernote').summernote({
        lang: 'sk-SK', // default: 'en-US'

        height: 200, // set editor height

        minHeight: 200, // set minimum height of editor
        maxHeight: null, // set maximum height of editor


        toolbar: [
            //[groupname, [button list]]

            ['style', ['bold', 'italic', 'underline', 'clear']],
            ['font', ['strikethrough', 'superscript', 'subscript']],
            ['fontsize', ['fontsize']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['ins', ['link', 'hr']],
            ['codeview', ['codeview']]
        ],
        onPaste: function (e) {
            var bufferText = ((e.originalEvent || e).clipboardData || window.clipboardData).getData('Text');
            e.preventDefault();
            setTimeout(function () {
                document.execCommand('insertText', false, bufferText);
            }, 10);
        }
    });
}