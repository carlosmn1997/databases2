package banco2;

import javax.persistence.*;
import java.sql.Time;
import java.util.Objects;

@Entity
@Table(name = "OPERACION", schema = "A717788", catalog = "")
@IdClass(OperacionEntityPK.class)
public class OperacionEntity {
    private String codigo;
    private String tipo;
    private Time fecha;
    private String hora;
    private long cantidad;
    private String descripcion;
    private String ibanorigen;
    private OficinaEntity oficinaByOficina;

    @Id
    @Column(name = "CODIGO")
    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
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
    @Column(name = "FECHA")
    public Time getFecha() {
        return fecha;
    }

    public void setFecha(Time fecha) {
        this.fecha = fecha;
    }

    @Basic
    @Column(name = "HORA")
    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    @Basic
    @Column(name = "CANTIDAD")
    public long getCantidad() {
        return cantidad;
    }

    public void setCantidad(long cantidad) {
        this.cantidad = cantidad;
    }

    @Basic
    @Column(name = "DESCRIPCION")
    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @Id
    @Column(name = "IBANORIGEN")
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
        OperacionEntity that = (OperacionEntity) o;
        return cantidad == that.cantidad &&
                Objects.equals(codigo, that.codigo) &&
                Objects.equals(tipo, that.tipo) &&
                Objects.equals(fecha, that.fecha) &&
                Objects.equals(hora, that.hora) &&
                Objects.equals(descripcion, that.descripcion) &&
                Objects.equals(ibanorigen, that.ibanorigen);
    }

    @Override
    public int hashCode() {

        return Objects.hash(codigo, tipo, fecha, hora, cantidad, descripcion, ibanorigen);
    }

    @ManyToOne
    @JoinColumn(name = "OFICINA", referencedColumnName = "CODIGO")
    public OficinaEntity getOficinaByOficina() {
        return oficinaByOficina;
    }

    public void setOficinaByOficina(OficinaEntity oficinaByOficina) {
        this.oficinaByOficina = oficinaByOficina;
    }
}
