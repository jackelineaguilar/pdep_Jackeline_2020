--GP: Ahora que vimos listas podes hacer algo así

---esVocal caracter = elem caracter "aeiouAEIOU" --ok
esVocal  = flip elem "aeiouAEIOU" 

---esVocal c = c =='a'|| c == 'e' || c == 'i' || c == 'o'|| c == 'u'

productoCorriente :: String -> Bool
productoCorriente   = esVocal . head 

productoXL :: String -> String
productoXL = (++ "XL") 
---(un operador con uno de sus operandos se transforma en función sí y sólo sí, se encierra a ambos entre paréntesis

productoCodiciado :: String -> Bool
-- GP: Fijate que esto se puede modelar con composición porque el resultado de una operacion
-- es la entrada de la otra.
---- productoCodiciado nombre = length nombre > 10
productoCodiciado   = (>10) . length   --ok

productoDeLujo :: String -> Bool
productoDeLujo nombre = elem 'x' nombre || elem 'z' nombre --ok

productoDeElite :: String -> Bool
productoDeElite nombre = productoDeLujo nombre && productoCodiciado nombre && (not.productoCorriente) nombre --ok
--es mejor: productoElite nombre = productoDeLujo nombre && productoCodiciado nombre && (not.productoCorriente) nombr

-- GP: Acá no es necesario las guardas, porque en el caso de que tengas menos letras
-- take/1 no rompe, sino que te da las que puede conseguir.
descodiciarProducto :: String ->  String
descodiciarProducto  = take 10   

entregaSencilla :: String -> Bool
entregaSencilla  = even . length

-- GP: en la biblioteca base de haskell ya existe una operacion que te dice si un numero es par o no.

versionBarata :: String -> String 
versionBarata = reverse. descodiciarProducto

aplicarCostoDeEnvio :: (Num a)=> a -> a -> a ----aplicarCostoDeEnvio :: Float -> Float -> Float
aplicarCostoDeEnvio    =  (+)

aplicarDescuento :: (Num a)=> a -> a -> a
aplicarDescuento descuento precio = flip (-) descuento precio --con aplicación parcial, currificada


precioTotal:: (Num a)=> a -> a -> a ->a ->a
---precioTotal precioProducto cantidad  =( cantidad * precioProducto) 
precioTotal precioUnitario cantidad descuento costoDeEnvio = (aplicarCostoDeEnvio costoDeEnvio . (cantidad *) . aplicarDescuento descuento ) precioUnitario

-- take:: Int-> String ->String
---drop:: Int-> String ->String
--head:: String->Char
--elem:: Char ->String-> Bool
---reverse :: String->String


