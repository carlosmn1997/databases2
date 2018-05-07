package prueba;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;
import java.util.Objects;

public class PoseeEntityPK implements Serializable {
    private String dni;
    private String iban;

    @Column(name = "DNI")
    @Id
    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    @Column(name = "IBAN")
    @Id
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
        PoseeEntityPK that = (PoseeEntityPK) o;
        return Objects.equals(dni, that.dni) &&
                Objects.equals(iban, that.iban);
    }

    @Override
    public int hashCode() {

        return Objects.hash(dni, iban);
    }
}
