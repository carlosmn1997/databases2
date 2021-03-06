package banco2;

import javax.persistence.*;
import java.sql.Time;
import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name = "CUENTA", schema = "A717788", catalog = "")
public class CuentaEntity {
    private String iban;
    private long numero;
    private long saldo;
    private Time fechacreacion;
    private String tipo;
    private Long interes;
    private String oficina;
    private OficinaEntity oficinaByOficina;
    private Collection<OperacionEntity> operacionsByIban;
    private Collection<OperacionEntity> operacionsByIban_0;
    private Collection<PoseeEntity> poseesByIban;

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

    @Basic
    @Column(name = "OFICINA")
    public String getOficina() {
        return oficina;
    }

    public void setOficina(String oficina) {
        this.oficina = oficina;
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
                Objects.equals(interes, that.interes) &&
                Objects.equals(oficina, that.oficina);
    }

    @Override
    public int hashCode() {

        return Objects.hash(iban, numero, saldo, fechacreacion, tipo, interes, oficina);
    }

    @ManyToOne
    @JoinColumn(name = "OFICINA", referencedColumnName = "CODIGO", insertable = false, updatable = false)
    public OficinaEntity getOficinaByOficina() {
        return oficinaByOficina;
    }

    public void setOficinaByOficina(OficinaEntity oficinaByOficina) {
        this.oficinaByOficina = oficinaByOficina;
    }

    @OneToMany(mappedBy = "cuentaByIbanorigen")
    public Collection<OperacionEntity> getOperacionsByIban() {
        return operacionsByIban;
    }

    public void setOperacionsByIban(Collection<OperacionEntity> operacionsByIban) {
        this.operacionsByIban = operacionsByIban;
    }

    @OneToMany(mappedBy = "cuentaByIbandestino")
    public Collection<OperacionEntity> getOperacionsByIban_0() {
        return operacionsByIban_0;
    }

    public void setOperacionsByIban_0(Collection<OperacionEntity> operacionsByIban_0) {
        this.operacionsByIban_0 = operacionsByIban_0;
    }

    @OneToMany(mappedBy = "cuentaByIban")
    public Collection<PoseeEntity> getPoseesByIban() {
        return poseesByIban;
    }

    public void setPoseesByIban(Collection<PoseeEntity> poseesByIban) {
        this.poseesByIban = poseesByIban;
    }
}
