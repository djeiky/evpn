function calc(){
    var sum = 0;
    
    $('#calc').find('input[type=checkbox]').each(
        function(){
           $(this).parents('tr').find('.row-count').html(0); 
           if(!this.checked){
               $(this).parents('tr').find('.count').get(0).value = 0; 
           }
        
        });
    
   
    
    
    var $checkBoxes = $('#calc').find('input:checked');
    $checkBoxes.each(function( ){
        var prnt = $(this).parents('tr').get(0);
        var count = $(prnt).find('.count').get(0).value;
        var price = parseFloat($(this).get(0).value)
        var pr_price = price * parseInt(count)
        
        if( !isNaN(count) && (count != ""))
            {
            sum +=  pr_price;
            $(prnt).find('.row-count').html(Math.round(pr_price * 100) / 100)
            }
            else
            {
               $(prnt).find('.row-count').html(0) 
            }
        
        
        
    });
    //alert(sum);
    $('#itog').find('b').html(Math.round(sum * 100) / 100);
    
    //alert("Hello world");
            return false;
        }
        
function btnUp(elem){
    var prnt = $(elem).parents('tr').get(0);
    var count = $(prnt).find('.count').get(0).value;
    count++;
    var chk = $(prnt).find('input[type=checkbox]');
     $(chk).prop("checked", true);
    $(prnt).find('.count').get(0).value = count;
    calc();
    
    return false;
}

function btnDown(elem){
    var prnt = $(elem).parents('tr').get(0);
    
    var count = $(prnt).find('.count').get(0).value;
    count--;
    var chk = $(prnt).find('input[type=checkbox]').get(0);
    if(count <= 0)
        {
            
            $(chk).prop("checked", false);
        count = 0;
        }
      
    $(prnt).find('.count').get(0).value = count;
    calc();
    
    return false;
}
