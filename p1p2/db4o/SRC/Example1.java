/**
 * Example extracted and adapted from http://community.versant.com/documentation/reference/db4o-8.0/java/tutorial/docs/FirstGlance.html
 * Date: March 15, 2014
 */

import java.io.*;
import com.db4o.*;

public class Example1 extends Util {

    final static String DB_FOLDER = "./DB-FILES";
    //final static String DB_FOLDER = System.getProperty("user.home");

    final static String DB_FILE = "Banco.db4o";

    final static String DB4OFILENAME = DB_FOLDER + "/" + DB_FILE;

    public static void main(String[] args) {
        new File(DB4OFILENAME).delete();
        accessDb4o();
        new File(DB4OFILENAME).delete();
        ObjectContainer db = Db4oEmbedded.openFile(Db4oEmbedded
                .newConfiguration(), DB4OFILENAME);
        try {
	    System.out.println("------CLIENTE------");
            storeFirstCliente(db);
            storeSecondCliente(db);
            retrieveAllClients(db);
            retrieveClientByName(db);
            retrieveClientByDNI(db);
            updateClient(db);
            deleteFirstClientByName(db);
	    System.out.println("------Cuenta------");
            storeFirstCuenta(db);
            storeSecondCuenta(db);
            retrieveAllAccounts(db);
            retrieveAccountByIBAN(db);
            retrieveAccountByNumCuenta(db);
            updateAccount(db);
            deleteFirstAccountByIBAN(db);
	    System.out.println("------Relacion Cuenta-Cliente------");
	    storeFirstCliente(db);
	    storeSecondCliente(db);
            storeFirstCuenta(db);
	    anyadirClientesAFirstCuenta(db);
	    anyadirCuentasAFirstCliente(db);
	    retrieveClientesFromCuenta(db);
	    retrieveCuentasFromCliente(db);
        } finally {
            db.close();
        }
    }

    public static void accessDb4o() {
        ObjectContainer db = Db4oEmbedded.openFile(Db4oEmbedded
                .newConfiguration(), DB4OFILENAME);
        try {
            // do something with db4o
        } finally {
            db.close();
        }
    }

    public static void storeFirstCliente(ObjectContainer db) {
        Cliente client1 = new Cliente("Carlos", "612345678", "Maranyes Nueno", "12345678A",
                       25, "Calle de la cabra, Muel");
        db.store(client1);
        System.out.println("Stored cliente" + client1);
    }

    public static void storeSecondCliente(ObjectContainer db) {
        Cliente client2 = new Cliente("Nicolas", "612345678","Lera Lopez", "87654321B",
                       25, "Calle de la mala gente, Jaca");
        db.store(client2);
        System.out.println("Stored cliente" + client2);
    }

    public static void retrieveAllClientQBE(ObjectContainer db) {
        Cliente proto = new Cliente(null, null, null,null, 0,null);
        ObjectSet result = db.queryByExample(proto);
        listResult(result);
    }

    public static void retrieveAllClients(ObjectContainer db) {
        ObjectSet result = db.queryByExample(Cliente.class);
        listResult(result);
    }

    public static void retrieveClientByName(ObjectContainer db) {
        Cliente client1 = new Cliente("Nicolas", null, null,null, 0,null);
        ObjectSet result = db.queryByExample(client1);
        listResult(result);
    }

    public static void retrieveClientByDNI(ObjectContainer db) {
        Cliente client1 = new Cliente(null, null,null, "12345678A",0,null);
        ObjectSet result = db.queryByExample(client1);
        listResult(result);
    }

    public static void updateClient(ObjectContainer db) {
        ObjectSet result = db
                .queryByExample(new Cliente("Nicolas", null, null,null, 0,null));
        Cliente found = (Cliente) result.next();
        found.setNombre("Anacardo");
        db.store(found);
        System.out.println("Ahora se llama" + found);
        retrieveAllClients(db);
    }

    public static void deleteFirstClientByName(ObjectContainer db) {
        ObjectSet result = db
                .queryByExample(new Cliente("Carlos", null, null,null, 0,null));
        Cliente found = (Cliente) result.next();
        db.delete(found);
        System.out.println("Deleted cliente " + found);
        retrieveAllClients(db);
    }

/* AQUI EMPIEZAN LAS PRUEBAS DE LOS DOS TIPOS DE CUENTA */


  public static void storeFirstCuenta(ObjectContainer db) {
        Cuenta Account1 = new Ahorro(0.05, "1234-5678-ABCD", 12345678, 20000.01, "25/12/0");
        db.store(Account1);
        System.out.println("Stored Ahorro" + Account1);
    }

