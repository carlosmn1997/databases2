package banco2;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "CLIENTE", schema = "A717788", catalog = "")
public class ClienteEntity {
    private String dni;
    private String nombre;
    private String apellido;
    private long edad;
    private String direccion;
    private String email;
    private String telefono;

    @Id
    @Column(name = "DNI")
    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    @Basic
    @Column(name = "NOMBRE")
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @Basic
    @Column(name = "APELLIDO")
    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    @Basic
    @Column(name = "EDAD")
    public long getEdad() {
        return edad;
    }

    public void setEdad(long edad) {
        this.edad = edad;
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
    @Column(name = "EMAIL")
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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
        ClienteEntity that = (ClienteEntity) o;
        return edad == that.edad &&
                Objects.equals(dni, that.dni) &&
                Objects.equals(nombre, that.nombre) &&
                Objects.equals(apellido, that.apellido) &&
                Objects.equals(direccion, that.direccion) &&
                Objects.equals(email, that.email) &&
                Objects.equals(telefono, that.telefono);
    }

    @Override
    public int hashCode() {

        return Objects.hash(dni, nombre, apellido, edad, direccion, email, telefono);
    }
}
