/**
*Created by chengchang on 2014/12/24.
/

$(function(){
    //����
    $( "#addBreed" ).dialog({
        autoOpen: false,
        width: 794,
        buttons: [
            {
                text: "���",
                click: function() {
                    $( this ).dialog( "close" );
                    $('.bghui').remove();
                }
            },
            {
                text: "ȡ��",
                click: function() {
                    $( this ).dialog( "close" );
                    $('.bghui').remove();
                }
            }
        ]
    });	
	
	
    // Link to open the dialog(������Ʒ��)
    $( ".btn-add" ).click(function( event ) {
        var html = '<div class="bghui"></div>';
        $('body').append(html);
        $( "#addBreed" ).dialog( "open" );
        event.preventDefault();
    });
	//����޸�Ʒ��(�����Breed��ͬһ��ҳ��)
    var ReBreed = $('.operate-2');
    ReBreed.each(function(){
        $(this).click(function( event ){
            var html = '<div class="bghui"></div>';
            $('body').append(html);
            $( "#addBreed" ).dialog( "open" );
            event.preventDefault();
        })
    });	
	//���ɾ��Ʒ��
	var DeleteBreed = $('.operate-4');
    DeleteBreed.each(function(){
        $(this).click(function( event ){
            var html = '<div class="bghui"></div>';
            $('body').append(html);
            $( "#delete-breed" ).dialog( "open" );
            event.preventDefault();
        })
    });	
});