    public static void storeSecondCuenta(ObjectContainer db) {
	Oficina of = new Oficina("1234-SAN", "Calle Marujas ZGZ", "976123456");
        Cuenta Account2 = new Corriente(of, "5678-1234-EFGH", 56781234, 10000.15, "1/1/2000");
        db.store(Account2);
        System.out.println("Stored Corriente" + Account2);
    }

    public static void retrieveAllAccountQBE(ObjectContainer db) {
        Cuenta proto = new Cuenta("1234-5678-ABCD", 0,0.0,null);
        ObjectSet result = db.queryByExample(proto);
        listResult(result);
    }

    public static void retrieveAllAccounts(ObjectContainer db) {
        ObjectSet result = db.queryByExample(Cuenta.class);
        listResult(result);
    }

    public static void retrieveAccountByIBAN(ObjectContainer db) {
        Cuenta Account1 = new Cuenta("5678-1234-EFGH", 0, 0.0,null);
        ObjectSet result = db.queryByExample(Account1);
        listResult(result);
    }

    public static void retrieveAccountByNumCuenta(ObjectContainer db) {
        Cuenta Account1 = new Cuenta(null,56781234 ,0,null);
        ObjectSet result = db.queryByExample(Account1);
        listResult(result);
    }

    public static void updateAccount(ObjectContainer db) {
        ObjectSet result = db
                .queryByExample(new Cuenta("5678-1234-EFGH", 0, 0.0,null));
        Cuenta found = (Cuenta) result.next();
        found.setSaldo(20000000.01);
        db.store(found);
        System.out.println("Ahora se llama anacardo" + found);
        retrieveAllAccounts(db);
    }

    public static void deleteFirstAccountByIBAN(ObjectContainer db) {
        ObjectSet result = db
                .queryByExample(new Cuenta("1234-5678-ABCD", 0, 0.0,null));
        Cuenta found = (Cuenta) result.next();
        db.delete(found);
        System.out.println("Deleted cuenta" + found);
        retrieveAllAccounts(db);
    }

/* AQUI EMPIEZAN LAS PRUEBAS DE LA INTERRELACION CUENTA-cCLIENTE */
    public static void anyadirClientesAFirstCuenta(ObjectContainer db){
        ObjectSet result = db
                .queryByExample(new Cuenta("1234-5678-ABCD", 0, 0.0,null));
        Cuenta found = (Cuenta) result.next();
	result = db
                .queryByExample(new Cliente("Nicolas", null, null,null, 0,null));
        Cliente c1 = (Cliente) result.next();
        found.addCliente(c1);
	result = db
                .queryByExample(new Cliente("Carlos", null, null,null, 0,null));
        Cliente c2 = (Cliente) result.next();
	found.addCliente(c2);
        db.store(found);
        System.out.println("Añadido " + c1 + " a " + found);
        System.out.println("Añadido " + c2 + " a " + found);
        retrieveAllAccounts(db);
    }
    
    public static void anyadirCuentasAFirstCliente(ObjectContainer db){
        ObjectSet result = db
                .queryByExample(new Cliente("Nicolas", null, null,null, 0,null));
        Cliente found = (Cliente) result.next();
	result = db
                .queryByExample(new Cuenta("1234-5678-ABCD", 0, 0.0,null));
        Cuenta c1 = (Cuenta) result.next();
        found.addCuenta(c1);
	result = db
                .queryByExample(new Cuenta("5678-1234-EFGH", 0, 0.0,null));
        Cuenta c2 = (Cuenta) result.next();
	found.addCuenta(c2);
        db.store(found);
        System.out.println("Añadido " + c1 + " a " + found);
        System.out.println("Añadido " + c2 + " a " + found);
        retrieveAllAccounts(db);
    }    

    public static void retrieveClientesFromCuenta(ObjectContainer db) {
        Cuenta Account1 = new Cuenta("1234-5678-ABCD", 0, 0.0,null);
        ObjectSet result = db.queryByExample(Account1);
	Cuenta c = (Cuenta) result.next();
	System.out.println("Clientes de " + c.getIBAN());
        listResult(c.getClientes());
    }

    public static void retrieveCuentasFromCliente(ObjectContainer db) {
        Cliente Client1 = new Cliente("Nicolas", null, null,null, 0,null);
        ObjectSet result = db.queryByExample(Client1);
	Cliente c = (Cliente) result.next();
	System.out.println("Cuentas de " + c.getNombre() + " " + c.getApellidos());
        listResult(c.getCuentas());
    }

}
