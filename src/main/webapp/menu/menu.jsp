<%@ taglib prefix="s" uri="/struts-tags" %>
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
          <a class="nav-link" href="<s:url action='cadFuncionario_b'/>">Cadastro de Funcionarios</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<s:url action='relExame'/>">Relatorio de Exames</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
	