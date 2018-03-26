

public class Ahorro extends Cuenta
{
	double interes;

	public Ahorro(double interes, String IBAN, int numero, double saldo, String fechaCreacion)
	{
		super(IBAN,numero,saldo,fechaCreacion);
		this.interes=interes;
	}

	public double getInteres(){ return this.interes; }
	public void setInteres( double interes ){ this.interes=interes; } 


   	public String toString() {
   	    return super.IBAN+" -> "+super.saldo+" -> "+interes+"%";
   	}
}
