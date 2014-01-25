// Put your custom code here

var host = 'http://192.168.1.205:8080/Spentick/';




function sendPost(imageb64, texto,costo,_currency,_share, callback) {
    var imgo=imageb64.replace("+","-");
    
    imgo=imgo.replace("/","_");
    imgo=imgo.replace("=",",");
    
    $.ajax({
           type: "POST",
           crossDomain:'true',
           url: host + "services/postspentick.jsp",
           data: {
           session: localStorage.getItem('session'),
           text: texto,
           cost: costo,
           currency: _currency,
           share: _share,
           img: imgo
           },
           dataType: "html",
           success: function(data) {
           
           var xml = $.parseXML( data );// data;
           
           
           
           var status = $(xml).find('status').text();
           var content = $(xml).find('id').text();
           var content_uuid = $(xml).find('uuid').text();
           var adjunto = $(xml).find('adjunto').text();
           //  var adjunto = $(this).find('adjunto').text();
           var content_img = $(xml).find('content_img').text();
           var usuario=localStorage.getItem('userid');
           
           if (status == "OK") {
           var res=[content,content_uuid,texto,usuario];
           db.transaction(function(tx) {
                          tx.executeSql('INSERT INTO sql_content(id, uuid, text,usuario)values(?,?,?,?);'
                                        ,res
                                        ,function(tx, results){                     /*     alert('Returned ID: ' + results.insertId);*/                     });
                          },   function(er){alert(er.message);/*alert(er.message);*/                     });
           
           
           
           var res2=[content_img,content,adjunto];
           db.transaction(function(tx) {
                          tx.executeSql('INSERT INTO sql_content_img(id, content, adjunto)values(?,?,?);'
                                        ,res2
                                        ,function(tx, results){                     /*     alert('Returned ID: ' + results.insertId);*/                     });
                          },   function(er){alert(er.message);/*er.message*/                     });
           var res3=[adjunto,imageb64];
           db.transaction(function(tx) {
                          tx.executeSql('INSERT INTO sql_adjuntos(id, dato)values(?,?);'
                                        ,res3
                                        ,function(tx, results){                     /*     alert('Returned ID: ' + results.insertId);*/                     });
                          },   function(er){alert(er.message);/*er.message*/                     });
           
           callback(true);
           /*
            var res=[$(this).find('id').text(),$(this).find('content_uuid').text(),content,fecha,$(this).find('text').text(),0,0,$(this).find('usuario').text(),usuario,$(this).find('usuario_nick').text(),$(this).find('usuario_generador_nick').text(),$(this).find('imageid').text() ];
            db.transaction(function(tx) {
            
            //  localStorage.setItem('lastdate',fecha);
            tx.executeSql('INSERT INTO sql_time_line_global(id, content_uuid, content,fecha,text,notificada,vista,usuario,usuario_generador,usuario_nick,usuario_generador_nick,image)values(?,?,?,?,?,?,?,?,?,?,?,?);'
            ,res
            ,function(tx, results){
            //     alert('Returned ID: ' + results.insertId);
            }
            
            );
            
            },
            function(er){
            //alert(er.message);
            });
            
            */
           
           
           }else{
           
           callback(false);
           }
           
           
           }
           });
    
    
    
    
    
}

function updateTimeLine(r) {
    
    $.support.cors = true;
    $.mobile.allowCrossDomainPages = true;
    $.ajax({
           type: "POST",
           crossDomain:'true',
           url: host + "services/timeline.jsp",
           data: {
           session: localStorage.getItem('session'),
           lastdate: localStorage.getItem('lastdate')
           },
           dataType: "html",
           success: function(data) {
           
           //var   xmlDoc = ;
           //$xml = $( xmlDoc );
           var xml = $.parseXML( data );
           
           
           $(xml).find('content').each(function()
                                       {
                                       
                                       
                                       var fecha = $(this).find('fecha').text();
                                       var content = $(this).find('content').text();
                                       var usuario = $(this).find('usuario_generador').text();
                                       
                                       var res = [$(this).find('id').text(), $(this).find('content_uuid').text(), content, fecha, $(this).find('text').text(), 0, 0, $(this).find('usuario').text(), usuario, $(this).find('usuario_nick').text(), $(this).find('usuario_generador_nick').text(), $(this).find('imageid').text()];
                                       db.transaction(function(tx) {
                                                      
                                                      localStorage.setItem('lastdate', fecha);
                                                      
                                                      tx.executeSql('INSERT INTO sql_time_line_global(id, content_uuid, content,fecha,text,notificada,vista,usuario,usuario_generador,usuario_nick,usuario_generador_nick,image)values(?,?,?,?,?,?,?,?,?,?,?,?);'
                                                                    , res
                                                                    , function(tx, results) {
                                                                    
                                                                    }
                                                                    
                                                                    );
                                                      
                                                      },
                                                      function(er) {
                                                      //alert(er.message);
                                                      });
                                       
                                       
                                       
                                       
                                       
                                       // alert($(this).find('text').text()) // works fine, shows peter then mary on the next loop of "each"
                                       });
           //$status = $xml.find( "status" );
           
           
           r();
           
           
           }
           });
    
    
    //    var date=localStorage.getItem('');
    
}



