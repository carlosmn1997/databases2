package banco2;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.PersistenceException;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.PersistenceException;
import javax.persistence.Query;

public class test {
	EntityManagerFactory entityManagerFactory = 
			Persistence.createEntityManagerFactory("UnidadPersistenciaAlumnos");
	EntityManager em = entityManagerFactory.createEntityManager();
	
	public void prueba() {
		String q15 = "select p.codigo from Oficina p";
		Query query15 = em.createQuery(q15);
		List<String> res15 = query15.getResultList();
		System.out.println(res15);
		
		q15 = "select p.descripcion from Ingreso p";
		query15 = em.createQuery(q15);
		res15 = query15.getResultList();
		System.out.println(res15);
		
	}
	
	public static void main(String[] args) {
		test t = new test();
		t.prueba();
	}
	

}
