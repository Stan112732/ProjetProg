public class Stock {

    public int numStock;

    public void calculerPrixMoyen(Enchere en){
        System.out.println("Enchere envisagee: " + en.getLibelleEnchere());
        System.out.println("modele d'article envisagee: " + en.getModele());
        try {
            ConnectionBD.getPrixMarche(en);
        } catch (Exception e) {
            e.printStackTrace();
        }


    }

    public void comparerPrix(Enchere enchere){

        try {
            ConnectionBD.acheterAuto(enchere);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    }



