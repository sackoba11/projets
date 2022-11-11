#++++++++++++  IMPORTATION DES DIFFERENTES BIBLIOTHEQUES ++++++++++++

from tkinter import *
from icmplib import *
from ping import *

#++++++++++++  PAGE D'ACCUEIL DU PING  ++++++++++++

def fonctPing():
    winping= Toplevel(win)
    winping.title("TRAPI")
    winping.geometry("580x400+0+70")
    winping.configure(bg='light grey')
    winping.iconphoto(False, PhotoImage(file='image/favicon.png'))

    def get_ping():
        
        result.set(run_ping(target.get(), float(timeout.get()), int(size.get()), int(nombre.get()), int(IP_TTL.get())))
        

    result = StringVar(winping)


    lab1 = Label(winping, text="Enter URL ou IP :").grid(row=0, sticky=W)
    lab2 = Label(winping, text="NOMBRE DE PAQUETS :").grid(row=1, sticky=W)
    Label(winping, text="TIMEOUT :").grid(row=2, sticky=W)
    Label(winping, text='TAILLE DU PAQUETS : ').grid(row=3, sticky=W)
    Label(winping, text='TTL :').grid(row=4, sticky=W)
    Label(winping, text="RESULTATS :").grid(row=6, sticky=W)


    Label(winping,text="", textvariable=result, bg="#ABD7E6").grid(row=7, column=1,sticky=W)
    target = Entry(winping,width=25,bd=5)
    target.grid(row=0, column=1)

    nombre = Entry(winping,width=25,bd=5)
    nombre.insert(0, "5")
    nombre.grid(row=1, column=1)

    timeout = Entry(winping, width=25,bd=5)
    timeout.insert(0, "0.5")
    timeout.grid(row=2, column=1)

    size = Entry(winping,width=25,bd=5)
    size.insert(0, "56")
    size.grid(row=3, column=1)

    IP_TTL = Entry(winping,width=25,bd=5)
    IP_TTL.insert(0, "1")
    IP_TTL.grid(row=4, column=1)

    btPing = Button(winping, text="PING", command=get_ping)
    btPing.grid(row=0, column=10, columnspan=2, rowspan=5, padx=5, pady=5)


#+++++++++++  PAGE D'ACCUEIL DE TRACEROUTE  ++++++++++++
    
def fonctTrace():
    wintrace=Toplevel(win)
    wintrace.title("TRAPI")
    wintrace.geometry("530x400+830+70")
    wintrace.configure(bg='light grey')
    wintrace.iconphoto(False, PhotoImage(file='image/favicon.png'))
    
    def get_trace():
        
        result=traceroute(target1.get(),int(nombre.get()),int(ttl1.get()),float(timeout.get()), int(maxhops.get()))
        valeur.set(result)

    valeur=StringVar()


    Label(wintrace, text="Nom d'hôte ou Adresse IP :").grid(row=0, sticky=W)
    Label(wintrace, text='Nombre : ').grid(row=1, sticky=W)
    Label(wintrace, text="TTL :").grid(row=2, sticky=W)
    Label(wintrace, text="Timeout :").grid(row=3,sticky=W)
    Label(wintrace, text="MaxHops :").grid(row=5, sticky=W)
    Label(wintrace, text="RESULTATS :").grid(row=6, sticky=W)

    Label(wintrace, text="",textvariable=valeur, bg="#ABD7E6").grid(row=7, column=1, sticky=W)

    target1 = Entry(wintrace, width=25, bd=5)
    target1.insert(0, "www.google.com")
    target1.grid(row=0, column=1)
    nombre = Entry(wintrace, width=25, bd=5)
    nombre.insert(0,'2')
    nombre.grid(row=1, column=1)
    ttl1 = Entry(wintrace, width=25, bd=5)
    ttl1.insert(0, "1")
    ttl1.grid(row=2, column=1)
    timeout = Entry(wintrace,width=25, bd=5)
    timeout.insert(0, "1")
    timeout.grid(row=3, column=1)
    maxhops = Entry(wintrace, width=25, bd=5)
    maxhops.insert(0,"30")
    maxhops.grid(row=5, column=1)


    


    btTrace = Button(wintrace, text="TRACER",command=get_trace)
    btTrace.grid(row=0, column=10, columnspan=2, rowspan=5, padx=5, pady=5)

#++++++++++++  PAGE D'ACCUEIL PRINCPAL  ++++++++++++

win = Tk()
largeur = 900  # Largeur de la fenêtre
hauteur = 540 # Hauteur de la fenêtre
ws = win.winfo_screenwidth() # Lageur de l'ecran de l'ordi
hs = win.winfo_screenheight() # Hauteur
x = (ws/2) - (largeur/2)
y = (hs/2) - (hauteur/2)
win.geometry('%dx%d+%d+%d' % (largeur, hauteur, x, y)) #centrer la page d'accueil
win.title("TRAPI")
win.iconphoto(False, PhotoImage(file='image/favicon.png'))
img = PhotoImage(file="image/accueil.png")
page= Label(win,image=img)
page.place(x=0, y=0, relwidth=1, relheight=1)

label_title = Label(win, text="BIENVENUE SUR NOTRE APPLICATION DE DIAGNOSTIQUE", font=("Courrier", 20), fg='black')
label_title.pack(pady=5)

label_subtitle = Label(win, text="Ce logiciel met en oeuvre deux(02) principaux fonctionnalités tels que PING et TRACEROUTE", font=("Courrier", 10), bg='#ABD7E6', fg='black')
label_subtitle.pack(pady=5)

label_subtitle = Label(win, text="Afin que le logiciel fonction en bon et dur forme, veillez cliquez sur la fonctionnalité que vous souhaité", font=("Courrier", 10),  bg='black', fg='white')
label_subtitle.pack(pady=5)
frame = Frame()
label_subtitle = Label(frame, text="Cliquer ici pour PINGER :", font=("Courrier", 10),  bg='black', fg='white')
label_subtitle.pack(pady=5)

yt_button = Button(frame, text=" PING", font=("Courrier", 25), bg='#ABD7E6', fg='black',command=fonctPing)
yt_button.pack(pady=5)

label_subtitle = Label(frame, text="Cliquer ici pour TRACER :", font=("Courrier", 10),  bg='black', fg='white')
label_subtitle.pack(pady=5)
yt_button = Button(frame, text=" TRACEROUTE", font=("Courrier", 25), bg='#ABD7E6', fg='black',command=fonctTrace)
yt_button.pack(pady=5)
frame.pack(expand=YES)









win.mainloop()
