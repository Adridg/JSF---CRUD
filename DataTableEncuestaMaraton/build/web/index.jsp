<%-- 
    Document   : index
    Created on : 16-nov-2017, 10:48:53
    Author     : Juan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">



<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <link rel="stylesheet" type="text/css" href="estilo.css">
            <title>JSP Page</title>
        </head>
        <body>
            <h3><h:outputText value="Consulta Encuesta sobre maratones!"/></h3>
           <div id="datatable">
            <h:dataTable border="1" value="#{datosDB.rset}" var="fila">
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Nombre"/>
                    </f:facet>
                    <h:outputText value="#{fila.nombre}"/>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Apellidos"/>
                    </f:facet>
                    <h:outputText value="#{fila.apellidos}"/>
                </h:column>
                  <h:column>
                    <f:facet name="header">
                        <h:outputText value="DNI"/>
                    </f:facet>
                    <h:outputText value="#{fila.dni}"/>
                </h:column>
                  <h:column>
                    <f:facet name="header">
                        <h:outputText value="Sexo"/>
                    </f:facet>
                    <h:outputText value="#{fila.sexo}"/>
                </h:column>
                  <h:column>
                    <f:facet name="header">
                        <h:outputText value="Nacionalidad"/>
                    </f:facet>
                    <h:outputText value="#{fila.nacionalidad}"/>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Marcas"/>
                    </f:facet>
                    <h:dataTable value="#{datosDB.rsMarca}" var="item1">
                        <h:column>
                             <h:outputText value="#{item1.marca}"/>
                        </h:column>
                    </h:dataTable>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Maratones"/>
                    </f:facet>
                    <h:dataTable value="#{datosDB.rsMaraton}" var="item2">
                        <h:column>
                             <h:outputText value="#{item2.maraton}"/>
                        </h:column>
                    </h:dataTable>
                </h:column>
            </h:dataTable>
           </div>
        </body>
    </html>
</f:view>
