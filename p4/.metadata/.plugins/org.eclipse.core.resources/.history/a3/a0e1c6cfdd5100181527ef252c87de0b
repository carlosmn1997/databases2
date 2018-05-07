package prueba;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;
import java.util.Objects;

public class OperacionEntityPK implements Serializable {
    private String codigo;
    private String ibanorigen;

    @Column(name = "CODIGO")
    @Id
    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    @Column(name = "IBANORIGEN")
    @Id
    public String getIbanorigen() {
        return ibanorigen;
    }

    public void setIbanorigen(String ibanorigen) {
        this.ibanorigen = ibanorigen;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        OperacionEntityPK that = (OperacionEntityPK) o;
        return Objects.equals(codigo, that.codigo) &&
                Objects.equals(ibanorigen, that.ibanorigen);
    }

    @Override
    public int hashCode() {

        return Objects.hash(codigo, ibanorigen);
    }
}
