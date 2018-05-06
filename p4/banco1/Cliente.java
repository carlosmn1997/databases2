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

@Entity(name="H_CLIENTE")
public class Cliente {
	@Id
	@Column(name = "DNI")
	private String DNI;
	
	@Column(name = "NOMBRE")
	private String nombre;
	
	@Column(name = "FECHANAC")
	private Date fechaNac;
	
	@Column(name = "APELLIDOS")
	private String apellidos;
	
	@Column(name = "EMAIL") // Puede ser null
	private String email;
	
	@Column(name = "DIRECCION")
	private String direccion;
	
	@ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.REFRESH})
	private Set<Cuenta> cuentas = new HashSet<Cuenta>();

	public String getDNI() {
		return DNI;
	}

	public void setDNI(String dNI) {
		DNI = dNI;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public Set<Cuenta> getCuentas() {
		return cuentas;
	}

	public void setCuentas(Set<Cuenta> cuentas) {
		this.cuentas = cuentas;
	}

	public Date getFechaNac() {
		return fechaNac;
	}

	public void setFechaNac(Date fechaNac) {
		this.fechaNac = fechaNac;
	}
	

}
