import java.sql.SQLException;
import java.util.Timer;
import java.util.TimerTask;

public class Main {

	public static void main(String[] args) throws SQLException {

		/*//PARTIE I : CREATION VISITEUR
		System.out.println("visteur");
		Visteur v1 = new Visteur();
		v1.setCodeV(06);
		v1.setNomV("feng");
		v1.afficherVisteur();
		 */
		//PARTIE II: CREATION CATEGORIE
		Categorie ca1 = new Categorie("Alimentation");
		Categorie ca2 = new Categorie("Vehicule");
		SousCategorie sca1 = new SousCategorie("Tacos");
		SousCategorie sca2 = new SousCategorie("Militaria");
	/*	ca1.insererSousCategorie(sca1);
		ca1.insererSousCategorie(sca2);
		//System.out.println(ca1.listeSousCategorie);
		System.out.println(" ");*/

		//PARTIE III: CREATION MEMBRE
		/*System.out.println("Membre");
		Membre m1 = new Membre(01,"FENG","374432210@qq.com","6 rue du 23 avril 1945");
		//inscrire les info de membre 1 dans la bd
		m1.inscriptionMembre("HGDSB","3322@qqq.com","3 rue du er nov","nmsl","Ologe","DICK");
		m1.afficherMembre();
        Membre m2 = new Membre(02,"Zijian","zijian@gmail.com","15 rue du 23 avril 1945");
		m2.inscriptionMembre("james1124","12334@126.com","9 rue du prisident Rosvolt","12345","Cruce","THOMAS");
		m2.afficherMembre();
		//creer un membre plus pour tester les fonctionalitees suivantes
		MembrePlus mp1 = new MembrePlus(02,"Zijian","zijian@gmail.com","15 rue du 23 avril 1945");
*/
		/*//PARTIE IV CREATION DES PRESTATIONS
		Prestation p1 = new Prestation("Description detail",3.5, 2);
		Prestation p2 = new Prestation("titre plus haut",3,1);
		Prestation p3 = new Prestation("titre en gras",1,0.8);
		Prestation p4 = new Prestation("photo supplementaire",0.4,0.2);
		//acheter prestation
		System.out.println(" ");
		m1.acheterJourPrestation(p4, 1);
		m1.acheterJourPrestation(p3, 1);
		m1.calculer();
		mp1.acheterJourPrestation(p3,1);
		mp1.calculerPMP();*/

		/*//PARTIE V: CREATION PROMOTION
		Promotion pomo1 = new Promotion(1,"BIG PAPA ET MAMA","MYSY");
		pomo1.creerPromo(pomo1.getNomPromotion(), "achater un big papa offre gratuit une big mama");
		pomo1.modifierPromo( "BIG PAPA ET MAMA","achater un big papa offre DEUX gratuit big mama");
		pomo1.modifierPromo( "BIG PAPA ET MAMA","achater un big papa offre TROIS gratuit big mama");
//		pomo1.eliminerPromo("BIG PAPA ET MAMA");
		pomo1.afficherPromo();*/

		//PARTIE VI:CREATION DES ENCHERES
		/*System.out.println(" ");
		System.out.println("consuleter la liste d'enchere");*/
		//Enchere en1 = new Enchere(01,"BIG PAPA",EtatEnchere.EN_ATTENTE,sca1 );
		//Enchere en2 = new Enchere(02,"BIG MAMA",EtatEnchere.EN_ATTENTE,sca1);
		Enchere en3 = new Enchere(03,"Ancienne bomb nuclaire","Russian", 40, EtatEnchere.EN_ATTENTE,sca2);
		//en1.insererArticle("BIG PAPA",en1);//Inserer les encheres dans la liste d'enchere
		//en2.insererArticle("BIG MAMA",en2);
		//inserer l'enchere dans bd
		//en3.insererArticleMPBD("Ancien nuclaire bomb","une bombe nuclaire permettant de destruire Mosko",40,20,95,80, EtatEnchere.EN_COURS);

		//relier le membre a l'enchere qu'il cree
		/*m1.insererMemEn(m1, en1.listeEnchere);
		m2.insererMemEn(m2, en2.listeEnchere);
		m1.afficherCommande();
		System.out.println(" ");*/

		//Determiner le prix pour l'enchere en1
		/*System.out.println(en2.getLibelleEnchere());
		m1.determinerPrixDep(en2, 12.5);
		en2.afficherPrixDepart();
		en2.setPas(3);
		en2.afficherPas();
		en2.getTempsRestant(2021, 9, 21, 17, 22, 0);*/

//		creer un membre plus pour voir les fonctionnalites dans sa totalite
		/*System.out.println(" ");
		System.out.println(en3.getLibelleEnchere());
		mp1.determinerPrixDep(en1, 12);
		en3.afficherPrixDepart();
		mp1.determinerPrixRes(en1, 15);
		//en1.afficherPrixReserve();
		mp1.determinerPrixImm(en1, 18);*/
	/*	en3.afficherPrixImm();
		mp1.determinerPas(en3, 5);
		en3.afficherPas();
		en3.getTempsRestant(2021, 9, 21, 17, 22, 0);
		
		System.out.println(" ");
		System.out.println(" ");*/

		/*// PARTIE VII: EVALUATION MEMBRE
		//laisser evaluation et donner qualification ou eliminer le membre
		System.out.println(" ");
		System.out.println(" ");
		m1.insererEvaluation("TB");
		m1.insererEvaluation("B");
		m2.insererEvaluation("GP");
		m1.calculerLePoint();
		m2.calculerLePoint();*/


	/*	// verifier si le point est superieur a 50, si oui, donner la
		m1 = m1.qualifier();
		if (m1 instanceof MembrePlus) {
			MembrePlus mp3 = (MembrePlus)m1;
			mp3.afficherMembre();
		}*/


		//PARTIE VIII: PARTICIPER A UN ENCHERE
		System.out.println(" ");
		System.out.println(" ");
		//pour membre m1, participer a un enchere
		/*System.out.println("enchere que vous participez: "+ en1.getLibelleEnchere());
		m1.offrePrix(en1, 18);
		m1.offrePrix(en1, 24);
		m1.offrePrix(en1, 26);//Dans ce cas, le pas actuel n'est pas atteint,il faut reproposer un pas
*/
		//achat immediat
		/*System.out.println(" ");
		m1.achatImmediat(80,en3);//si l'encherisseur decide d'acheter immediatement l'objet, alors l'enchere est terminee
        //afficher l'etat de l'enchere
		en3.afficherEtat(en3);
		System.out.println(" ");
		System.out.println(" ");
		Service s1 = new Service(01,"serviceInformatique");*/
		/*s1.enregistrePrestation(p1);
		s1.enregistrePrestation(p2);
		s1.enregistrePrestation(p3);
		s1.enregistrePrestation(p4);
		s1.creerPromo(pomo1,"BIG","MAMA");
		s1.enregistreCategorie(ca1);*/
		//s1.eliminerMembre(m1);


		//ZONE DE TEST
		Stock sto = new Stock();
		sto.calculerPrixMoyen(en3);
		System.out.println(" ");
		System.out.println(" ");
		sto.comparerPrix(en3);




	}
}
