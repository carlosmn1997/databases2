/**
 * Example extracted and adapted from http://community.versant.com/documentation/reference/db4o-8.0/java/tutorial/docs/FirstGlance.html
 * Date: March 15, 2014
 */

public class Cliente {

    private String nombre;
    private String telefono;
    private String apellidos;
    private String DNI;
    private int edad;
    private String email;
    private String direccion;

    public Cliente(String name, String telefono, String apellidos, String DNI,
                   int edad, String direccion) {
      this.nombre=name;
      this.telefono=telefono;
      this.apellidos=apellidos;
      this.DNI=DNI;
      this.edad=edad;
      this.direccion=direccion;
    }

    public void setNombre(String name){ this.nombre=name;}
    public String getNombre(){return this.nombre;}

    public void setTelefono(String tfno){ this.telefono=tfno;}
    public String getTelefono(){return this.telefono;}

    public void setApellidos(String apellidos){ this.apellidos=apellidos;}
    public String getApellidos(){return this.apellidos;}

    public void setDNI(String DNI){ this.DNI=DNI;}
    public String getDNI(){return this.DNI;}

    public void setEdad(int edad){ this.edad=edad;}
    public String getEdad(){return this.edad;}

    public void setDireccion(String direccion){ this.direccion=direccion;}
    public String getDireccion(){return this.direccion;}

    public void setEmail(String email){ this.email=email;}
    public String getEmail(){return this.email;}

    
    public String toString() {
        return name+"/"+points;
    }
}
