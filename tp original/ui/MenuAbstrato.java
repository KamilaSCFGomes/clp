package ui;

import java.util.Scanner;

public abstract class MenuAbstrato {

  public void mostrarMenu(Scanner scanner) {

    int opcao = 0;

    do {
      System.out.println("\n\n\n");

      mostrarTitulo();

      mostrarOpcoes();

      System.out.print("INFORME A SUA OPCAO: ");

      opcao = executarOpcao(scanner.nextInt(), scanner);  //duvida

    } while (opcao != 0);
  }

  protected abstract int executarOpcao(int opcao, Scanner scanner);  //duvida

  protected abstract void mostrarOpcoes();

  protected abstract void mostrarTitulo();

}
