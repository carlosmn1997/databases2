package banco2;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import javassist.bytecode.Descriptor.Iterator;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.PersistenceException;
import javax.persistence.Query;
import javax.persistence.criteria.*;

public class Test3 {
	EntityManagerFactory entityManagerFactory = 
			Persistence.createEntityManagerFactory("UnidadPersistenciaAlumnos");
	EntityManager em = entityManagerFactory.createEntityManager();
	
	public void prueba() {
	
		System.out.println("\nCONSULTAS\n---------------- \n");
		
		//CONSULTA 1
		String q0 = "select c FROM Cliente c where "
				+ "LENGTH(c.nombre)<7 order by c.nombre";
		Query query0 = em.createQuery(q0);
		List<Cliente> res0 = query0.getResultList();
		Cliente c0=res0.get(0);
		String q01 = "select cc from Cuenta cc join cc.clientes "
				+ "c where c.nombre = :nom";
		Query query01 = em.createQuery(q01);
		query01.setParameter("nom", c0.getNombre());
		List<Cuenta> res01 = query01.getResultList();
		Cuenta cc0=res01.get(0);
		String q02 = "select co FROM Corriente co where co.iban = :ib";
		Query query02 = em.createQuery(q02);
		query02.setParameter("ib", cc0.getIban());
		List<Corriente> res02 = query02.getResultList();
		String cabecera = "Consulta1:\nClientes con cuenta corriente";
		cabecera += " con nombre de menos de 7 letras\n";
		System.out.println(cabecera);
		for(Corriente co : res02){
			System.out.println(co.getIban());
			System.out.println(co.getOficinaByOficina().getDireccion());
		}
		
		
		//CONSULTA 2
//		cabecera = "Consulta2:\"Cantidad media ingresada por oficina";
//		System.out.println(cabecera);
//		String q1 = "select o from Oficina o";
//		Query query1 = em.createQuery(q1);
//		List<Oficina> res1 = query1.getResultList();
//		System.out.println("OFICINA      Cantidad Media Movida");
//		for(Oficina o: res1){
//			Set<Ingreso> l = o.getIngreso();
//			int i=0;
//			double sumaSaldo=0;
//			for(Ingreso ing: l){
//				sumaSaldo += Math.abs(ing.getCantidad());
//				i++;
//			}
//			sumaSaldo = sumaSaldo/i;
//			System.out.println(o.getDireccion()+"    "+Double.toString(sumaSaldo));
//		}
		
		//CONSULTA 3
        String q2 = "select cor from Corriente cor "
                + "where cor.saldo<1000";
        Query query2 = em.createQuery(q2);
        List<Corriente> res2 = query2.getResultList();
        System.out.println("\nConsulta 3:\n\n" + q2 +"\n");
        for(Corriente co2 : res2){
            System.out.println(co2.getIban()+" - "+co2.getOficinaByOficina().getDireccion()+"\n");
        }
		
		
		//CONSULTA 4
		Query q3 = em.createNativeQuery("SELECT * FROM Cuenta"
				+ " where saldo in (select max(saldo) from Cuenta)", Cuenta.class);
		List<Cuenta> res3 = q3.getResultList();
		System.out.println("\nConsulta 2:\n");
		for(Cuenta cc: res3){
			Query q4 = em.createNativeQuery("SELECT * FROM Operacion"
					+ " where ibanorigen=\'"+cc.getIban()+"\'", Retirada.class);
			List<Retirada> res4 = q4.getResultList();
			for(Retirada r : res4){
				System.out.println("\nRetirada con code "+r.getCodigo()+" de "
						+r.getCuentaByIbanorigen().getIban());
			}
		}
		
		// Consulta 5 con Criteria API
		System.out.println("Cuentas cuyas operaciones han sido con una cantidad entre 10 y 200");
		CriteriaBuilder cb = em.getCriteriaBuilder(); //Paso 1
		CriteriaQuery<Operacion> cqry = cb.createQuery(Operacion.class); //Paso 1
//
//		
		Root<Operacion> root = cqry.from(Operacion.class); //Paso 2
//
		//cqry.select(root); //Paso 3
		//Predicate pGtAge = cb.gt(root.<Integer>get("cantidad"),10); //Paso 4
		Predicate min = cb.gt(root.<Integer>get("cantidad"),10); //Paso 4
		Predicate max = cb.lt(root.<Integer>get("cantidad"),200);
		cqry.where(cb.and(min,max)); //Paso 5
		
     	Query qry = em.createQuery(cqry); //Paso 6
		List<Operacion> results = qry.getResultList(); //Paso 6
		for (Operacion o : results) {
			String IBAN = o.getCuentaByIbanorigen().getIban();
			System.out.println("IBAN Cuenta Origen: "+IBAN + " Cantidad: "+o.getCantidad());
		}

	}
	
	public static void main(String[] args) {
		Test3 t = new Test3();
		t.prueba();
		System.out.println();
		System.out.println("FIN PRUEBAS");
	}
	

}