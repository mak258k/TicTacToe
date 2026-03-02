# 🎮 TicTacToe - Tres en Raya

Juego de Tres en Raya desarrollado con Java JSP y desplegado en Apache Tomcat.

## Descripción
Aplicación web donde puedes jugar contra la computadora. El juego detecta automáticamente quién gana, pierde o si hay empate.

## Tecnologías
- Java 11
- JSP (JavaServer Pages)
- Apache Tomcat 10
- Maven

## Cómo jugar
1. Abre el navegador en `http://IP_SERVIDOR:8080/TicTacToe`
2. Elige si inicias tú o la computadora
3. Haz clic en una celda para colocar tu ficha (X)
4. La computadora responde automáticamente (O)

## Captura de pantalla
![Pantalla del juego](screenshot.png)

## Instalación
```bash
mvn package
sudo cp target/TicTacToe.war /var/lib/tomcat10/webapps/
```
