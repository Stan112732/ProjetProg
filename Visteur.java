import java.util.Random;

public class Visteur {
	public int codeV;
	public String nomV;
	

	public void setCodeV(int codeV) {
		this.codeV = codeV;

	}


	public void setNomV(String nomV) {
		this.nomV = nomV;
	}


	public void afficherVisteur() {
		System.out.println(codeV +"   "+ nomV);
	}

}
