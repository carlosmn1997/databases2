
public class Transferencia extends Operacion
{
	public Cuenta cuentaDest;
	
	public Transferencia(String codigo, String fecha, String hora, double cantidad, Cuenta c, Cuenta cuentaDest)
	{
		super(codigo,fecha,hora,cantidad,c);
		this.cuentaDest=cuentaDest;
	}

	public Cuenta getCuentaDestino(){ return this.cuentaDest; }
	public void setCuentaDestino( Cuenta c ){ this.cuentaDest=c; }

}
