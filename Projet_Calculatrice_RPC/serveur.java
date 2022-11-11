
/*server java */
//importation des bibliotheques
import java.io.*;
import java.net.*;

//Création de la classe principale
public class serveur {
    public static void main(String[] args) throws IOException {
        System.out.println("Mode attente d'un client potentiel ");
        ServerSocket serv = new ServerSocket(2022);
        Socket soc = serv.accept();
        BufferedReader in = new BufferedReader(new InputStreamReader(soc.getInputStream()));
        while (true) {
            System.out.println("Votre connexion est bien etablie");
            double nombre1 = Double.parseDouble(in.readLine());
            double nombre2 = Double.parseDouble(in.readLine());
            int sign = Integer.parseInt(in.readLine());
            PrintWriter out = new PrintWriter(soc.getOutputStream(), true);
            out.println(calcule(nombre1, nombre2, sign));
        }
    }
    /**
     * @param nombre1
     * @param nombre2
     * @param sign
     * @return
     */
    private static String calcule(double nombre1, double nombre2, int sign) {
        String resultat = "";
        if (sign==1) {
                resultat = String.valueOf((nombre1 + nombre2));
        }    
        else if (sign==2){
                resultat = String.valueOf((nombre1 - nombre2));
        }
        else if (sign==3){
                    resultat = String.valueOf((nombre1 * nombre2));
        }
        else{
            if(nombre2==0){
                resultat="Veuillez saisir le Nombre 2 different de 0";
            }
            else{
                resultat = String.valueOf((nombre1 / nombre2));
            }
        }

        return resultat;
    }
}
