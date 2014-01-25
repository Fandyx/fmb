<%@page import="com.stvlib.storage.*"%>
<%@page import="com.stvlib.storage.AuthInfo"%>
<%@page  import="com.stvlib.*,com.stvlib.modelos.*" %><%!

 public class httpSession extends session{
HttpSession session=null; 
     public httpSession(HttpSession session){
this.session=session;
}
    @Override
    public void setAttribute(String key, Object o) {
       session.setAttribute(key, o);
    }

    
public void setMaxInactiveInterval(int interval){

    session.setMaxInactiveInterval(interval);
} 
    @Override
    public Object getAttribute(String key) {
    return session.getAttribute(key);
    }

    @Override
    public String getId() {
    return session.getId();
    }

    @Override
    public void destroy() {
      
      session.invalidate();
    }
    
}

 
%><%


com.stvlib.scontext scontext=new com.stvlib.scontext();
 
//scontext.ruta_local=ruta_local;
scontext.start_op=System.currentTimeMillis();
scontext.servletContext=getServletContext();
scontext.REQUEST=request;
scontext.SESSION = new httpSession(session);
scontext.OUT = new com.stvlib.jspOut(pageContext.getOut());
scontext.RESPONSE=response;



scontext.schema="spentick";
scontext.use_pool=true;
scontext.setPoolName("spentick");

AuthInfo  aut__= new AuthInfo();

//au.setDriver("com.mysql.jdbc.Driver");
//au.setServerHost("sbsltda.com");
//au.setServerPort("3306");
//au.setPath("jdbc:mysql://"+au.getServerHost()+":"+au.getServerPort()+"/");
//au.setUsername("spentick");
//au.setPassword("a422f6244684357496662642f513d3d");

if("true".equals(System.getProperty("production")))
{

aut__.setDriver("com.mysql.jdbc.Driver");
aut__.setServerHost("mariadb-spentick.jelastic.servint.net");
aut__.setServerPort("3306");
aut__.setPath("jdbc:mysql://mariadb-spentick.jelastic.servint.net/");
aut__.setUsername("root");
aut__.setPassword("FJ1z7KqcZh");


}else{
aut__.setDriver("com.mysql.jdbc.Driver");
aut__.setServerHost("localhost");
aut__.setServerPort("3306");
aut__.setPath("jdbc:mysql://"+aut__.getServerHost()+":"+aut__.getServerPort()+"/");
aut__.setUsername("root");
aut__.setPassword("test");

}


scontext.setAuthInfo(aut__);

/*
//scontext.DBServerHost ="sbsltda.com";
scontext.DBServerHost ="127.0.0.1";
scontext.DBServerPort =System.getProperty("smartbiz_db_port","3306");
scontext.DBpath  ="jdbc:mysql://"+scontext.DBServerHost+":"+scontext.DBServerPort+"/";
scontext.DBDriver ="com.mysql.jdbc.Driver";
//scontext.DBusername="spentick";
//scontext.DBpassword="a422f6244684357496662642f513d3d";
scontext.DBusername="root";
scontext.DBpassword="";
*/
com.stvlib.storage.sql.loadDriver(scontext);
//System.getProperty("smartbiz_db_password","olipuadjolipuadjolipuadjolipuadj123");
%><%!
    
    //Definicion de todos los modelos
    
   
    public usuario getUsuario(scontext scontext,String session)throws Exception{
    auth_session au=new auth_session(scontext);
    au.init();
    au.load("code="+sql.toSQL(session, sql.adText));
    au.next();
    au.close();
    
    return au.usuario;
    }
    
    
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************


    
public class follow_to extends sqlgen{
public usuario usuario=new usuario(scontext);
public java.util.Date fecha=new java.util.Date();
public usuario follow_to=new usuario(scontext);

public String getTituloGlobal(){return getName();}  public String getIndex(){return "usuario follow_to";}

public String getTitulo(){return "";}
public String validar(){
						return "";
						}

public follow_to(scontext s){super(s);}


 

public void reset(){
restart(); }
}


    
public class follow_to_opt extends sqlgen{
public int usuario =0;
public java.util.Date fecha=new java.util.Date();
public int follow_to =0;
private int usr=0;
public void setUsr(int i){usr=i;}

public String tableName(){return "follow_to_opt_"+usr; }
public String getTituloGlobal(){return getName();}  public String getIndex(){return "usuario follow_to";}

public String getTitulo(){return "";}
public String validar(){
						return "";
						}

public follow_to_opt(scontext s){super(s);}


 

public void reset(){
restart(); }
}


   
        //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************


    
