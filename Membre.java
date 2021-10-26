import java.util.ArrayList;
import java.util.HashMap;
public class Membre {
	//attribut
	HashMap<Prestation, Integer> commandesPrestation = new HashMap<Prestation, Integer>();
	public int codeM;
	public String nomPseudoM;
	public String adresseMailM;
	public String adressePostale;
	public String motDePasse;
	public String nomM;
	public String prenomM;

	public int pointEvaluation;
	public String evaluationMembre;
	ArrayList<String> evaluation = new ArrayList<String>();
	HashMap<Membre, ArrayList<String>> commandesEnchere = new HashMap<Membre, ArrayList<String>>();

	//constructors
	public Membre(int codeM, String nomPseudoM, String adresseMailM, String adressePostale) {
		this.codeM = codeM;
		this.nomPseudoM = nomPseudoM;
		this.adresseMailM = adresseMailM;
		this.adressePostale = adressePostale;
	}

	public void inscriptionMembre(String nomPseudoM,String adresseMailM,String adressePostale,String motDePasse,String nomM,String prenomM) {
		this.nomPseudoM=nomPseudoM;
		this.adresseMailM = adresseMailM;
		this.adressePostale = adressePostale;
		this.nomM = nomM;
		this.prenomM = prenomM;
		this.motDePasse = motDePasse;

		try {
			ConnectionBD.insererMembre(this);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//getters et setters
	public String getEvaluationMembre() {
		return evaluationMembre;
	}

	public int getCodeM() {
		return codeM;
	}

	public void setCodeM(int codeM) {
		this.codeM = codeM;
	}

	public String getNomPseudoM() {
		return nomPseudoM;
	}

	public void setNomPseudoM(String nomPseudoM) {
		this.nomPseudoM = nomPseudoM;
	}

	public String getAdresseMailM() {
		return adresseMailM;
	}

	public void setAdresseMailM(String adresseMailM) {
		this.adresseMailM = adresseMailM;
	}

	public void setAdressPostale(String adressePostale) {
		this.adressePostale = adressePostale;
	}

	public String getAdressePostale() {
		return adressePostale;
	}

	public String getNomM(){
		return nomM;
	}
	public String getPrenomM(){
		return prenomM;
	}
	public String getMotDePasse(){
		return motDePasse;
	}



	public void afficherMembre() {
		System.out.println(codeM + "   " + "Nom utilisateur: " + nomPseudoM + "  " + "Adresse email: " + adresseMailM + " " + "Adresse: " + adressePostale);


	}

	public void acheterJourPrestation(Prestation produit, int jour) {//inserer une prestation
		commandesPrestation.put(produit, jour);

	}

	public void insererMemEn(Membre nomPseudoM, ArrayList<String> listeEnchere) {
		commandesEnchere.put(nomPseudoM, listeEnchere);

	}

	public String toString() {
		return nomPseudoM;
	}

	public void afficherCommande() {
		System.out.println("Votre liste d'enchere: ");
		System.out.println(commandesEnchere);
	}

	public void calculer() {
		double prixTotal = 0;
		for (Prestation nom : commandesPrestation.keySet()) {
			prixTotal = prixTotal + nom.prixNormal * commandesPrestation.get(nom).intValue();
		}
		System.out.println("Montant total de votre prestation complementaire : " + prixTotal + " ¢ã");
	}



	// Determiner le prix
	public void determinerPrixDep(Enchere en, double prixDep) {
		en.setPrixDep(prixDep);
	}

	// Determiner le pas
	public void determinerPas(Enchere en, double pas) {
		en.setPas(pas);
	}

	// Encherir
	public void offrePrix(Enchere en, double prixNouveaux) {
		if (en.etatEnchere != EtatEnchere.TERMINEE && en.etatEnchere != EtatEnchere.ANNULEE) {
			if (en.midTime > 0 && prixNouveaux - en.prixDepart >= en.pas) {
				en.pas = prixNouveaux - en.prixDepart;
				en.prixDepart = prixNouveaux;
				en.prixNouveaux = prixNouveaux;
				en.afficherNewPrix();
			} else if (en.midTime <= 0) {
				en.modifierEtat(EtatEnchere.TERMINEE);
			} else if (prixNouveaux - en.prixDepart < en.pas) {
				System.out.println("Vous devez proposer un pas egal ou superieur au pas actuel: " + en.pas);
			}
		} else {
			System.out.println("CET ENCHERE N'EST PLUS DISPONIBLE!!");
		}
	}

	//achat immediat
	public void achatImmediat(double prixAchat, Enchere en) {
		if (prixAchat == en.prixAchatImm) {
			en.modifierEtat(EtatEnchere.TERMINEE);
			try {
				ConnectionBD.etatTerminee(en);
			} catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println("Transaction reussite!");
		}

	}

	//Evaluer les membre
	public void insererEvaluation(String evaluationMembre ) {
		evaluation.add(evaluationMembre);
	}

	public int calculerLePoint() {
		pointEvaluation = 0;
		for (int i = 0; i < evaluation.size(); i++) {
			if (evaluation.get(i) == "TB") {
				pointEvaluation += 5;
			} else if (evaluation.get(i) == "B") {
				pointEvaluation += 3;
			} else if (evaluation.get(i) == "N") {
				pointEvaluation += 0;
			} else if (evaluation.get(i) == "P") {
				pointEvaluation -= 1;
			} else if (evaluation.get(i) == "GP") {
				pointEvaluation -= 3;
			}

		}
		return pointEvaluation;
	}
	public Membre qualifier(){
		System.out.println("Maintenant votre point d'evoluation est : " + pointEvaluation);
		if (pointEvaluation >= 50) {            //si le point est superieur a 50, le membre devient un membre plus
			System.out.println("F¨¦licitations pour devenir membre plus");
			return new MembrePlus(codeM, nomPseudoM, adresseMailM, adressePostale);

		} else {
			return this;
		}
	}

}
