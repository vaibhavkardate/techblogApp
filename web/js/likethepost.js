/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function dolike(pid,userid)
{
   // console.log("pdid"+pid+"userid"+userid);
    
    const data={
        pid:pid,
        userid:userid,
        operation:'like'
    }
    
    $.ajax({
        url: "likeServlet",
        data: data,
        success: function (data, textStatus, jqXHR) {
            console.log(data);
            if(data.trim()=="true")
            {
                let c=$(".likecounter").html()
                c++;
                $(".likecounter").html(c)
            }
            else
            {
                let c=$(".likecounter").html()
                c--;
                $(".likecounter").html(c)
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(data);
        }
        
    })
}

