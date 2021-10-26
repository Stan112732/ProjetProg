import java.util.HashMap;

public class Promotion {
	private int codePromotion;
	private String nomPromotion;
	private String descriptionPromo;
	HashMap<String, String> promotion = new HashMap<String, String>();

	public Promotion(int codeP, String nomPromotion,String descriptionPromo) {
		this.codePromotion=codeP;
		this.nomPromotion=nomPromotion;
		this.descriptionPromo = descriptionPromo;
	}

	public int getCodePromotion() {
		return codePromotion;
	}

	public String getNomPromotion() {
		return nomPromotion;
	}

	public String getDescriptionPromo(){
		return descriptionPromo;
	}
	public void creerPromo(String nomPromotion,String descriptionPromo) {
		promotion.put(nomPromotion, descriptionPromo);
	}

	public void modifierPromo(String nomPromotion,String descriptionPromo) {
		if (promotion.get(nomPromotion) != null){
			promotion.put(nomPromotion, descriptionPromo);
		}
	}

	public void eliminerPromo(String nomPromotion) {
		promotion.remove(nomPromotion);

	}
	public void afficherPromo() {
		System.out.println(promotion);
	}


}