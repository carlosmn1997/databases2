
public class Cuenta
{
	private String IBAN;
	private int numero;
	private double saldo;
	private String fechaCreacion;
	private List<Cliente> clientes;
	private List<Operacion> operaciones;
	private List<Transferencias> recibidas;

	public Cuenta(String IBAN, int numero, double saldo, String fechaCreacion)
	{
		this.IBAN=IBAN;
		this.numero=numero;
		this.saldo=saldo;
		this.fechaCreacion=fechaCreacion;
		this.clientes=new arrayList();
		this.operaciones=new arrayList();
		this.recibidas=new arrayList();
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

	public void addRecibida( Transferencia t ){ this.recibidas.add(r); }	
}
