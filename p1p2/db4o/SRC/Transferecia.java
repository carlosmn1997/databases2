
public class Transferencia extends Operacion
{
	public Cuenta cuentaDest;
	
	public IngresoRetirada(String codigo, String fecha, String hora, double cantidad, Cuenta c, Cuenta cuentaDest)
	{
		this.cuentaDest=cuentaDest;
		super(codigo,fecha,hora,cantidad,c);
	}

	public double getCuentaDestino(){ return this.cuentaDest; }
	public void setCuentaDestino( Cuenta c ){ this.cuentaDest=c; }

}
