import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class Agent {
    //attributs
    public int idAgent;
    public double budget;
    public double benefice;
    public Stock stock;
    //constructors
    public Agent(int idAgent, double budget){
        this.idAgent = idAgent;
        this.budget = budget;
    }

    public int getIdAgent() {
        return idAgent;
    }

    public static Connection getCon() {
        try {//initialiser la connection avec la bd
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost/gestionenchere?useUnicode=true&characterEncoding=utf-8";//
            String user = "root";
            String password = "Ll98Zz04Jj26!";
            Connection conn = DriverManager.getConnection(url, user, password);
            return conn;
        } catch (Exception e) {
            e.printStackTrace();//
            return null;
        }

    }


    public void calculerPrixMoyen(Enchere en){
        System.out.println("Enchere envisagee: " + en.getLibelleEnchere());
        System.out.println("modele d'article envisagee: " + en.getModele());
        try {
            ConnectionBD.getPrixMarche(en);
        } catch (Exception e) {
            e.printStackTrace();
        }


    }

    public void comparerPrixAchat(Enchere enchere,Agent ag){
        Connection conn = getCon();
        try {
            //Thread.currentThread().sleep(5000);//Dans 50 seconds on rafraichi la bd et on trouve l'article correspond a condition
            Statement pstmt = conn.createStatement();
            String sql = "FLUSH TABLES";
            pstmt.executeUpdate(sql);
            ConnectionBD.acheterAuto(enchere,ag);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void comparerPrixVente(Enchere enchere, Agent ag){
        Connection conn = getCon();
        try {
            //Thread.currentThread().sleep(50000);//Dans 50 seconds on rafraichi la bd et on trouve l'article correspond a condition
            Statement pstmt = conn.createStatement();
            String sql = "FLUSH TABLES";
            pstmt.executeUpdate(sql);
            ConnectionBD.venteAuto(enchere,ag);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}