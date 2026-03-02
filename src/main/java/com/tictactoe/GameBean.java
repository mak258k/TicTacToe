package com.tictactoe;

import java.io.Serializable;
import java.util.Random;

public class GameBean implements Serializable {

    public static final int GRID_SIZE = 3; // Cambia a 4 para cuatro en raya
    private String[][] board;
    private String status;
    private boolean gameOver;

    public GameBean() {
        board = new String[GRID_SIZE][GRID_SIZE];
        for (int i = 0; i < GRID_SIZE; i++)
            for (int j = 0; j < GRID_SIZE; j++)
                board[i][j] = "";
        status = "Tu turno. Eres X.";
        gameOver = false;
    }

    public String[][] getBoard() { return board; }
    public String getStatus() { return status; }
    public boolean isGameOver() { return gameOver; }
    public int getGridSize() { return GRID_SIZE; }

    public void playerMove(int row, int col) {
        if (gameOver || !board[row][col].isEmpty()) return;

        board[row][col] = "X";

        if (checkWinner("X")) {
            status = "¡Ganaste! Felicidades.";
            gameOver = true;
            return;
        }
        if (isBoardFull()) {
            status = "¡Empate! Nadie gana.";
            gameOver = true;
            return;
        }

        computerMove();

        if (checkWinner("O")) {
            status = "La computadora ganó. ¡Mejor suerte la próxima vez!";
            gameOver = true;
        } else if (isBoardFull()) {
            status = "¡Empate! Nadie gana.";
            gameOver = true;
        } else {
            status = "Tu turno. Eres X.";
        }
    }

    public void computerFirstMove() {
        if (gameOver) return;
        computerMove();
        if (checkWinner("O")) {
            status = "La computadora ganó. ¡Mejor suerte la próxima vez!";
            gameOver = true;
        } else {
            status = "Tu turno. Eres X.";
        }
    }

    private void computerMove() {
        Random rand = new Random();
        int row, col;
        do {
            row = rand.nextInt(GRID_SIZE);
            col = rand.nextInt(GRID_SIZE);
        } while (!board[row][col].isEmpty());
        board[row][col] = "O";
    }

    private boolean checkWinner(String player) {
        // Filas y columnas
        for (int i = 0; i < GRID_SIZE; i++) {
            boolean rowWin = true, colWin = true;
            for (int j = 0; j < GRID_SIZE; j++) {
                if (!board[i][j].equals(player)) rowWin = false;
                if (!board[j][i].equals(player)) colWin = false;
            }
            if (rowWin || colWin) return true;
        }
        // Diagonales
        boolean diag1 = true, diag2 = true;
        for (int i = 0; i < GRID_SIZE; i++) {
            if (!board[i][i].equals(player)) diag1 = false;
            if (!board[i][GRID_SIZE - 1 - i].equals(player)) diag2 = false;
        }
        return diag1 || diag2;
    }

    private boolean isBoardFull() {
        for (int i = 0; i < GRID_SIZE; i++)
            for (int j = 0; j < GRID_SIZE; j++)
                if (board[i][j].isEmpty()) return false;
        return true;
    }
}
