package br.com.soc.sistema.business;

import java.util.ArrayList;
import java.util.List;

import br.com.soc.sistema.dao.funcionarios.FuncionarioDao;
import br.com.soc.sistema.dao.exameRealizados.ExameRealizadoDao; 
import br.com.soc.sistema.exception.BusinessException;
import br.com.soc.sistema.filter.FuncionarioFilter;
import br.com.soc.sistema.vo.FuncionarioVo;

public class FuncionarioBusiness {

    private static final String FOI_INFORMADO_CARACTER_NO_LUGAR_DE_UM_NUMERO = "Foi informado um caracter no lugar de um número";
    private FuncionarioDao dao;
    private ExameRealizadoDao exameRealizadoDao; 

    
    public FuncionarioBusiness() {
        this.dao = new FuncionarioDao();
        this.exameRealizadoDao = new ExameRealizadoDao(); 
    }

    public List<FuncionarioVo> trazerTodosOsFuncionarios() {
        return dao.findAllFuncionarios();
    }

    public List<FuncionarioVo> filtrarFuncionarios(FuncionarioFilter filter) {
        List<FuncionarioVo> funcionarios = new ArrayList<>();

        switch (filter.getOpcoesCombo()) {
            case ID:
                try {
                    Integer codigo = Integer.parseInt(filter.getValorBusca());
                    funcionarios.add(dao.findByCodigo(codigo));
                } catch (NumberFormatException e) {
                    throw new BusinessException(FOI_INFORMADO_CARACTER_NO_LUGAR_DE_UM_NUMERO);
                }
                break;

            case NOME:
                funcionarios.addAll(dao.findAllByNome(filter.getValorBusca()));
                break;
        }

        return funcionarios;
    }

    public FuncionarioVo buscarFuncionarioPor(String codigo) {
        try {
            Integer cod = Integer.parseInt(codigo);
            return dao.findByCodigo(cod);
        } catch (NumberFormatException e) {
            throw new BusinessException(FOI_INFORMADO_CARACTER_NO_LUGAR_DE_UM_NUMERO);
        }
    }

    // **********EXCLUSÃO DE FUNCIONÁRIOS**********

    public boolean excluirFuncionario(String rowid) {
        if (rowid == null || rowid.isEmpty()) {
            throw new IllegalArgumentException();
        }

        try {
            int cod = Integer.parseInt(rowid);
            return dao.deleteFuncionario(cod);
        } catch (NumberFormatException e) {
            throw new BusinessException(e.getMessage());
        }
    }

    // **********EDIÇÃO / INCLUSÃO DE FUNCIONÁRIOS**********

    public void salvarFuncionario(FuncionarioVo funcionarioVo) {
        try {
            if (funcionarioVo.getNome().isEmpty())
                throw new IllegalArgumentException("Nome não pode ser em branco");

            if (funcionarioVo.getRowid() == null || funcionarioVo.getRowid().isEmpty()) {
                dao.insertFuncionario(funcionarioVo);
            } else {
                dao.updateFuncionario(funcionarioVo);
            }
        } catch (Exception e) {
            throw new BusinessException("Não foi possível realizar a inclusão do registro");
        }
    }

    public void atualizarFuncionario(FuncionarioVo funcionarioVo) {
        if (funcionarioVo == null || funcionarioVo.getRowid() == null) {
            throw new BusinessException("Funcionário inválido para atualização.");
        }
        dao.updateFuncionario(funcionarioVo);
    }

    // **********EXCLUI REGISTROS POR FUNCIONÁRIO**********

    public void excluirFuncionarioComRegistros(String rowidFuncionario) {
        try {
            exameRealizadoDao.excluirRegistrosPorFuncionario(rowidFuncionario);


        } catch (Exception e) { 
            e.printStackTrace();
            throw new BusinessException("Erro ao excluir o funcionário: " + e.getMessage());
        }
    }
}