public class hashtags extends sqlgen{
public String palabra="";

public String getTituloGlobal(){return getName();}  public String getIndex(){return "palabra(10)";}

public String getTitulo(){return "";}
public String validar(){
						return "";
						}
public hashtags(scontext s){super(s);}
public void reset(){
restart(); }
}

    
public class hashtags_content extends sqlgen{
public content contenido=new content(scontext);
public java.util.Date fecha=new java.util.Date();
public hashtags palabra=new  hashtags(scontext);
public comentario comentario = new comentario(scontext);

public String getTituloGlobal(){return getName();}  public String getIndex(){return "contenido palabra fecha comentario";}

public String getTitulo(){return "";}
public String validar(){
						return "";
						}

public hashtags_content(scontext s){super(s);}


 

public void reset(){
restart(); }
}



public class usertags_content extends sqlgen{
public content contenido=new content(scontext);
public java.util.Date fecha=new java.util.Date();
public usuario usuario=new  usuario(scontext);
public comentario comentario = new comentario(scontext);

public String getTituloGlobal(){return getName();}  public String getIndex(){return "contenido usuario fecha comentario";}

public String getTitulo(){return "";}
public String validar(){
						return "";
						}

public usertags_content(scontext s){super(s);}


 

public void reset(){
restart(); }
}
    
     //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************

public class content extends sqlgen{
public String uuid;
public category category= new category(scontext);
public java.util.Date fecha=new java.util.Date();
public String text="";
public double lat=0;
public double lon=0;
public double cost=0;
public currency currency= new currency(scontext);
public yesno shared= new yesno(scontext);
public usuario usuario=new usuario(scontext);

public String getTituloGlobal(){return getName();}  public String getIndex(){return "code(15) usuario vigencia";}

public String getTitulo(){return "";}
public String validar(){
						return "";
						}

public content(scontext s){super(s);}


 

public void reset(){
restart(); }
}




    
    
    
    
    //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************


    
public class content_img extends sqlgen{
public int content=0;
public int adjunto=0;
public java.util.Date fecha=new java.util.Date();

public String getTituloGlobal(){return getName();}  



public String getIndex(){return "content fecha adjunto";}

public String getTitulo(){return "";}
public String validar(){
						return "";
						}

public content_img(scontext s){super(s);}


 

public void reset(){
restart(); }
}


    




public class usuario_img extends sqlgen{
public usuario usuario=new usuario(scontext);
public adjuntos adjunto=new adjuntos(scontext);

public String getTituloGlobal(){return getName();}  public String getIndex(){return "usuario adjunto";}

public String getTitulo(){return "";}
public String validar(){
						return "";
						}

public usuario_img(scontext s){super(s);}


 

public void reset(){
restart(); }
}


    



    
    
    
    
    //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************

public class auth_session extends sqlgen{
public String code;
public java.util.Date vigencia=new java.util.Date();
public java.util.Date last_visit=new java.util.Date();
public usuario usuario=new usuario(scontext);

public String getTituloGlobal(){return getName();}  public String getIndex(){return "code(15) usuario vigencia";}
public String getTitulo(){return "";}
public String validar(){
						return "";
						}

public auth_session(scontext s){super(s);}

private static final String internal_name="cargo";

 public String cargo(){return internal_name;}

 

public void reset(){
restart(); }
}


//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    

public class usuario extends sqlgen {

