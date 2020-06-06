import Text.Show.Functions
----Se sabe que los bárbaros tienen nombre, fuerza, habilidades y objetos
type Habilidad = String
type Objeto = (Barbaro->Barbaro)

data Barbaro = Barbaro {
    nombre::String,
    fuerza:: Integer,
    habilidades::[Habilidad],
    objetos :: [Objeto]
} deriving (Show)

dave = Barbaro { nombre = "Dave",  fuerza =  100,  habilidades = ["tejer","escribirPoesia"], objetos = [ardilla, varitasDefectuosas] }
prueba = Barbaro { nombre = "Prueba",  fuerza =  80,  habilidades = ["pintar","leer"], objetos = [ardilla, varitasDefectuosas] }

----1 las espadas aumentan las fuerzas de los barbaros en 2 unidades
espadas :: Integer -> Objeto
espadas nuevaFuerza barbaro  = barbaro { fuerza  = fuerza barbaro + (nuevaFuerza  * 2) }

---2 los amuletosMisticos puerco-marranos otorgan una habilidad dada a un barbaro

amuletosMisticos:: [Habilidad] -> Objeto
amuletosMisticos habilidad barbaro = barbaro { habilidades = habilidades barbaro ++ habilidad }

----3 los amuletos puerco-marranos otorgan una habilidad dada a un barbaro
varitasDefectuosas :: Objeto
varitasDefectuosas  barbaro = ( amuletosMisticos ["Hacer Magia"] barbaro ) {objetos = [] }
---4 Una ardilla, que no hace nada
ardilla :: Objeto
ardilla noHaceNada = noHaceNada

---Una cuerda , que combina dos objetos distintos, obteniendo uno que realiza las transformaciones de los otros dos.
cuerda:: Objeto -> Objeto -> Barbaro -> Barbaro
cuerda objeto1 objeto2 = objeto1.objeto2 







