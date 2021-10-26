public class Service {
	private int codeService;
	private String nomService;
	
	
	public Service(int codeS, String nomS) {
		this.codeService=codeS;
		this.nomService=nomS;
		
		
	}


	public void eliminerMembre(Membre nomPseudoM) {
		if (nomPseudoM.pointEvaluation < 0) {
			nomPseudoM.commandesEnchere.remove(nomPseudoM);
			System.out.println("Membre " + nomPseudoM + " a ete supprimee");

		try {
			ConnectionBD.eliminerMembre(nomPseudoM);
		} catch (Exception e) {
			e.printStackTrace();
		}
		}
	}

	public void enregistrePrestation(Prestation prestation){
		try {
			ConnectionBD.insererPrestation(prestation);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	public void creerPromo(Promotion promotion,String nomPromotion,String descriptionPromo){
		promotion.creerPromo(nomPromotion,descriptionPromo);
		try {
			ConnectionBD.insererPromo(promotion);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void enregistreCategorie(Categorie ca){
		try {
			ConnectionBD.insererCategorie(ca);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}




}