    public String nom1 = "";
    public String nom2 = "";
    public String ap1 = "";
    public String ap2 = "";
    public String direccion = "";
    public String telefono = "";
    public String movil = "";
    public String email = "";
    public String password = "";
    public String nick = "";
    public String bio="";
    public sexo sexo = new sexo(scontext);
    public yesno bloqueado = new yesno(scontext);
    

 
    
  public String orderBy(){return "ap1,nom1";}

public String title_nick(){return "Nombre de usuario"; }

public String title_nom1(){return "Primer nombre"; }
public String title_nom2(){return "Segundo nombre"; }
public String title_ap1(){return "Primer apellido"; }
public String title_ap2(){return "Segundo apellido"; }
 
    public java.util.Date creado=new java.util.Date();

    public usuario(scontext s) {
        super(s);

    }

    public String props_password() {
        return "htmlListHide";
    }

    public String show_email_password() {
        return "*****";
    }

    public String props_email_password() {
        return "htmlListHide";
    }

    public String searchIn() {
        return "centro_de_costos documento nom1 ap1 nom2 ap2 nick";
    }

    public String relevantData() {
        return "nom1 ap1 direccion_principal telefono_principal movil_principal tipo_de_documento documento sexo email bodegas_autorizadas";
    }

    public void change_password(String opassword, String npas, String vpas) throws Exception {
//Fix: verificar si es seguro
        if (getId() == 0) {
            throw new Exception("Instancia invalida");
        }
        if (Basic.isEmpty(npas)) {
            throw new Exception("El nuevo password no puede estar vacio");
        }

        if (password.length() == 32 && !password.equalsIgnoreCase(crypto.MD5(opassword))) {
            throw new Exception("Password invalido");
        }
        if (password.length() != 32 && !password.equalsIgnoreCase(opassword)) {
            throw new Exception("Password invalido");
        }

        if (!npas.equals(vpas)) {
            throw new Exception("No coincideb las contrase“as ");
        }
        int sw = 0;

        if (!isLoaded()) {
            init();
            sw = 1;
        }
        password = crypto.MD5(npas);
        update();
        if (sw == 1) {
            close();
        }
    }
    public boolean isValid(String _nick, String _password, String _vkey) {
        boolean t;
        int sw = 0;
            usuario u = new usuario(scontext);
        try {
            u.init();
            u.setSubLoad(false);
            u.load("nick=" + sql.toSQL(_nick, sql.adText));
            u.next();
            u.close();
            if (u.getId() == 0) {
                return false;
            }
            if (u.password.length() != 32 && !u.password.equals(_password)) {
                return false;
            }
            if (u.password.length() == 32 && !u.password.equals(crypto.MD5(_password))) {
                return false;
            }

            
            return true;
        } catch (Exception e) {
            System.out.println("usuario.isValid " + e);
            return false;
        }
    }

    public boolean isValidMD5(String _nick, String _password, String _vkey, String mdkey) {
        boolean t;
        int sw = 0;
        try {
 
            usuario u = new usuario(scontext);
            u.init();
            u.load("nick=" + sql.toSQL(_nick, sql.adText) //        +" AND ( ( "
                    //+"LENGTH(password)=32 AND MD5(CONCAT('"+mdkey+"',password))="+sql.toSQL(_password,sql.adText)+") OR "
                    //+"( LENGTH(password)<>32 AND MD5(CONCAT('"+mdkey+"',MD5(password)))="+sql.toSQL(_password,sql.adText)+"))"
                    );
 

//if(u.password.length()!=32&&!u.password.equals(_password))return false;

//u.load("nick="+sql.toSQL(_nick,sql.adText)+" AND crypto.MD5(CONCAT('"+mdkey+"',password))="+sql.toSQL(_password,sql.adText));

            u.next();

            u.close();
            if (u.getId() == 0) {
                return false;
            }
            if (u.password.length() == 32 && !crypto.MD5((mdkey + u.password)).equals((_password))) {
                return false;
            }
            if (u.password.length() != 32 && !crypto.MD5((mdkey + crypto.MD5(u.password))).equals(_password)) {
                return false;
            }

            
            return true;
        } catch (Exception e) {
            System.out.print(e);
            return false;
        }
    }

