
public class Corriente extends Cuenta
{
	Oficina of;

	public Corriente(Oficina of, String IBAN, int numero, double saldo, String fechaCreacion)
	{
		super(IBAN,numero,saldo,fechaCreacion);
		this.of=of;
	}

	public Oficina getCorriente(){ return this.of; }
	public void setCorriente ( Oficina of ){ this.of=of; } 

    	public String toString() {
    	    return super.IBAN+" -> "+super.saldo+" -> "+of.toString();
    	}

}
