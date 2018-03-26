
import java.util.*;

public class Oficina
{
	private String codigo;
	private String direccion;
	private String telefono;
	private List<Corriente> corrientes;
	private List<IngresoRetirada> ops;

	public Oficina(String codigo, String direccion, String telefono)
	{
		this.codigo=codigo;
		this.direccion=direccion;
		this.telefono=telefono;
		this.corrientes = new ArrayList();
		this.ops = new ArrayList();
	}

	public String getCodigo(){ return this.codigo; }
	public void setCodigo( String codigo ){ this.codigo=codigo; } 

	public String getDireccion(){ return this.direccion; }
	public void setDireccion( String direccion ){ this.direccion=direccion; } 

	public String getTelefono(){ return this.telefono; }
	public void setTelefono( String telefono ){ this.telefono=telefono; }

	public List getCorrientes(){ return this.corrientes; }
	public void setCorrientes( List l ){ this.corrientes=l; }

	public List getOps(){ return this.ops; }
	public void setOps( List l ){ this.ops=l; }

	public void addCorriente( Corriente c ){ this.corrientes.add(c); }

	public void addOps( IngresoRetirada ir ){ this.ops.add(ir); }

	public String toString() {
        	return direccion;
    	}

}