    public String getTituloGlobal() {
        return getName();
    }

    public String getIndex() {
        return "";
    }//campos indexados separados por espacios ej: "nombre apellido(3)"
    public String getTitulo() {
        return nom1 + " " + ap1;
    }

    public String validar() {
      
        return "";
    }//retorna "" si todo es correcto, de lo contrario
    public void reset() {//
        restart();

        nom1 = "";
        nom2 = "";
        ap1 = "";
        ap2 = "";
     
        password = "";
        sexo.reset();
        nick = "";
        email = "";
     
    }
}
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************

public class empresa extends sqlgen {

    public String nit = "";
    public String razon_social = "";
    public String nick = "";
    public category sector = new category(scontext);
    public String telefono = "";
    public String email = "";
    public String password = "";
    public String bio="";
    

 
    
  public String orderBy(){return "user";}

public String title_nick(){return "Nombre de usuario"; }

public String title_nom1(){return "Primer nombre"; }
public String title_nom2(){return "Segundo nombre"; }
public String title_ap1(){return "Primer apellido"; }
public String title_ap2(){return "Segundo apellido"; }
 
    public java.util.Date creado=new java.util.Date();

    public empresa(scontext s) {
        super(s);

    }

    public String props_password() {
        return "htmlListHide";
    }

    public String show_email_password() {
        return "*****";
    }

    public String props_email_password() {
        return "htmlListHide";
    }

    public String searchIn() {
        return "razon_social nit nick";
    }

    public String relevantData() {
        return "razon_social nit nick";
    }

    public void change_password(String opassword, String npas, String vpas) throws Exception {
//Fix: verificar si es seguro
        if (getId() == 0) {
            throw new Exception("Instancia invalida");
        }
        if (Basic.isEmpty(npas)) {
            throw new Exception("El nuevo password no puede estar vacio");
        }

        if (password.length() == 32 && !password.equalsIgnoreCase(crypto.MD5(opassword))) {
            throw new Exception("Password invalido");
        }
        if (password.length() != 32 && !password.equalsIgnoreCase(opassword)) {
            throw new Exception("Password invalido");
        }

        if (!npas.equals(vpas)) {
            throw new Exception("No coincideb las contrase“as ");
        }
        int sw = 0;

        if (!isLoaded()) {
            init();
            sw = 1;
        }
        password = crypto.MD5(npas);
        update();
        if (sw == 1) {
            close();
        }
    }
    public boolean isValid(String _nick, String _password, String _vkey) {
        boolean t;
        int sw = 0;
            usuario u = new usuario(scontext);
        try {
            u.init();
            u.setSubLoad(false);
            u.load("nick=" + sql.toSQL(_nick, sql.adText));
            u.next();
            u.close();
            if (u.getId() == 0) {
                return false;
            }
            if (u.password.length() != 32 && !u.password.equals(_password)) {
                return false;
            }
            if (u.password.length() == 32 && !u.password.equals(crypto.MD5(_password))) {
                return false;
            }

            
            return true;
        } catch (Exception e) {
            System.out.println("usuario.isValid " + e);
            return false;
        }
    }

