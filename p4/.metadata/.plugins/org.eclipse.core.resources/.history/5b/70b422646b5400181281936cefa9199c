package banco1;

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

public class Test3 {
	EntityManagerFactory entityManagerFactory = 
			Persistence.createEntityManagerFactory("UnidadPersistenciaAlumnos");
	EntityManager em = entityManagerFactory.createEntityManager();
	
	public void prueba() {
	
		Cliente c1 = new Cliente();
		c1.setNombre("Carlos");
		c1.setApellidos("Marañes Palotes");
		c1.setDNI("123456789A");
		
		String lastCrawlDate = "1997-04-30";
		java.util.Date utilDate = null;
		try {
			utilDate = new SimpleDateFormat("yyyy-MM-dd").parse(lastCrawlDate);
		} catch (ParseException e3) {
			// TODO Auto-generated catch block
			e3.printStackTrace();
		}
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
		
		c1.setFechaNac(sqlDate);
		c1.setDireccion("c/estercolero,Muel,Espanya");
		
		Cliente c2 = new Cliente();
		c2.setNombre("Nicolas");
		c2.setApellidos("Lera MC");
		c2.setDNI("987654321B");
		
		lastCrawlDate = "1997-10-04";
		try {
			utilDate = new SimpleDateFormat("yyyy-MM-dd").parse(lastCrawlDate);
		} catch (ParseException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		sqlDate = new java.sql.Date(utilDate.getTime());

		c2.setFechaNac(sqlDate);
		c2.setDireccion("c/guay,Jaca,Espanya");
		
		EntityTransaction trans = em.getTransaction();
		trans.begin();
		try {
			em.persist(c1);
			em.persist(c2);
			trans.commit();
		} catch (PersistenceException e) {
			if (trans.isActive()) {
				trans.rollback();
			}
		}

		Oficina of = new Oficina();
		of.setCodigo(1);
		of.setTelefono(192837465);
		of.setDireccion("C/mayor, Zgz");
	
		trans.begin();
		try {
			em.persist(of);
			trans.commit();
		} catch (PersistenceException e) {
			if (trans.isActive()) {
				trans.rollback();
			}
		}
		
		//Primera cuenta
		Ahorro cu1 = new Ahorro();
		cu1.setIBAN("45ES123456789");
		cu1.setSaldo(100000000);
		
		
		lastCrawlDate = "2034-12-12";
		try {
			utilDate = new SimpleDateFormat("yyyy-MM-dd").parse(lastCrawlDate);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		sqlDate = new java.sql.Date(utilDate.getTime());
		
		cu1.setFecha_creacion(sqlDate);
		cu1.setCcc(123456789);
		cu1.setInteres(0.05);
		cu1.addCliente(c2);
		Set<Cuenta> ahorros = new HashSet<Cuenta>();
		ahorros.add(cu1);
		c2.setCuentas(ahorros);
		
		//Segunda cuenta
		Corriente cu2 = new Corriente();
		cu2.setIBAN("45ES987654321");
		cu2.setSaldo(-5);
		
		lastCrawlDate = "2034-11-12";
		try {
			utilDate = new SimpleDateFormat("yyyy-MM-dd").parse(lastCrawlDate);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		sqlDate = new java.sql.Date(utilDate.getTime());
		
		cu2.setFecha_creacion(sqlDate);
		cu2.setCcc(987654321);
		cu2.addCliente(c1);
		Set<Cuenta> corrientes = new HashSet<Cuenta>();
		corrientes.add(cu2);
		c1.setCuentas(corrientes);
		cu2.setOficina(of);
		Set<Corriente> c = new HashSet<Corriente>();
		c.add(cu2);
		of.setCorrientes(c);
		
		trans.begin();
		try {
			em.persist(cu1);
			em.persist(cu2);
			em.flush();
			trans.commit();
		} catch (PersistenceException e) {
			e.printStackTrace();
			if (trans.isActive()) {
				trans.rollback();
			}
		}
		
		Transferencia op = new Transferencia();
		op.setCuentaOrigen(cu1);
		op.setCodigo(1);
		
		lastCrawlDate = "2035-05-12";
		try {
			utilDate = new SimpleDateFormat("yyyy-MM-dd").parse(lastCrawlDate);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		sqlDate = new java.sql.Date(utilDate.getTime());
		
		op.setFecha(sqlDate);
		op.setHora("12:12:12");
		op.setDescripcion("MUY CHULA");
		op.setCuenta(cu2);
		op.setCantidad(2000000.0);

		Ingreso op2 = new Ingreso();
		op2.setCuentaOrigen(cu2);
		op2.setCodigo(2);
		
		lastCrawlDate = "2035-05-15";
		try {
			utilDate = new SimpleDateFormat("yyyy-MM-dd").parse(lastCrawlDate);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		sqlDate = new java.sql.Date(utilDate.getTime());
		
		op2.setFecha(sqlDate);
		op2.setHora("14:12:12");
		op2.setDescripcion("ERRRRRRRONEA");
		op2.setCantidad(20.0);
		op2.setOficina(of);
		
		EntityTransaction trans1 = em.getTransaction();
		trans1.begin();
		try{
			em.persist(op);
			em.persist(op2);
			trans1.commit();
		} catch (PersistenceException e) {
			e.printStackTrace();
			if (trans.isActive()) {
				trans1.rollback();
			}
		}
		System.out.println("\nCONSULTAS\n---------------- \n");
		
		//CONSULTA 0
		String q0 = "select c FROM H_CLIENTE c where "
				+ "LENGTH(c.nombre)<7 order by c.nombre";
		Query query0 = em.createQuery(q0);
		List<Cliente> res0 = query0.getResultList();
		Cliente c0=res0.get(0);
		System.out.println(Integer.toString(res0.size())+c0.getNombre()+c0.getApellidos());
		String q01 = "select cc from H_CUENTA cc join cc.clientes "
				+ "c where c.nombre = :nom";
		Query query01 = em.createQuery(q01);
		query01.setParameter("nom", c0.getNombre());
		List<Cuenta> res01 = query01.getResultList();
		System.out.println(Integer.toString(res01.size()));
		Cuenta cc0=res01.get(0);
		String q02 = "select co FROM H_CORRIENTE co where co.IBAN = :ib";
		Query query02 = em.createQuery(q02);
		query02.setParameter("ib", cc0.getIBAN());
		List<Corriente> res02 = query02.getResultList();
		String cabecera = "Consulta1:\nClientes con cuenta corriente";
		cabecera += "con nombre de menos de 7 letras\n";
		System.out.println(cabecera);
		for(Corriente co : res02){
			System.out.println(co.getOficina().getDireccion());
		}
		
		
		//CONSULTA 2
		String q1 = "select o from H_CORRIENTE o "
				+ "where o.saldo<0";
		Query query1 = em.createQuery(q1);
		List<Corriente> res1 = query1.getResultList();
		System.out.println("\nConsulta 1:\n\n" + q1 +"\n");
		for(Corriente of1 : res1){
			System.out.println(of1.getIBAN()+" - "+of1.getOficina().getDireccion()+"\n");
		}
		
		
		//CONSULTA 3
		Query q2 = em.createNativeQuery("SELECT * FROM H_CUENTA"
				+ " where saldo in (select max(saldo) from H_Cuenta)", Cuenta.class);
		List<Cuenta> res2 = q2.getResultList();
		System.out.println("\nConsulta 2:\n");
		for(Cuenta cc: res2){
			Query q3 = em.createNativeQuery("SELECT * FROM H_OPERACION"
					+ " where cuentaOrigen_IBAN=\'"+cc.getIBAN()+"\'", Transferencia.class);
			List<Transferencia> res3 = q3.getResultList();
			for(Transferencia t: res3){
				System.out.println("\nTransferencia con code "+t.getCodigo()+" de "
						+t.getCuentaOrigen().getIBAN()+" a "+t.getCuenta().getIBAN()+"\n");
			}
		}
	}
	
	public static void main(String[] args) {
		Test3 t = new Test3();
		t.prueba();
		System.out.println("FIN PRUEBAS");
	}
	

}