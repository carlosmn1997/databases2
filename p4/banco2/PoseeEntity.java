package banco2;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "POSEE", schema = "A717788", catalog = "")
@IdClass(PoseeEntityPK.class)
public class PoseeEntity {
    private String dni;
    private String iban;
    private ClienteEntity clienteByDni;
    private CuentaEntity cuentaByIban;

    @Id
    @Column(name = "DNI")
    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    @Id
    @Column(name = "IBAN")
    public String getIban() {
        return iban;
    }

    public void setIban(String iban) {
        this.iban = iban;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        PoseeEntity that = (PoseeEntity) o;
        return Objects.equals(dni, that.dni) &&
                Objects.equals(iban, that.iban);
    }

    @Override
    public int hashCode() {

        return Objects.hash(dni, iban);
    }

    @ManyToOne
    @JoinColumn(name = "DNI", referencedColumnName = "DNI", nullable = false, insertable = false, updatable = false)
    public ClienteEntity getClienteByDni() {
        return clienteByDni;
    }

    public void setClienteByDni(ClienteEntity clienteByDni) {
        this.clienteByDni = clienteByDni;
    }

    @ManyToOne
    @JoinColumn(name = "IBAN", referencedColumnName = "IBAN", nullable = false, insertable = false, updatable = false)
    public CuentaEntity getCuentaByIban() {
        return cuentaByIban;
    }

    public void setCuentaByIban(CuentaEntity cuentaByIban) {
        this.cuentaByIban = cuentaByIban;
    }
}
