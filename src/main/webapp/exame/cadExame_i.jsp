<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1">
    <title>
      <s:if test="%{#exameVo.rowid != null && #exameVo.rowid != ''}">
        <s:text name="label.titulo.pagina.editar" />
      </s:if>
      <s:else>
        <s:text name="label.titulo.pagina.cadastro" />
      </s:else>
    </title>
    <link rel='stylesheet' href='webjars/bootstrap/5.1.3/css/bootstrap.min.css'>
  </head>
  <body class="bg-secondary">
    <!-- Menu -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">Menu</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link" href="<s:url action='cadExame_b'/>">Cadastro de Exames</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="<s:url action='cadExameRealizado_b'/>">Cadastro de Exames Realizados</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="<s:url action='cadFuncionario_b'/>">Cadastro de Funcionários</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="<s:url action='relExame'/>">Relatório de Exames</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Formulário de Cadastro/Edição de Exame -->
    <div class="container">
      <s:form action="/novoExames.action">
        <div class="card mt-5">
          <div class="card-header">
            <div class="row">
              <div class="col-sm-5">
                <s:url action="todosExames" var="todos" />
                <a href="${todos}" class="btn btn-success">Exames</a>
              </div>
              <div class="col-sm">
                <h5 class="card-title">
                  <s:if test="%{#exameVo.rowid != null && #exameVo.rowid != ''}">
                    Editar Exame
                  </s:if>
                  <s:else>
                    Novo Exame
                  </s:else>
                </h5>
              </div>
            </div>
          </div>

          <div class="card-body">
            <div class="row align-items-center">
              <label for="id" class="col-sm-1 col-form-label text-center">
                Codigo:
              </label>

              <div class="col-sm-2">
                <s:textfield cssClass="form-control" id="id" name="exameVo.rowid" readonly="true" />
              </div>
            </div>

            <div class="row align-items-center mt-3">
              <label for="nome" class="col-sm-1 col-form-label text-center">
                Nome:
              </label>

              <div class="col-sm-5">
                <s:textfield cssClass="form-control" id="nome" name="exameVo.nome" />
              </div>
            </div>
          </div>

          <div class="card-footer">
            <div class="form-row">
              <button class="btn btn-primary col-sm-4 offset-sm-1">Salvar</button>
              <button type="reset" class="btn btn-secondary col-sm-4 offset-sm-2">Limpar Formulario</button>
            </div>
          </div>
        </div>
      </s:form>
    </div>

    <!-- Scripts -->
    <script src="webjars/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
