	import java.util.Objects;
//attributs
	public class Prestation {
		public String nom;
		public double prixNormal;
		public double prixPlus;



//constructors
	public Prestation(String nom, double prixNormal, double prixPlus) {
		this.nom = nom;
		this.prixNormal = prixNormal;
		this.prixPlus = prixPlus;
	}
//getters
	public  String getNom(){
		return nom;
		}

	public double getPrixNormal() {
		return prixNormal;
	}

	public double getPrixPlus() {
		return prixPlus;
	}
//methodes
		
	public String toString() {
		return nom;
	}

	@Override
	public int hashCode() {
		return Objects.hash(nom);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Prestation other = (Prestation) obj;
		return Objects.equals(nom, other.nom);
	}





}
