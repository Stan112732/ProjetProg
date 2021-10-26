import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Stock {

    public int numStock;

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

    public void comparerPrix(Enchere enchere){
            Connection conn = getCon();
        try {
            Thread.currentThread().sleep(50000);
            Statement pstmt = conn.createStatement();
            String sql = "FLUSH TABLES";
            pstmt.executeUpdate(sql);
            ConnectionBD.acheterAuto(enchere);

        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
    }



