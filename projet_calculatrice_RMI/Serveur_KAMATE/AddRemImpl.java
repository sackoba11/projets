//implementation of interface
import java.rmi.*;
import java.rmi.server.UnicastRemoteObject;
public class AddRemImpl extends UnicastRemoteObject implements
AddRem {
    public AddRemImpl() throws RemoteException{}

    
    public String addition(int nbr1,int nbr2, int nbr3, int nbr4)throws RemoteException {
        
        int nbr5 = nbr1 + nbr3;
        int nbr6 = nbr2 + nbr4;
        
        return(nbr5+"+("+nbr6+")i");
    }
    
     public String soustraction(int nbr1, int nbr2, int nbr3, int nbr4)throws RemoteException{
        
        int nbr5 = nbr1 - nbr3;
        int nbr6 = nbr2 - nbr4;
        
        return(nbr5+"+("+nbr6+")i");
    }
     
     public String multiplication(int nbr1, int nbr2, int nbr3, int nbr4)throws RemoteException{
         
         int nbr5 = (nbr1 * nbr3)-(nbr2 * nbr4);
         int nbr6 = (nbr1 * nbr4) + (nbr2 * nbr4);
         
         return (nbr5+"+("+nbr6+")i");
     }
     
      public double module(int nbr1, int nbr2) throws RemoteException{
        
        double nbr3 =Math.sqrt((nbr1*nbr1) + (nbr2*nbr2));
        
        return(nbr3);
    }
      
       public String conjugue(int nbr1, int nbr2) throws RemoteException{
         if (nbr2>=0){
          
             return (nbr1+"-"+Math.abs(nbr2)+"i");}
         else{
             
             return (nbr1+"+"+Math.abs(nbr2)+"i");}
         }
}