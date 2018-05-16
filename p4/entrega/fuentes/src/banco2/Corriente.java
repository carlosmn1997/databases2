package banco2;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.*;

@Entity
@DiscriminatorValue("corriente")
public class Corriente extends Cuenta {
	private Oficina oficinaByOficina;
    @ManyToOne
    @JoinColumn(name = "OFICINA", referencedColumnName = "CODIGO", insertable = false, updatable = false)
    public Oficina getOficinaByOficina() {
        return oficinaByOficina;
    }

    public void setOficinaByOficina(Oficina oficinaByOficina) {
        this.oficinaByOficina = oficinaByOficina;
    }
		

}
