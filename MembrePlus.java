
public class MembrePlus extends Membre {
//constructor
public MembrePlus(int codeM,String nomPseudoM,String adresseMailM,String adressePostale) {
	super(codeM,nomPseudoM,adresseMailM,adressePostale);
}
//methodes
	public void calculerPMP() {
		double prixTotal = 0;
		for (Prestation nom : commandesPrestation.keySet()) {
			prixTotal = prixTotal + nom.prixPlus * commandesPrestation.get(nom).intValue();
		}
		System.out.println("Montant total de votre prestation complementaire : " + prixTotal + "€");
	}
	public void determinerPrixRes(Enchere en,double prixReserve) {
		en.setPrixRes(prixReserve);;
	}
	public void determinerPrixImm(Enchere en,double prixAchatImm) {
		en.setPrixImm(prixAchatImm);
	}
	
	
}
