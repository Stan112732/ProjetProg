import java.util.ArrayList;
public class Categorie {
    public String categorie;
    public SousCategorie sousCategorie;
    ArrayList<SousCategorie> listeSousCategorie = new ArrayList<SousCategorie>();

    public Categorie (String categorie){
    this.categorie = categorie;

    }
    public String toString(){
        return categorie;
    }

    public String getCategorie() {
        return categorie;
    }

    public void insererSousCategorie(SousCategorie sousCategorie){
        listeSousCategorie.add(sousCategorie);
    }
}
