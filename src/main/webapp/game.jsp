<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.tictactoe.GameBean" %>
<%
    GameBean game = (GameBean) session.getAttribute("game");
    String action = request.getParameter("action");

    if (game == null || "new".equals(action)) {
        game = new GameBean();
        session.setAttribute("game", game);
    }

    if ("computerFirst".equals(action) && !game.isGameOver()) {
        game.computerFirstMove();
    }

    String rowParam = request.getParameter("row");
    String colParam = request.getParameter("col");
    if (rowParam != null && colParam != null && !game.isGameOver()) {
        int row = Integer.parseInt(rowParam);
        int col = Integer.parseInt(colParam);
        game.playerMove(row, col);
    }

    int size = game.getGridSize();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tres en Raya</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; margin-top: 40px; background: #f0f0f0; }
        h1 { color: #333; }
        table { margin: 20px auto; border-collapse: collapse; }
        td { width: 70px; height: 70px; text-align: center; vertical-align: middle;
             font-size: 2em; font-weight: bold; cursor: pointer; background: white; }
        td:hover { background: #e0e0ff; }
        .status { font-size: 1.3em; margin: 15px; color: #444; }
        .btn { padding: 10px 20px; margin: 5px; font-size: 1em;
               cursor: pointer; background: #4CAF50; color: white;
               border: none; border-radius: 5px; }
        .btn:hover { background: #45a049; }
        .btn-blue { background: #2196F3; }
        .btn-blue:hover { background: #1976D2; }
    </style>
</head>
<body>
    <h1>🎮 Tres en Raya</h1>
    <p class="status"><%= game.getStatus() %></p>

    <table border="2">
        <% for (int i = 0; i < size; i++) { %>
        <tr>
            <% for (int j = 0; j < size; j++) {
                String cell = game.getBoard()[i][j];
                String display = cell.isEmpty() ? "&nbsp;" : cell;
            %>
            <td>
                <% if (cell.isEmpty() && !game.isGameOver()) { %>
                    <a href="game.jsp?row=<%= i %>&col=<%= j %>" style="text-decoration:none;display:block;width:100%;height:100%;">
                        &nbsp;
                    </a>
                <% } else { %>
                    <%= display %>
                <% } %>
            </td>
            <% } %>
        </tr>
        <% } %>
    </table>

    <br>
    <a href="game.jsp?action=new"><button class="btn">🔄 Nuevo juego (Tú primero)</button></a>
    <a href="game.jsp?action=new&next=computerFirst">
        <button class="btn btn-blue">🤖 Nuevo juego (PC primero)</button>
    </a>

    <%
        // Si PC va primero en nuevo juego
        if ("new".equals(action) && "computerFirst".equals(request.getParameter("next"))) {
            game.computerFirstMove();
        }
    %>
</body>
</html>

