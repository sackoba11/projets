//define remote interface
import java.rmi.*;

public interface AddRem extends Remote{
    public String addition (int nbr1,int nbr2, int nbr3, int nbr4) throws RemoteException;
    public String soustraction (int nbr1, int nbr2, int nbr3, int nbr4) throws RemoteException;
    public String multiplication(int nbr1, int nbr2, int nbr3, int nbr4) throws RemoteException;
    public String conjugue(int nbr1, int nbr2) throws RemoteException;
    public double module(int nbr1, int nbr2) throws RemoteException;
}