    public boolean isValidMD5(String _nick, String _password, String _vkey, String mdkey) {
        boolean t;
        int sw = 0;
        try {
 
            usuario u = new usuario(scontext);
            u.init();
            u.load("nick=" + sql.toSQL(_nick, sql.adText) //        +" AND ( ( "
                    //+"LENGTH(password)=32 AND MD5(CONCAT('"+mdkey+"',password))="+sql.toSQL(_password,sql.adText)+") OR "
                    //+"( LENGTH(password)<>32 AND MD5(CONCAT('"+mdkey+"',MD5(password)))="+sql.toSQL(_password,sql.adText)+"))"
                    );
 

//if(u.password.length()!=32&&!u.password.equals(_password))return false;

//u.load("nick="+sql.toSQL(_nick,sql.adText)+" AND crypto.MD5(CONCAT('"+mdkey+"',password))="+sql.toSQL(_password,sql.adText));

            u.next();

            u.close();
            if (u.getId() == 0) {
                return false;
            }
            if (u.password.length() == 32 && !crypto.MD5((mdkey + u.password)).equals((_password))) {
                return false;
            }
            if (u.password.length() != 32 && !crypto.MD5((mdkey + crypto.MD5(u.password))).equals(_password)) {
                return false;
            }

            
            return true;
        } catch (Exception e) {
            System.out.print(e);
            return false;
        }
    }

    public String getTituloGlobal() {
        return getName();
    }

    public String getIndex() {
        return "";
    }//campos indexados separados por espacios ej: "nombre apellido(3)"
    public String getTitulo() {
        return razon_social;
    }

    public String validar() {
      
        return "";
    }//retorna "" si todo es correcto, de lo contrario
    public void reset() {//
        restart();

        razon_social = "";
        nit = "";
       
        email = "";
     
        password = "";
        sector.reset();
        nick = "";

     
    }
}
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
public class currency extends sqlgen{
public String valor="";
public String av="";
public String getTituloGlobal(){return getName();}  public String getIndex(){return "";}

public String getTitulo(){return valor;}

public String validar(){
						return "";
						}

public currency(scontext s){super(s);}


 

public void reset(){
restart(); }

}
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
public class category extends sqlgen{
public String category="";

public String getTituloGlobal(){return getName();}  public String getIndex(){return "";}

public String getTitulo(){return category;}

public String validar(){
						return "";
						}

public category(scontext s){super(s);}


 

public void reset(){
restart(); }

} //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
public class wishcategory extends sqlgen{
public String category="";
public String getTituloGlobal(){return getName();}  public String getIndex(){return "";}

public String getTitulo(){return category;}

public String validar(){
						return "";
						}

public wishcategory(scontext s){super(s);}


 

public void reset(){
restart(); }

}

    //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************

public class time_line_global extends sqlgen{
    
public String content_uuid="";
public int content=0;
public java.util.Date fecha;
public String text="";
public int notificada=0;
public int vista=0;
public int image=0;
public usuario usuario= new usuario(scontext);
public usuario usuario_generador=new usuario(scontext);
public String nick="";
public String usuario_generador_nick="";

public String getTituloGlobal(){return getName();}  public String getIndex(){return "";}

public String getTitulo(){return content_uuid;}

public String validar(){return "";}

public time_line_global(scontext s){super(s);}


 

public void reset(){
restart(); }

}





    //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************


public class notificationManager{
scontext scontext=null;
public notificationManager(scontext s){

scontext=s;}

public void reportarComentario(scontext scontext, usuario comentador,   comentario comentario  )throws Exception{

notification_global nt=new notification_global(scontext);
nt.content_uuid=comentario.content_uuid;
nt.content=comentario.content.getId();
nt.usuario_afectado=comentario.usuario.getId();
nt.usuario_afectado_nick= comentario.usuario.nick;

nt.usuario_generador=comentador.getId();
nt.usuario_generador_nick=comentador.nick;

nt.tipo=10;
nt.save();
  follow_to fto=new follow_to(scontext);
fto.init();

fto.load("follow_to="+comentador.getId());
while(fto.next()){
    if(fto.usuario.getId()!=comentador.getId()){
    
        notification_global nt2=new notification_global(scontext);
nt2.content_uuid=comentario.content_uuid;
nt2.content=comentario.content.getId();
nt2.usuario_afectado=comentario.usuario.getId();
nt2.usuario_afectado_nick= comentario.usuario.nick;

nt2.usuario_generador=comentador.getId();
nt2.usuario_generador_nick=comentador.nick;

nt2.tipo=11;
nt2.save();
    }
}

fto.close();






}

}


