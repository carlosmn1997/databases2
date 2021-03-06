package prueba;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "OFICINA", schema = "A717788", catalog = "")
public class OficinaEntity {
    private String codigo;
    private String direccion;
    private String telefono;

    @Id
    @Column(name = "CODIGO")
    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    @Basic
    @Column(name = "DIRECCION")
    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    @Basic
    @Column(name = "TELEFONO")
    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        OficinaEntity that = (OficinaEntity) o;
        return Objects.equals(codigo, that.codigo) &&
                Objects.equals(direccion, that.direccion) &&
                Objects.equals(telefono, that.telefono);
    }

    @Override
    public int hashCode() {

        return Objects.hash(codigo, direccion, telefono);
    }
}
