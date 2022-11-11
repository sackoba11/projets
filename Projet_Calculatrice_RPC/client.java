import javax.swing.*;
import javax.swing.ImageIcon;
import java.awt.*;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

//---------------------------------------
import java.io.IOException;
import java.io.*;
import java.net.*;
//---------------------------------------
public class client{

//Declaration des variables

JPanel pan; // Panel Principale
JLabel lab;
JButton Ad,Sous,Mult,Div,E,F;
JTextField champ1,champ2,champ3;
JFrame f;




//Constructeur de la classe client 

public client() throws IOException {


    System.out.println("connexion client etablie"); 
    Socket serv = new Socket("localhost", 2022);
    BufferedReader in = new BufferedReader(new InputStreamReader(serv.getInputStream()));

   

    
    //Création du Jpanel et du Jtext
    pan=new JPanel();

   

    // les Titre et les champs
    lab=new JLabel(" NOMBRE 1 :");
    pan.add(lab);  
    champ1=new JTextField(10);
    pan.add(champ1); 
    

    lab=new JLabel("NOMBRE 2 :");
    pan.add(lab);
    champ2=new JTextField(10);
    pan.add(champ2);
   
    lab=new JLabel("RESULTAT : ");
    pan.add(lab);
    champ3=new JTextField(10);
    champ3.setForeground (Color.RED);
   // champ3.setEnabled(false);
    pan.add(champ3);
    
    //Les boutons operateurs
    Ad=new JButton("Additon");
    pan.add(Ad); 
    Ad.setBackground(Color.GRAY);
    Sous=new JButton("Soustration");
    pan.add(Sous);
    Sous.setBackground(Color.GRAY);
    Mult=new JButton("Multiplication");
    pan.add(Mult);
    Mult.setBackground(Color.GRAY);
    Div=new JButton("Division");
    pan.add("SOUTH",Div);
    Div.setBackground(Color.GRAY);
   

    //positionnement des boutons et des Labels
    pan.setLayout(new GridLayout(5,2,20,20)); // Pour le schema de la fenetre


// Action Buton
    
    //action Addition 
    PrintWriter out = new PrintWriter(serv.getOutputStream(), true);
    Ad.addActionListener(new ActionListener(){
    public void actionPerformed(ActionEvent e){    
        try{
            String ad= champ1.getText();
            String ad2= champ2.getText();
            double t=Double.parseDouble(ad);
            out.println(t); 
            double b=Double.parseDouble(ad2);
            out.println(b);
            out.println(1);
            String a=in.readLine();
            
            champ3.setText(a);
        }
            catch(NumberFormatException | IOException er) {
                champ3.setText("Erreur !!");
            }
        
        }
    
    });

    
    //Action Soustration
        Sous.addActionListener(new ActionListener(){
        public void actionPerformed(ActionEvent e){
            try{
                String ad= champ1.getText();
                String ad2= champ2.getText();
                double champ1=Double.parseDouble(ad);
                out.println(champ1); 
                double b=Double.parseDouble(ad2);
                out.println(b);
                out.println(2);
                String a=in.readLine();
                
                champ3.setText(a);
            }
                catch(NumberFormatException | IOException er) {
                    champ3.setText("Erreur !!");
                }
            
        }
    });

     //Action Multiplication
     Mult.addActionListener(new ActionListener(){
        public void actionPerformed(ActionEvent e){
            try{
                String ad= champ1.getText();
                String ad2= champ2.getText();
                double champ1=Double.parseDouble(ad);
                out.println(champ1); 
                double b=Double.parseDouble(ad2);
                out.println(b);
                out.println(3);
                String a=in.readLine();
                
                champ3.setText(a);
            }
                catch(NumberFormatException | IOException er) {
                    champ3.setText("Erreur !!");
                }
            }   
            
    }); 
        
    //Action Division
    Div.addActionListener(new ActionListener(){
        public void actionPerformed(ActionEvent e){
            try{
                String ad= champ1.getText();
                String ad2= champ2.getText();
                double champ1=Double.parseDouble(ad);
                out.println(champ1); 
                double b=Double.parseDouble(ad2);
                out.println(b);
                out.println(4);
                String a=in.readLine();
                
                champ3.setText(a);
            }
                catch(NumberFormatException | IOException er) {
                    champ3.setText("Erreur !!");
                }
            
        }
    }); 


    //Fenetre
    f=new JFrame("Calculatrice SK");
    f.setVisible(true);
    f.getContentPane().add("Center",pan);
    f.setResizable(false); 
    f.setSize(550,350);
    f.setLocationRelativeTo(null);

}


      public static void main(String [] args) throws IOException {
          
        new client();
           } 

}