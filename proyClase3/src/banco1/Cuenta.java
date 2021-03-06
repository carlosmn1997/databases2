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

@Entity(name="H_CUENTA")
public class Cuenta {
	@Id
	@Column(name = "IBAN")
	private String IBAN;
	
	@Column(name = "SALDO")
	private int saldo;
	
	@Column(name = "FECHA_CREACION")
	private Date fecha_creacion;
	
	@Column(name = "CCC") // Numero cuenta
	private int ccc;
	
	@ManyToMany(mappedBy = "cuentas")
	private Set<Cliente> clientes = new HashSet<Cliente>();

	// Si se elimina una cuenta se eliminan sus operaciones asociadas
	@OneToMany(cascade=CascadeType.REMOVE, mappedBy="cuentaOrigen")
	private Set<Operacion> operaciones = new HashSet<Operacion>();
	
	@OneToMany(cascade=CascadeType.REMOVE, mappedBy="cuenta")
	private Set<Transferencia> transferencia = new HashSet<Transferencia>();
	
	
	public String getIBAN() {
		return IBAN;
	}

	public void setIBAN(String iBAN) {
		IBAN = iBAN;
	}

	public int getSaldo() {
		return saldo;
	}

	public void setSaldo(int saldo) {
		this.saldo = saldo;
	}

	public Date getFecha_creacion() {
		return fecha_creacion;
	}

	public void setFecha_creacion(Date fecha_creacion) {
		this.fecha_creacion = fecha_creacion;
	}

	public int getCcc() {
		return ccc;
	}

	public void setCcc(int ccc) {
		this.ccc = ccc;
	}

	public Set<Cliente> getClientes() {
		return clientes;
	}

	public void setClientes(Set<Cliente> clientes) {
		this.clientes = clientes;
	}
	
	public void addCliente(Cliente c) {
		clientes.add(c);
	}
	
	
	public int totalClientes() {
		return clientes.size();
	}
	
	public void removeCliente(Cliente c) {
		clientes.remove(c);
	}
		

}
