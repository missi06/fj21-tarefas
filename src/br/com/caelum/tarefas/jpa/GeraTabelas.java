package br.com.caelum.tarefas.jpa;

import javax.persistence.*;

public class GeraTabelas {

	public static void main(String[] args) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("teste");
		factory.close();
		}
}
