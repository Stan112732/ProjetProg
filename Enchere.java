import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Objects;
import java.util.ArrayList;

//attributs
public class Enchere {

      public int codeEN;
	  public String libelleEnchere;
      public String descriptionEnchere;
	  public String modele;
      public double prixDepart;
      public EtatEnchere etatEnchere;
      public SousCategorie sousCategorie;
	  public double prixReserve;
	  public double prixAchatImm;
	  public double pas;
	  public double prixNouveaux;
	  public double fraisTransport;
	  public static Calendar c;
	  public static long endTime;
	  public static Date date;
	  public static long startTime;
	  public static long midTime;
	  ArrayList<String>listeEnchere = new ArrayList<String>();
  
  //constructor
  
	public Enchere(int codeEN,String libelleEnchere,String modele,double prixAchatImm,EtatEnchere etatEnchere,SousCategorie sousCategorie) {
		this.codeEN = codeEN;
		this.libelleEnchere = libelleEnchere;
		this.modele = modele;
		this.prixAchatImm = prixAchatImm;
		this.etatEnchere = etatEnchere;
		this.sousCategorie = sousCategorie;
	}

	//methodes
	public String toString() {
		return libelleEnchere;
	}


	public String getLibelleEnchere() {
		return libelleEnchere;
	}

	public String getModele(){
		return modele;
	}

	public void insererArticle(String libelleEnchere,Enchere en) {
		listeEnchere.add(libelleEnchere);
		en.modifierEtat(EtatEnchere.EN_COURS);
	}

		public void insererArticleMNBD(String libelleEnchere, String descriptionEnchere,double prixDepart,double fraisTransport,EtatEnchere etatEnchere){
			this.libelleEnchere = libelleEnchere;
			this.descriptionEnchere = descriptionEnchere;
			this.prixDepart= prixDepart;
			this.fraisTransport = fraisTransport;
			this.etatEnchere = etatEnchere;

			try {
				ConnectionBD.insererArticle(this);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	public void insererArticleMPBD(String libelleEnchere, String descriptionEnchere,double prixDepart,double fraisTransport,double prixReserve,double prixAchatImm,EtatEnchere etatEnchere){
		this.libelleEnchere = libelleEnchere;
		this.descriptionEnchere = descriptionEnchere;
		this.prixDepart= prixDepart;
		this.prixReserve = prixReserve;
		this.prixAchatImm = prixAchatImm;
		this.fraisTransport = fraisTransport;
		this.etatEnchere = etatEnchere;

		try {
			ConnectionBD.insererArticle(this);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void afficherList() {
		System.out.println(listeEnchere);
	}

	@Override
	public int hashCode() {
		return Objects.hash(listeEnchere);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Enchere other = (Enchere) obj;
		return Objects.equals(listeEnchere, other.listeEnchere);
	}

    //Encapsulation de Determination du prix
    public void setPrixDep(double prixDepart) {
	this.prixDepart = prixDepart;
}
 
    public double getPrixDepart() {
	return prixDepart;
}
    public void afficherPrixDepart() {
	System.out.println("prix de depart est : " + prixDepart + " ву ");
}

    public EtatEnchere getEtatEnchere(){
	return  etatEnchere;
	}
    //Modification de l'etat de l'enchere
	public void modifierEtat(EtatEnchere etatEnchere){
	this.etatEnchere = etatEnchere;
	}

	public void afficherEtat(Enchere en){
	System.out.println(en.etatEnchere);
	}
    //Encapsulation de Determination du prix immediat
    public void setPrixImm(double prixAchatImm) {
	this.prixAchatImm = prixAchatImm;
}

    public double getPrixImm() {
	return prixAchatImm;
}
    public void afficherPrixImm() {
	System.out.println("le prix d'achat immediat est : " + prixAchatImm + " ву ");
}

    //Encapsulation de Determination du prix de reserve
    public void setPrixRes(double prixReserve) {
	this.prixReserve = prixReserve;
}

    public double getPrixReserve() {
	return prixReserve;
}

    //Encapsulation de la description
	public String getDescriptionEnchere(){
	return descriptionEnchere;
	}

	//Encapsulation de frais de transport
	public double getFraisTransport(){
	return fraisTransport;
	}
    //Encapsulation de pas
    public void setPas(double pas) {
	this.pas = pas;
}

    public double getPas() {
	return pas;
}
    public void afficherPas() {
	System.out.println("le pas actuel est : " + pas + " ву ");
}
    //Enchere
    public void setNewPrix(double prixNouveaux) {
	this.prixNouveaux = prixNouveaux;
}
    public double getPrixNouveaux() {
	return prixNouveaux;
}
    public void afficherNewPrix() {
	System.out.println("Le prix actuel est de : " + prixNouveaux + " ву ");
}

// le temps restant
public void getTempsRestant(int annee, int mois, int jour, int heure, int min, int sec) {
	c = Calendar.getInstance();
	c.set(annee, mois,jour, heure, min, sec);
	endTime = c.getTimeInMillis();
	date = new Date();
	startTime = date.getTime();
    midTime = (endTime - startTime) / 1000;
    
    while (midTime > 0) {
   midTime--;
    long jj = (midTime/60/60/24);
    long hh = (midTime / 60 / 60) %24;
    long mm = (midTime / 60) % 60;
    long ss = midTime % 60;
    System.out.println("Il vous reste " + jj+ " jours "+ hh + " heures " + mm + " minutes " + ss + " seconds");
    break;
    }
    }
public long getMidTime() {
	return midTime;
}
}