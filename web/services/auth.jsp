<%@page import="java.util.UUID"%><%@include  file="../config.jsp" %><%/*%><%-- 
    Document   : auth
    Created on : Mar 26, 2013, 7:27:25 AM
    Author     : stevenlizarazo


parameters :  usr pass


return : 'closed' ,'invalid' or  OK:newsessionid:nick:name



--%>
<%*/%><%
String usr=Basic.getParam(scontext, "usr");
String pass=Basic.getParam(scontext, "pass");
usuario usuario=new usuario(scontext);
boolean valid=usuario.isValid(usr, pass,"");

if(valid){

        
String code=UUID.randomUUID().toString();
 usuario.init();
                        usuario.load("nick=" + sql.toSQL(usr, sql.adText));
                        usuario.next();
                        usuario.close();

auth_session au=new auth_session(scontext);
au.code=code;
au.usuario.setId(usuario.getId());
au.vigencia=fechas.movDate(new java.util.Date(), 20);
au.save();
%><response><status>OK</status><session><%=code%></session><userid><%=usuario.getId() %></userid><usernick><%=usuario.nick %></usernick>
<username><%=usuario.nom1+" "+usuario.ap1%></username></response><%
    
    
}

else{%><response><status>invalid</status></response><%  } %>