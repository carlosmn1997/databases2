package banco2;

import javax.persistence.*;
import java.sql.Time;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

@Entity
@Table(name = "CUENTA")
public class CuentaEntity {
    private String iban;
    private long numero;
    private long saldo;
    private Time fechacreacion;
    private String tipo;
    private Long interes;
    private OficinaEntity oficinaByOficina;
    private Set<ClienteEntity> clientes = new HashSet<ClienteEntity>();

    @Id
    @Column(name = "IBAN")
    public String getIban() {
        return iban;
    }

    public void setIban(String iban) {
        this.iban = iban;
    }

    @Basic
    @Column(name = "NUMERO")
    public long getNumero() {
        return numero;
    }

    public void setNumero(long numero) {
        this.numero = numero;
    }

    @Basic
    @Column(name = "SALDO")
    public long getSaldo() {
        return saldo;
    }

    public void setSaldo(long saldo) {
        this.saldo = saldo;
    }

    @Basic
    @Column(name = "FECHACREACION")
    public Time getFechacreacion() {
        return fechacreacion;
    }

    public void setFechacreacion(Time fechacreacion) {
        this.fechacreacion = fechacreacion;
    }

    @Basic
    @Column(name = "TIPO")
    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    @Basic
    @Column(name = "INTERES")
    public Long getInteres() {
        return interes;
    }

    public void setInteres(Long interes) {
        this.interes = interes;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CuentaEntity that = (CuentaEntity) o;
        return numero == that.numero &&
                saldo == that.saldo &&
                Objects.equals(iban, that.iban) &&
                Objects.equals(fechacreacion, that.fechacreacion) &&
                Objects.equals(tipo, that.tipo) &&
                Objects.equals(interes, that.interes);
    }

    @Override
    public int hashCode() {

        return Objects.hash(iban, numero, saldo, fechacreacion, tipo, interes);
    }

    @ManyToOne
    @JoinColumn(name = "OFICINA", referencedColumnName = "CODIGO")
    public OficinaEntity getOficinaByOficina() {
        return oficinaByOficina;
    }

    public void setOficinaByOficina(OficinaEntity oficinaByOficina) {
        this.oficinaByOficina = oficinaByOficina;
    }

    
    @ManyToMany(mappedBy = "cuentas")
	public Set<ClienteEntity> getClientes() {
		return clientes;
	}

	public void setClientes(Set<ClienteEntity> clientes) {
		this.clientes = clientes;
	}
    
}
