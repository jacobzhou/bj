KindEditor.ready(function(K) {
  $(".rich-text-editor").each(function(){
    K.create('#' + $(this).attr("id") , {
      uploadJson : '/kindeditor/upload',
      items : ['source', '|', 'undo', 'redo', '|', 'preview', 'cut', 'copy', 'paste',
        'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
        'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
        'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/',
        'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
        'italic', 'underline', 'strikethrough', 'removeformat', '|', 'image',
        'table', 'hr', 'link', 'unlink'],
        newlineTag : "br",
        width: '700px',
        height: $(this).height()
    });
  });
  $(".simple-editor").each(function(){
    K.create('#' + $(this).attr("id") , {
      uploadJson : '/kindeditor/upload',
      resizeType : 1,
      allowPreviewEmoticons : false,
      items : ['bold', 'italic', 'underline', 'removeformat', 'emoticons', 'image', 'link', 'unlink'],
        newlineTag : "br"
    });
  });
});