public class notification_global extends sqlgen{
public java.util.Date fecha=new java.util.Date();
public String content_uuid="";
public int content=0;
public int tipo     =0; // 10=alguien comento tu tick, 11=alguien que sigues comento en un tick , 20=tal persona agrego a wish 21=alguien agrego un tic tuyo al wish list,30= like, 40 amigo se une, 50=alguien te sigue, 
public String text  ="";
public int notificada=0;
public int vista=0;
public int image=0;
public int usuario_afectado=0;
public int usuario_generador=0;

public String usuario_generador_nick="";
public String usuario_afectado_nick="";


public String getTituloGlobal(){return getName();}  public String getIndex(){return "";}

public String getTitulo(){return content_uuid;}

public String validar(){return "";}

public notification_global(scontext s){super(s);}

public void reset(){
restart(); }

}
    //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
 //********************************************************************************************************
public class wishlist extends sqlgen{

public content content=new content(scontext);
public String content_uuid="";
public usuario usuario=new usuario(scontext);
public String titulo="";
public wishcategory wishcategory=new wishcategory(scontext);
public int comprado=0;
public int sharing_cost=0;
public int sharing_location=0;
public int sharing_twitter=0;
public int sharing_facebook;
public java.util.Date fecha;

public String getTituloGlobal(){return getName();}  public String getIndex(){return "";}

public String getTitulo(){return content_uuid;}

public String validar(){return "";}

public wishlist(scontext s){super(s);}


 

public void reset(){
restart(); }

}





public class sexo extends sqlgen{
public String sexo="";
public String av="";
private static final String internal_name="sexo";
public String getName(){return internal_name;}

public String getTituloGlobal(){return getName();}
public String getIndex(){return "";}
public sexo(scontext s){super(s);}
public void initial_values()
{
sexo s=new sexo(scontext);
try{
s.setNextId(1);
        s.sexo = "Masculino" ;
s.av="M";
s.save();
s.reset();
s.setNextId(2);

s.sexo = "Femenino" ;
s.av="F";
s.save();

}catch(Exception e){}
}

public String getTitulo(){return sexo;}
public String validar(){
if(!Basic.isEmpty(sql.lookUp(scontext,tableName(),"sexo" ,"sexo="+sql.toSQL(sexo,sql.adText)  )))return "ya existe";
						if(Basic.isEmpty(sexo))return "sexo invalido";
						return "";
						}
public void reset(){
 sexo="";
av="";
restart(); }
}








public class calificacion extends sqlgen{
public content content=new content(scontext);
public String content_uuid="";
public int voto=1;
public java.util.Date fecha=new java.util.Date();

public usuario usuario=new usuario(scontext);

public String getTituloGlobal(){return "Rating";} 
public String getIndex(){return "content content_uuid(10) fecha voto";}
 public calificacion(scontext s){super(s);}

public String getTitulo(){return  " " ;}
public String validar(){ 
try{


}catch(Exception e){};
						return "";
						}
public void reset(){
 fecha=new java.util.Date();

restart(); }
}


public class comentario extends sqlgen{
public content content=new content(scontext);
public String content_uuid="";
public @SText String nota="";
public java.util.Date fecha=new java.util.Date();

public usuario usuario=new usuario(scontext);

public String getTituloGlobal(){return "Rating";} 
public String getIndex(){return "content content_uuid(10) fecha";}
 public comentario(scontext s){super(s);}

public String getTitulo(){return  " " ;}
public String validar(){ 
try{

}catch(Exception e){};
						return "";
						}
public void reset(){
 fecha=new java.util.Date();
content.reset();
usuario.reset();

restart(); }
}


%>




<%{currency c = new currency(scontext);
c.init();
c.load();
c.next();
c.close();}
{
usuario uinit = new usuario(scontext);
uinit.init();
uinit.load();
uinit.next();
uinit.close();}
{
category wishli = new category(scontext);
wishli.init();
wishli.load();
wishli.next();
wishli.close();}
%>
