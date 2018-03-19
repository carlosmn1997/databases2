
public class Corriente extends Cuenta
{
	Oficina of;

	public Corriente(Oficina of, String IBAN, int numero, double saldo, String fechaCreacion)
	{
		this.of=of;
		super(IBAN,numero,saldo,fechaCreacion);
	}

	public double getCorriente(){ return this.of; }
	public void setCorriente ( Oficina of ){ this.of=of; } 

}
