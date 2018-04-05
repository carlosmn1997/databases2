
public class Operacion
{
	private String codigo;
	private String fecha;
	private String hora;
	public double cantidad;
	private String descripcion;
	private Cuenta c;

	public Operacion(String codigo, String fecha, String hora, double cantidad, Cuenta c)
	{
		this.codigo=codigo;
		this.fecha=fecha;
		this.hora=hora;
		this.cantidad = cantidad;
		this.c = c;
	}

	public String getCodigo(){ return this.codigo; }
	public void setCodigo( String codigo ){ this.codigo=codigo; } 

	public String getFecha(){ return this.fecha; }
	public void setFecha( String fecha ){ this.fecha=fecha; } 

	public String getHora(){ return this.hora; }
	public void setHora( String hora ){ this.hora=hora; }

	public double getCantidad(){ return this.cantidad; }
	public void setCantidad( double c ){ this.cantidad=c; }

	public String getDescripcion(){ return this.descripcion; }
	public void setDescripcion( String des ){ this.descripcion=des; }

	public Cuenta getCuentaOrigen(){ return this.c; }
	public void setCuentaOrigen( Cuenta c ){ this.c=c; }

	public String toString() {
        	return codigo;
    	}
}
