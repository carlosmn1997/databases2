
import java.util.*;

public class Cuenta
{
	protected String IBAN;
	protected int numero;
	protected double saldo;
	protected String fechaCreacion;
	protected List<Cliente> clientes;
	protected List<Operacion> operaciones;
	protected List<Transferencia> recibidas;

	public Cuenta(String IBAN, int numero, double saldo, String fechaCreacion)
	{
		this.IBAN=IBAN;
		this.numero=numero;
		this.saldo=saldo;
		this.fechaCreacion=fechaCreacion;
		this.clientes=new ArrayList();
		this.operaciones=new ArrayList();
		this.recibidas=new ArrayList();
	}

	public String getIBAN(){ return this.IBAN; }
	public void setIBAN( String IBAN ){ this.IBAN=IBAN; } 

	public int getNumero(){ return this.numero; }
	public void setNumero( int numero ){ this.numero=numero; } 

	public double getSaldo(){ return this.saldo; }
	public void setSaldo( double saldo ){ this.saldo=saldo; } 

	public String getFechaCreacion(){ return this.fechaCreacion; }
	public void setFechaCreacion( String fecha ){ this.fechaCreacion=fecha; } 

	public List getClientes(){ return this.clientes; }
	public void setClientes( List l ){ this.clientes=l; }

	public List getOperaciones(){ return this.operaciones; }
	public void setOperaciones( List l ){ this.operaciones=l; }

	public List getRecibidas(){ return this.recibidas; }
	public void setRecibidas( List l ){ this.recibidas=l; }

	public void addCliente( Cliente c ){ this.clientes.add(c); }

	public void addOperacion( Operacion o ){ this.operaciones.add(o); }

	public void addRecibida( Transferencia t ){ this.recibidas.add(t); }	

    	public String toString() {
    	    return IBAN+" -> "+saldo;
   	 }
}
