

public class Ahorro extends Cuenta
{
	double interes;

	public Ahorro(double interes, String IBAN, int numero, double saldo, String fechaCreacion)
	{
		this.interes=interes;
		super(IBAN,numero,saldo,fechaCreacion);
	}

	public double getInteres(){ return this.interes; }
	public void setInteres( double interes ){ this.interes=interes; } 

}
