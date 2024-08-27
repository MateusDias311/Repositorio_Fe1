package br.com.soc.sistema.business;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.soc.sistema.action.relExame.relExameAction; // Importação correta

@WebServlet("/relatorioExames") 
public class RelExameServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    
    private static final String DB_URL = "http://localhost:8080/avaliacao"; 
    private static final String DB_USER = ""; 
    private static final String DB_PASSWORD = ""; 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String dataInicial = request.getParameter("dataInicial");
        String dataFinal = request.getParameter("dataFinal");

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        List<relExameAction> exames = new ArrayList<>();

        try (Connection conn = getConnection()) { 
            String query = "SELECT * FROM exameRealizado WHERE dataRealizacao BETWEEN ? AND ?";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, dataInicial);
                stmt.setString(2, dataFinal);

                try (ResultSet rs = stmt.executeQuery()) {
                    while (rs.next()) {
                        relExameAction exame = new relExameAction();
                        exame.setId(rs.getInt("id")); 
                        exame.setNome(rs.getString("nome")); 
                        exame.setDataRealizacao(rs.getDate("dataRealizacao")); 
                        
                        exames.add(exame);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
          
        }

       
        request.setAttribute("exames", exames);
        request.getRequestDispatcher("relatorioExamesView.jsp").forward(request, response);
    }

    
    private Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); 
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new SQLException("Driver de banco de dados não encontrado.");
        }

        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }

    
    private void exportarParaExcel(List<relExameAction> exames, HttpServletResponse response) throws IOException {
        
    }
}
