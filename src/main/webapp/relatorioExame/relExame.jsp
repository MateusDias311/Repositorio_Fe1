<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="../menu/menu.jsp" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title><s:text name="label.titulo.pagina.consulta"/></title>
        <link rel='stylesheet' href='webjars/bootstrap/5.1.3/css/bootstrap.min.css'>
    </head>
    <body class="bg-secondary">  
        <div class="container">
            <div class="row mt-5 mb-2">
                <div class="col-sm p-0">
                    <s:form action="/relatorioExames.action">
                        <div class="input-group">
                            <span class="input-group-text">
                                <strong><s:text name="label.buscar.por"/></strong>
                            </span>   
                            <s:select  
                                cssClass="form-select" 
                                name="filtrar.opcoesCombo" 
                                list="listaOpcoesCombo"  
                                headerKey=""  
                                headerValue="Escolha..." 
                                listKey="%{codigo}" 
                                listValueKey="%{descricao}"
                                value="filtrar.opcoesCombo.codigo"                                    
                            />
                            <s:textfield cssClass="form-control" id="nome" name="filtrar.valorBusca"/>
                            <button class="btn btn-primary" type="submit"><s:text name="label.pesquisar"/></button>
                        </div>
                    </s:form>            
                </div>                
            </div>

            <div class="row">
                <table class="table table-light table-striped align-middle">
                    <thead>
                        <tr>
                            <th><s:text name="label.id"/></th>
                            <th><s:text name="label.nome"/></th>
                            <th><s:text name="label.data"/></th>
                        </tr>
                    </thead>
                    
                    <tbody>
                        <s:iterator value="examesRealizados">
                            <tr>
                                <td>${rowid}</td>
                                <td>${nome}</td>
                                <td>${data}</td>
                            </tr>
                        </s:iterator>
                    </tbody>          
                </table>
            </div>

            <div class="row">
            </div>
        </div>
        
        <script src="webjars/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
