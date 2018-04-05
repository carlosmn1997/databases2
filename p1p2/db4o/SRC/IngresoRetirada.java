
public class IngresoRetirada extends Operacion
{
	private Oficina of;
	
	public IngresoRetirada(String codigo, String fecha, String hora, double cantidad, Cuenta c, Oficina of)
	{
		super(codigo,fecha,hora,cantidad,c);
		this.of=of;
	}

	public Oficina getOficina(){ return this.of; }
	public void setOficina( Oficina of ){ this.of=of; }

	public String toString() {
        	return super.getCodigo()+" ingreso o retirada en " + of.toString();
    	}

}
