
import java.sql.*;

public class ConnectionBD {

    public static Connection getCon() {
        try {//initialiser la connection avec la bd
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost/gestionenchere?useUnicode=true&characterEncoding=utf-8";//
            String user = "root";
            String password = "Ll98Zz04Jj26!";
            Connection conn = DriverManager.getConnection(url, user, password);

            /*Statement stat = conn.createStatement();

            String command = "select * from membre";//tester la requete

            //stat.executeUpdate("INSERT INTO membre (pseudoMembre,MotDePasse,nomMembre,prenomMembre,AdresseMail, AdressePostale) VALUES('DSB1123','password','Seb','JERK','332253@qq.com','6 rue du 33 rosel 1233')");
            ResultSet result = stat.executeQuery(command);
            //
            while (result.next()) {

                System.out.println(result.getString(1) + " " + result.getString(2) + " " + result.getString(3));
            }
            result.close();*/
            return conn;
        } catch (Exception e) {
            e.printStackTrace();//
            return null;
        }

    }

   public static void insererMembre(Membre membre) throws Exception {
        Connection conn = getCon();
        Statement stmt = conn.createStatement();
        String command = "INSERT INTO membre (pseudoMembre,MotDePasse,nomMembre,prenomMembre,AdresseMail, AdressePostale) VALUES('"+membre.getNomPseudoM()+"','"+membre.getMotDePasse()+"','"+membre.getNomM()+"','"+membre.getPrenomM()+"','"+membre.getAdresseMailM()+"','"+membre.getAdressePostale()+"')";
        stmt.executeUpdate(command);
        System.out.println(membre.nomPseudoM + " inscrit avec succes");
        conn.close();
    }

    public static void eliminerMembre(Membre membre) throws Exception {
        Connection conn = getCon();
        Statement stmt = conn.createStatement();
        String command = "DELETE FROM membre WHERE pseudoMembre ='"+membre.nomPseudoM+"'";
        stmt.executeUpdate(command);
        System.out.println(membre.nomPseudoM + " Elimination reussite");
        conn.close();
    }

    public static void insererArticle(Enchere enchere) throws Exception {
        Connection conn = getCon();
        Statement stmt = conn.createStatement();
        String command1 = "INSERT INTO enchere (libelleE,descriptionE,PrixDep,PrixRes, PrixAchatIm,FraisTransport,etatEnchere) VALUES('"+enchere.getLibelleEnchere()+"','"+enchere.getDescriptionEnchere()+"','"+enchere.getPrixDepart()+"','"+enchere.getPrixReserve()+"','"+enchere.getPrixImm()+"','"+enchere.getFraisTransport()+"','"+enchere.getEtatEnchere()+"')";
        stmt.executeUpdate(command1);
        System.out.println();
        conn.close();
    }

    public static void etatTerminee(Enchere enchere) throws Exception{
        Connection conn = getCon();
        Statement stmt = conn.createStatement();
        String command1 = "UPDATE enchere SET etatEnchere = '"+enchere.getEtatEnchere()+"'WHERE libelleE = '"+enchere.getLibelleEnchere()+"'";
        stmt.executeUpdate(command1);
        System.out.println();
        conn.close();
    }

    public static void insererPrestation(Prestation prestation) throws Exception {
        Connection conn = getCon();
        Statement stmt = conn.createStatement();
        String command = "INSERT INTO prestation (nomP,PrixP,PrixPMP) VALUES('"+prestation.getNom()+"','"+prestation.getPrixNormal()+"','"+prestation.getPrixPlus()+"')";
        stmt.executeUpdate(command);
        System.out.println(prestation.nom + " enregistree avec succes");
        conn.close();
    }

    public static void insererPromo(Promotion promo) throws Exception {
        Connection conn = getCon();
        Statement stmt = conn.createStatement();
        String command = "INSERT INTO promotion (NomPromotion,DescriptionP) VALUES('"+promo.getNomPromotion()+"','"+promo.getDescriptionPromo()+"')";
        stmt.executeUpdate(command);
        System.out.println(promo.getNomPromotion() + " enregistree avec succes");
        conn.close();
    }

/*    public static void modifPromo(String descriptionNouvelle) throws Exception{
        Connection conn = getCon();
        Statement stmt = conn.createStatement();
        String command1 = "UPDATE promotion SET DescriptionP = '"+descriptionNouvelle+"'WHERE NomPromotion = 'BIG PAPA ET MAMA'";
        stmt.executeUpdate(command1);
        System.out.println("");
        conn.close();
    }*/

    public static void insererCategorie(Categorie ca) throws Exception {
        Connection conn = getCon();
        Statement stmt = conn.createStatement();
        String command = "INSERT INTO categorie (libelleC) VALUES('"+ca.getCategorie()+"')";
        stmt.executeUpdate(command);
        System.out.println(ca.getCategorie() + " enregistree avec succes");
        conn.close();
    }

    public static void getPrixMarche(Enchere enchere) throws Exception {
        Connection conn = getCon();
        Statement stmt = conn.createStatement();
        String command = "SELECT AVG(PrixAchatIm) AS PrixMoyenMarche FROM enchere WHERE modele = '"+enchere.getModele()+"'";
        ResultSet result = stmt.executeQuery(command);
        while (result.next()) {
            double PrixMoyenMarche = result.getInt("PrixMoyenMarche");
            System.out.println("prix du marche pour ce produit: " + PrixMoyenMarche);
        }
        result.close();
        conn.close();
    }

    public static void acheterAuto(Enchere enchere) throws SQLException {
        Connection conn = getCon();
        Statement stmt = conn.createStatement();
        String command = "SELECT modele,idEnchere,libelleE, PrixAchatIm FROM enchere where PrixAchatIm <(SELECT AVG(e1.PrixAchatIm) AS PrixMoyenMarche FROM enchere e1 WHERE e1.modele = '"+enchere.getModele()+"') ";
        ResultSet result = stmt.executeQuery(command);
        if(result==null){
            System.out.println("AUCUN ARTICLE A ACHETER! ");
        }
        while (result.next()) {
            String modele = result.getString("modele");
            int idEnchere = result.getInt("idEnchere");
            String libelle = result.getString("libelleE");
            double prixAchatIm = result.getDouble("PrixAchatIm");

            System.out.println("L'article a acheter: ");
            System.out.println("Libelle de l'enchere: " + libelle);
            System.out.println("Numero de l'enchere: " + idEnchere);
            System.out.println("Prix d'achat: " + prixAchatIm);
            System.out.println("Modele de l'article: " + modele);

            Statement stmt1 = conn.createStatement();
            String command1 = "INSERT INTO stock (libelleS, modeleS, dateAchat, prixAchat) VALUES('"+libelle+"','"+modele+"',NOW(),'"+prixAchatIm+"')";
            stmt1.executeUpdate(command1);
            System.out.println( idEnchere + " "+ modele + " " + " enregistree avec succes");
            Statement stmt2 = conn.createStatement();
            String command2 = "DELETE FROM enchere WHERE idEnchere = '"+idEnchere+"'";
            stmt2.executeUpdate(command2);
        }

        result.close();
        conn.close();
    }

    }









