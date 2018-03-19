
public class IngresoRetirada extends Operacion
{
	public Oficina of;
	
	public IngresoRetirada(String codigo, String fecha, String hora, double cantidad, Cuenta c, Oficina of)
	{
		this.of=of;
		super(codigo,fecha,hora,cantidad,c);
	}

	public double getOficina(){ return this.of; }
	public void setOficina( Oficina of ){ this.of=of; }

}
