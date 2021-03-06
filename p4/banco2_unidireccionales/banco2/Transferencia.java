package banco2;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
@DiscriminatorValue("transferencia")
public class Transferencia extends Operacion {
  private Cuenta cuentaByIbandestino;
  @ManyToOne
  @JoinColumn(name = "IBANDESTINO", referencedColumnName = "IBAN", insertable = false, updatable = false)
  public Cuenta getCuentaByIbandestino() {
      return cuentaByIbandestino;
  }

  public void setCuentaByIbandestino(Cuenta cuentaByIbandestino) {
      this.cuentaByIbandestino = cuentaByIbandestino;
  }
	
}
