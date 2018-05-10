package test;
import banco1.*;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.PersistenceException;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.*;


public class Test4 {
	EntityManagerFactory entityManagerFactory = 
			Persistence.createEntityManagerFactory("UnidadPersistenciaAlumnos");
	EntityManager em = entityManagerFactory.createEntityManager();
	
	public void prueba() {
	
		Cliente c1 = new Cliente();
		c1.setNombre("Carlos");
		c1.setApellidos("Marañes Palotes");
		c1.setDNI("123456789A");
		
		String lastCrawlDate = "2018-05-12";
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
		
		lastCrawlDate = "2018-03-12";
		try {
			utilDate = new SimpleDateFormat("yyyy-MM-dd").parse(lastCrawlDate);
		} catch (ParseException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		sqlDate = new java.sql.Date(utilDate.getTime());

		c2.setFechaNac(sqlDate);
		c2.setDireccion("c/guay,Jaca,Espanya");
		
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
		
		c1.addCuenta(cu1);
		c2.addCuenta(cu2);
		
		EntityTransaction trans = em.getTransaction();
		trans.begin();
		try {
			em.persist(c1);
			em.persist(c2);
			em.persist(cu1);
			em.persist(cu2);
			trans.commit();
		} catch (PersistenceException e) {
			if (trans.isActive()) {
				trans.rollback();
			}
		}

		Oficina of = new Oficina();
		of.setCodigo(1234);
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
		

		
		Operacion op = new Operacion();
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

		Operacion op2 = new Operacion();
		op.setCuentaOrigen(cu2);
		op.setCodigo(1);
		op.setCantidad(100);
		
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
		
		String q15 = "select p.descripcion from H_OPERACION p";
		Query query15 = em.createQuery(q15);
		List<String> res15 = query15.getResultList();
		System.out.println(res15);
		
		
		q15 = "SELECT e.nombre FROM H_CLIENTE e JOIN e.cuentas a WHERE a.IBAN = \'45ES987654321\'";
		query15 = em.createQuery(q15);
		res15 = query15.getResultList();
		System.out.println(res15);
		
		
//		CriteriaBuilder cb = em.getCriteriaBuilder();
//
//		CriteriaQuery<Oficina> cq = cb.createQuery(Oficina.class);
//		Root<Oficina> from = cq.from(Oficina.class);
//
//		cq.select(from);
//		TypedQuery<Oficina> q = em.createQuery(cq);
//		List<Oficina> allitems = q.getResultList();
//		System.out.println(allitems.get(0).getCodigo());
		
		
//		CriteriaBuilder cb = em.getCriteriaBuilder();


//		  CriteriaQuery<Operacion> q = cb.createQuery(Operacion.class);
//		  Root<Operacion> c = q.from(Operacion.class);
//		//  ParameterExpression<Integer> p = cb.parameter(Integer.class);
//		  q.select(c).where(cb.gt(c.<Integer>get("population"), 100));
//		
//		CriteriaQuery<Operacion> query = cb.createQuery(Operacion.class);
//	   Root<Cuenta> cuenta = query.from(Cuenta.class);
//		Join<Operacion, Cuenta> operacion = cuenta.join("operaciones");
//		Subquery<Operacion> subquery = query.subquery(Operacion.class);
//		Root<Operacion> subOperacion = query.from(Operacion.class);
//		Predicate p = cb.gt(subOperacion.<Integer>get("cantidad"),100);
//		subquery.where(p);
//		query.where(cb.exists(subquery));
//		
//		List<Operacion> results = query.getResultType();
		
		
		
		//Siempre igual
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
			String IBAN = o.getCuentaOrigen().getIBAN();
			System.out.println("IBAN: "+IBAN);
		}
	
		
		// Find all manager that only manage below-average employees.
//		CriteriaQuery criteriaQuery = cb.createQuery();
//		Root cliente = criteriaQuery.from(Cliente.class);
//		Subquery subQuery = criteriaQuery.subquery(Cliente.class);
//		Root ahorro = subQuery.from(Ahorro.class);
//		subQuery.where(cb.and(ahorro.get("oficina").g.equal(e));
//		criteriaQuery.where(criteriaBuilder.exists(sq).not());
//		Query query = entityManager.createQuery(criteriaQuery)
//		List<Employee> = query.getResultList();
//	
//	
//		CriteriaQuery<Operacion> cqry = cb.createQuery(Operacion.class); //Paso 1
//		Root<Oficina> root = cqry.from(Oficina.class); //Paso 2
//		Join<Oficina,IngresoRetirada> join =
//		root.join(MyEntity_.anotherEntity); //Paso 2
//		//Join<MyEntity,AnotherEntity> join =
//		// root.join("anotherEntity"); //Paso 2
//
//		cqry.select(root); //Paso 3
//		Predicate pGtAge = cb.gt(root.get(MyEntity_.age),10); //Paso 4
//		Predicate pGtDateCreated=
//		cb.greaterThan(root.get(MyEntity_.dateCreated),date); //paso 4
//		Predicate pEqEnabled = cb.equals(join.get(AnotherEntity_.enabled),false);
//		Predicate pAnd = cb.and(pGtDateCreated,pGtAge,pEqEnabled); //Paso 4
//
//		cqry.where(pAnd); //Paso 5
	}
	
	public static void main(String[] args) {
		Test4 t = new Test4();
		t.prueba();
	}
	

}