var db = window.openDatabase("dba11", "1.0", "Database", 200000);

db.transaction(populateDB, errorCB, successCB);

function errorCB(err) {
    if (err.code) {
        console.log("Error processing SQL: " + err.code);
    }
}

// Transaction success callback
//
function successCB() {
    //  alert("success!");
}

function populateDB() {
    //  alert("success!");
}











function checkLogin(_usr,_pass,callback){
    console.log('Checking auth');
    $.ajax({
           url:host+ "services/auth.jsp",
           crossDomain:'true',
           type: "post",
           
           data: {usr:_usr,pass:_pass},
           success: function(data){
               console.log('Checking success');
           //   alert(data);
           xmlDoc = $.parseXML( data );
           $xml = $( xmlDoc );
           
           $status = $xml.find( "status" );
           $session = $xml.find( "session" );
           $nick = $xml.find( "usernick" );
           $uid = $xml.find( "userid" );
           if($status.text()=="OK"){
           localStorage.setItem('session',$session.text());
           localStorage.setItem('usernick',$nick.text());
           localStorage.setItem('userid',$uid.text());
           
           callback(true);
           
           }else{
           
           callback(false);
           }
           },
           error:function(xhr, ajaxOptions, thrownError){
           //alert("Error");
                          console.log('Checking error');
//           alert(xhr.responseText);
           //alert(thrownError.message);
           
           
           }
           });
}





//*******************************

//*******************************

//*******************************

//*******************************




function updateProfile(profile) {
    
    $.support.cors = true;
    $.mobile.allowCrossDomainPages = true;
    $.ajax({
           type: "POST",
           crossDomain:'true',
           url: host + "services/profile.jsp",
           data: {
           session: localStorage.getItem('session'),
           profile:profile
           },
           dataType: "html",
           success: function(data) {
           
           //var   xmlDoc = ;
           //$xml = $( xmlDoc );
           
           var xml = $.parseXML( data );
           $('#nicktext').html('@'+profile);
           
           $following = $(xml).find( "following" );
           $followers = $(xml).find( "followers" );
           $ticks = $(xml).find( "ticks" );
           $wishlist = $(xml).find( "wishlist" );
           //alert();
           $("#followingtext").html($following.text());
           $("#followerstext").html($followers.text());
           $("#tickstext").html($ticks.text());
           $("#wishlisttext").html($wishlist.text());
           
           
           
           $("#content_list").empty()	
           
           
           
           
           
           //        			$("#content_list").listview('refresh');
           
           $(xml).find('content').each(function()
                                       {
                                       
                                       
                                       var uuid = $(this).find('uuid').text();
                                       var imgid = $(this).find('imgid').text();
                                       var id = $(this).find('id').text();
                                       
                                       // alert(uuid);
                                       $("#content_list").append(" <div class=\"contentthumb\">\
                                                                 <img src=\""+host+"images.jsp?id="+imgid+"\"   class=\"contentthumbimg\">\
                                                                 </div>");
                                       
                                       
                                       
                                       // alert($(this).find('text').text()) // works fine, shows peter then mary on the next loop of "each"
                                       });
           //$status = $xml.find( "status" );
           
           
           //            r();
           
           
           }
           });
    
    
    //    var date=localStorage.getItem('');
    
}

