package banco1;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity(name="H_OFICINA")
public class Oficina {
	@Id
	@Column(name = "CODIGO")
	private int codigo;
	
	@Column(name = "TELEFONO")
	private int telefono;
	
	@Column(name = "DIRECCION")
	private String direccion;
	
	@OneToMany(mappedBy = "oficina")
	private Set<Corriente> corrientes = new HashSet<Corriente>();

	@OneToMany(mappedBy = "oficina")
	private Set<IngresoRetirada> ingresoRetirada = new HashSet<IngresoRetirada>();
	
	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public int getTelefono() {
		return telefono;
	}

	public void setTelefono(int telefono) {
		this.telefono = telefono;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public Set<Corriente> getCorrientes() {
		return corrientes;
	}

	public void setCorrientes(Set<Corriente> corrientes) {
		this.corrientes = corrientes;
	}

	public Set<IngresoRetirada> getIngresoRetirada() {
		return ingresoRetirada;
	}

	public void setIngresoRetirada(Set<IngresoRetirada> ingresoRetirada) {
		this.ingresoRetirada = ingresoRetirada;
	}
	
		

}
