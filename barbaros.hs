import Text.Show.Functions
---- 05 06 2020
--Se sabe que los bárbaros tienen nombre, fuerza, habilidades y objetos, que los ayudarán más adelante en su lucha contra el mal. Por ejemplo, dave tiene:

type Objeto = ( Barbaro -> Barbaro)
type Habilidad = String

data Barbaro = Barbaro {
    nombre::String,
    fuerza:: Integer,
    habilidades::[Habilidad],
    objetos :: [Objeto]
} deriving Show

dave = Barbaro { 
  nombre = "Dave", 
  fuerza =  100,
  habilidades = ["tejer","escribirPoesia"], 
  objetos = [ardilla, libroPedking]
}



--1. Las espadas aumentan la fuerza de los bárbaros en 2 unidades por cada kilogramo de peso.

espadasAumentanDePeso :: Integer-> Objeto
espadasAumentanDePeso peso barbaro = barbaro { fuerza = fuerza barbaro + peso * 2 }

--2. Los amuletosMisticos puerco-marranos otorgan una habilidad dada a un bárbaro.
amuletosMisticos:: [Habilidad] -> Objeto
amuletosMisticos habilidad barbaro = barbaro {habilidades = habilidades barbaro ++ habilidad}
--3. Las varitasDefectuosas , añaden la habilidad de hacer magia, pero desaparecen todos los demás objetos del bárbaro.
---varitasDefectuosas ::  Objeto
---varitasDefectuosas  barbaro =   (amuletosMisticos ["Hacer Magia"] barbaro) {objetos = [] }


--4. Una ardilla , que no hace nada.
ardilla :: Objeto
ardilla barbaro = barbaro

--5. Una cuerda , que combina dos objetos distintos, obteniendo uno que realiza las transformaciones de los otros dos.

cuerda:: Objeto -> Objeto -> Barbaro -> Barbaro
cuerda objeto1 objeto2 = objeto1.objeto2 




