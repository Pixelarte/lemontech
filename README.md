# Prueba LemonTech

# Programación

## 1.Escriba una función/método que determine la cantidad de 0’s a la derecha de n! (factorial)

```
var n=0;
var totalFactorial=100;
for(var i=1; i<=totalFactorial; i++){
	n=i;
	for(var j=i-1; j>0; j--){
		n=n*j
	}
	var total = (String(n).match(/0/g) || []).length;
	console.log(i+"! = "+n+" / total 0's "+total);
}

```

## 2.Escriba una función/método que dado un número entero, entregue su representación en palabras, Ej. 145 > “ciento cuarenta y cinco”

```
var entero=999; // aca se modifica el numero de 0 a 999
var unidad=["cero","uno","dos","tres","cuatro","cinto","seis","siete","ocho","nueve"];
var decenaCompleja=["dies","once","doce","trece","catorce","quince","dieciséis","diecisiete","dieciocho","diecinueve"];
var decena=["","","veinti","treinta","cuarenta","cincuenta","sesenta","setenta","ochenta","noventa"];
var centenaCompleja=["","ciento","doscientos","trescientos","cuantrocientos","quinientos","seiscientos","setecientos","ochocientos","novecientos"];

string=String(entero).split("");

if(string.length==1){
	console.log(unidad[entero]);
}else if(string.length==2){
	if(entero<20){
		console.log(decenaCompleja[Number(String(entero).slice(-1))]);
	}else if(entero<100){
		if(string[0]==2 && string[1]==0){
			console.log("veinte");
		}else if(string[0]==2 && string[1]>0){
			console.log(decena[Number(string[0])]+unidad[Number(string[1])]);
		}else if(string[1]==0){
			console.log(decena[Number(string[0])]);
		}else{
			console.log(decena[Number(string[0])]+" y "+unidad[Number(string[1])]);
		}
	}

}else if(string.length==3){
	if(string[1]==0 && string[2]==0){
		if(string[0]==1){
			console.log("cien");
		}else{
			console.log(centenaCompleja[Number(string[0])]);
		}
	}else if(string[1]==0 && string[2]<=9){
		console.log(centenaCompleja[Number(string[0])]+" "+unidad[Number(string[2])]);
	}else if(string[1]==1 && string[2]<=9){
		console.log(centenaCompleja[Number(string[0])]+" "+decenaCompleja[Number(String(entero).slice(-1))]);
	}else if(string[1]==2 && string[2]==0){
		console.log(centenaCompleja[Number(string[0])]+" "+"veinte");
	}else if(string[1]>=2 && string[2]==0){
		console.log(centenaCompleja[Number(string[0])]+" "+decena[Number(string[1])]);
	}else if(string[1]>=2 && string[2]>=0){
		console.log(centenaCompleja[Number(string[0])]+" "+decena[Number(string[1])]+" y "+unidad[Number(string[2])]);
	}
}

```

## 3.Considere un tablero de ajedrez de NxN, realice un algoritmo que visite cada espacio del tablero, usando solamente los movimientos de un caballo. (Puntos extras si se visita cada espacio una sola vez)

```

var x=5; //tablero ancho
var y=5; //tablero alto
var tablero=[];
var caballo=0;
var pasos=0;
var jugada=true;
var tiempo;

// punto de partida caballo
var positionX=random(0,x);
var positionY=random(0,y);
console.log("punto de partida y"+positionY+" , x"+positionX);

// movimientos de la pieza
tiempo=setInterval(movimientos,1000);

function movimientos(){
		armarTablero();	
		tablero[positionY][positionX]=caballo;

		var temp=random(1,4);

		switch(temp){
			case 1: //movimiento hacia arriba
				if(positionY-2>0){
					var positionTemp;
					pasos=0;
					for(var i=positionY; i>=positionY-2; i--){
						tablero[i][positionX]=pasos++;
						positionTemp=i;
					}
					positionY=positionTemp;
					if(positionX+1<x){
						tablero[positionY][positionX+1]=pasos++;
						positionX++;
					}else if(positionX-1>0){
						tablero[positionY][positionX-1]=pasos++;
						positionX--;
					}
					printTablero();
				}
			break;		

			case 2: //movimiento hacia abajo
				if(positionY+2<y){
					var positionTemp;
					pasos=0;
					for(var i=positionY; i<=positionY+2; i++){
						tablero[i][positionX]=pasos++;
						positionTemp=i;
					}
					positionY=positionTemp;
					if(positionX+1<x){
						tablero[positionY][positionX+1]=pasos++;
						positionX++;
					}else if(positionX-1>0){
						tablero[positionY][positionX-1]=pasos++;
						positionX--;
					}
					printTablero();
				}
			break;	

			case 3: //movimiento hacia derecha
				if(positionX+2<x){
					var positionTemp;
					pasos=0;
					for(var i=positionX; i<=positionX+2; i++){
						tablero[positionY][i]=pasos++;
						positionTemp=i;
					}
					positionX=positionTemp;
					if(positionY+1<y){
						tablero[positionY+1][positionX]=pasos++;
						positionY++;
					}else if(positionY-1>0){
						tablero[positionY-1][positionX]=pasos++;
						positionY--;
					}
					printTablero();
				}
			break;	

			case 4: //movimiento hacia izquierda
				if(positionX-2>0){
					var positionTemp;
					pasos=0;
					for(var i=positionX; i>=positionX-2; i--){
						tablero[positionY][i]=pasos++;
						positionTemp=i;
					}
					positionX=positionTemp;
					if(positionY+1<y){
						tablero[positionY+1][positionX]=pasos++;
						positionY++;
					}else if(positionY-1>0){
						tablero[positionY-1][positionX]=pasos++;
						positionY--;
					}
					printTablero();
				}
			break;	
		}
}

// random para generar aleatoriedad
function random(min,max){
	return Math.floor(Math.random()*(max-min+1)+min);
}

// se arma un arrelo bidimensional
function armarTablero(){
	for(var i=0; i<y; i++){
		tablero[i]=new Array();
		for(var j=0; j<x; j++){
			tablero[i][j]='';
		}
	}
}

// se despliega la simulacion del tablero en la consola del browser.
function printTablero(){
	console.clear();
	for(var i=0;i<y;i++){
		console.log(tablero[i]);
	}
}

```

# Modelo de datos

## 1.Un colegio necesita un sistema para administrar sus cursos. El sistema tiene que suportar que se le ingresen varios cursos. Cada curso tendrá un profesor a cargo y una serie de alumnos inscritos. Cada profesor, así como cada alumno puede estar en más de un curso. Además cada curso tendrá una cantidad no determinada de pruebas, y el sistema debe permitir ingresar la nota para cada alumno en cada prueba. Todas las pruebas valen lo  ismo. Escriba a continuación las tablas que utilizaría para resolver este problema con los campos y llaves de éstas. Intente hacer el sistema lo más robusto posible, pero sin incluir datos adicionales a los que se plantean acá.

```
-- Volcando estructura de base de datos para colegio
CREATE DATABASE IF NOT EXISTS `colegio` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `colegio`;


-- Volcando estructura para tabla colegio.alumnos
CREATE TABLE IF NOT EXISTS `alumnos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT '0',
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla colegio.alumnos: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
INSERT INTO `alumnos` (`id`, `nombre`, `fecha`) VALUES
	(1, 'Alex Cornejo', '2017-02-27 14:33:02'),
	(2, 'Lucas Hurtado', '2017-02-27 14:33:02'),
	(3, 'Silvana Torti', '2017-02-27 14:33:02');
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;


-- Volcando estructura para tabla colegio.asignacion_cursos_alumnos
CREATE TABLE IF NOT EXISTS `asignacion_cursos_alumnos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idAlumno` int(11) DEFAULT '0',
  `idCurso` int(11) DEFAULT '0',
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla colegio.asignacion_cursos_alumnos: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `asignacion_cursos_alumnos` DISABLE KEYS */;
INSERT INTO `asignacion_cursos_alumnos` (`id`, `idAlumno`, `idCurso`, `fecha`) VALUES
	(1, 1, 1, '2017-02-27 14:32:48'),
	(2, 1, 2, '2017-02-27 14:32:48'),
	(3, 3, 1, '2017-02-27 14:32:48'),
	(4, 2, 1, '2017-02-27 14:32:48'),
	(5, 2, 2, '2017-02-27 14:32:48'),
	(6, 3, 2, '2017-02-27 14:32:48'),
	(7, 1, 3, '2017-02-27 14:32:48');
/*!40000 ALTER TABLE `asignacion_cursos_alumnos` ENABLE KEYS */;


-- Volcando estructura para tabla colegio.asignacion_cursos_profesores
CREATE TABLE IF NOT EXISTS `asignacion_cursos_profesores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idProfesor` int(11) DEFAULT '0',
  `idCurso` int(11) DEFAULT '0',
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla colegio.asignacion_cursos_profesores: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `asignacion_cursos_profesores` DISABLE KEYS */;
INSERT INTO `asignacion_cursos_profesores` (`id`, `idProfesor`, `idCurso`, `fecha`) VALUES
	(1, 1, 1, '2017-02-27 14:32:35'),
	(2, 2, 2, '2017-02-27 14:32:35'),
	(3, 1, 3, '2017-02-27 14:32:35');
/*!40000 ALTER TABLE `asignacion_cursos_profesores` ENABLE KEYS */;


-- Volcando estructura para tabla colegio.cursos
CREATE TABLE IF NOT EXISTS `cursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT '0',
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla colegio.cursos: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` (`id`, `nombre`, `fecha`) VALUES
	(1, 'programacion', '2017-02-27 14:32:13'),
	(2, 'ingles', '2017-02-27 14:32:13'),
	(3, 'matematicas', '2017-02-27 14:32:13');
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;


-- Volcando estructura para tabla colegio.notas
CREATE TABLE IF NOT EXISTS `notas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nota` int(11) NOT NULL DEFAULT '0',
  `idAlumno` int(11) NOT NULL DEFAULT '0',
  `idPrueba` int(11) NOT NULL DEFAULT '0',
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla colegio.notas: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
INSERT INTO `notas` (`id`, `nota`, `idAlumno`, `idPrueba`, `fecha`) VALUES
	(1, 3, 1, 1, '2017-02-27 14:30:27'),
	(2, 5, 1, 2, '2017-02-27 14:30:27'),
	(3, 7, 3, 1, '2017-02-27 14:30:27'),
	(4, 1, 3, 2, '2017-02-27 14:30:27'),
	(5, 6, 2, 1, '2017-02-27 14:30:27'),
	(6, 7, 2, 2, '2017-02-27 14:30:27'),
	(7, 1, 1, 3, '2017-02-27 14:30:27'),
	(8, 2, 1, 4, '2017-02-27 15:00:51'),
	(9, 7, 1, 5, '2017-02-27 15:02:23');
/*!40000 ALTER TABLE `notas` ENABLE KEYS */;


-- Volcando estructura para tabla colegio.profesores
CREATE TABLE IF NOT EXISTS `profesores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT '0',
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla colegio.profesores: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `profesores` DISABLE KEYS */;
INSERT INTO `profesores` (`id`, `nombre`, `fecha`) VALUES
	(1, 'Fernando Escaffi', '2017-02-27 14:29:41'),
	(2, 'Paula Muñoz', '2017-02-27 14:29:41');
/*!40000 ALTER TABLE `profesores` ENABLE KEYS */;


-- Volcando estructura para tabla colegio.pruebas
CREATE TABLE IF NOT EXISTS `pruebas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL DEFAULT '0',
  `idCurso` int(11) NOT NULL DEFAULT '0',
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla colegio.pruebas: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `pruebas` DISABLE KEYS */;
INSERT INTO `pruebas` (`id`, `nombre`, `idCurso`, `fecha`) VALUES
	(1, 'Prueba programacion', 1, '2017-02-27 14:29:07'),
	(2, 'Verbos', 2, '2017-02-27 14:29:07'),
	(3, 'Matematica aplicada', 3, '2017-02-27 14:33:45'),
	(4, 'Fisica', 1, '2017-02-27 15:00:02'),
	(5, 'Morfologia', 1, '2017-02-27 15:00:33');
/*!40000 ALTER TABLE `pruebas` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

```

## 2.Escriba un Query que entregue la lista de alumnos para el curso “programación”.

```
select * from `alumnos` where `id` IN(select `idAlumno` from `asignacion_cursos_alumnos` where `idCurso`=(select `id` from `cursos` where `nombre`="programacion"))

```

## 3.Escriba un Query que calcule el promedio de notas de un alumno en un curso.

```
select * from `notas` where `idAlumno`=1 and `idPrueba` IN(select id from `pruebas` where `idCurso`=1)

```

## 4.Escriba un Query que entregue a los alumnos y el promedio que tiene en cada ramo.

```
select alumnos.nombre,notas.nota, pruebas.nombre,cursos.nombre  from notas inner join pruebas on notas.idPrueba= pruebas.id inner join cursos on pruebas.idCurso=cursos.id inner join alumnos on notas.idAlumno=alumnos.id

```

## 5.Escrib un Query que lista a todos los alumnos con más de un ramo con promedio rojo.

```
select alumnos.nombre from notas inner join alumnos on alumnos.id=notas.idAlumno where nota<4 HAVING COUNT(*) > 1

```

## 6.Se tiene una tabla con información de jugadores de tenis: PLAYERS(Nombre, Pais, Ranking). Suponga que Ranking es un número de 1 a 100 que es distinto para cada jugador. Si la tabla en un momento dado tiene solo 20 tuplas, indique cuantas tuplas tiene la tabla que resulta de la siguiente consulta:

```
190

```

# Diseño

## 1.Si usted estuviera resolviendo el problema del colegio con programación orientada a objetos, defina que clases usaría, métodos y la variables de estas clases. Puede utilizar el lenguaje que más le acomode o bien pseudos código.

```
class alumno{
	this.nombre;
	this.edad;
	this.sexo;
}
class profesore{
	this.nombre;
	this.edad;
	this.sexo;
	this.expertice;
}
class curso{
	this.nombre;
	this.capacidad;
	this.dificultad;
}
class pruebas{
	this.nombre;
	this.curso;
	this.dificultad;
}

```

## 2.Diseñe un mazo de cartas (orientado a objetos) con propiedades y métodos básicos que considere para ser utilizado en distintas aplicaciones que utilicen cartas.

```
class carta{
	this.nombre;
	this.propiedad;
	this.figura;
}
class mazo{
	this.cantidad;
	this.cartas=new carta();
}

```

## 3. Diseño código frontend

```
var citas = {
"lunes": [
{"nombre": "Daniel", "hora_inicio": "08:00", "hora_termino": "09:00"},
{"nombre": "Daniel", "hora_inicio": "09:30", "hora_termino": "11:00"},
{"nombre": "Daniel", "hora_inicio": "15:00", "hora_termino": "16:00"},
{"nombre": "Daniel", "hora_inicio": "17:00", "hora_termino": "19:30"}
],
"martes": [
{"nombre": "Daniel", "hora_inicio": "08:00", "hora_termino": "09:00"},
{"nombre": "Daniel", "hora_inicio": "11:30", "hora_termino": "12:00"},
{"nombre": "Daniel", "hora_inicio": "15:00", "hora_termino": "16:00"},
{"nombre": "Daniel", "hora_inicio": "17:00", "hora_termino": "19:30"}
],
"miercoles": [
{"nombre": "Daniel", "hora_inicio": "08:00", "hora_termino": "09:00"},
{"nombre": "Daniel", "hora_inicio": "10:30", "hora_termino": "12:00"},
{"nombre": "Daniel", "hora_inicio": "15:00", "hora_termino": "16:00"},
{"nombre": "Daniel", "hora_inicio": "17:00", "hora_termino": "19:30"}
],
"jueves": [
{"nombre": "Daniel", "hora_inicio": "08:00", "hora_termino": "09:00"},
{"nombre": "Daniel", "hora_inicio": "09:30", "hora_termino": "12:00"},
{"nombre": "Daniel", "hora_inicio": "15:00", "hora_termino": "16:00"},
{"nombre": "Daniel", "hora_inicio": "17:00", "hora_termino": "19:30"}
],
"viernes": [
{"nombre": "Daniel", "hora_inicio": "08:00", "hora_termino": "09:00"},
{"nombre": "Daniel", "hora_inicio": "09:30", "hora_termino": "12:00"},
{"nombre": "Daniel", "hora_inicio": "15:00", "hora_termino": "16:00"},
{"nombre": "Daniel", "hora_inicio": "17:00", "hora_termino": "19:30"}
]
}

var dias=["lunes","martes","miercoles","jueves","viernes","sabado","domingo"]

$(document).ready(function() {

  $(document.body).append("<div id='contenedor'></div>");
  $("#contenedor").append("<div id='contDias' style='position:relative;left:36px'></div>");
  $("#contenedor").append("<div id='contHoras'></div>");

  	for(var i=0; i<7; i++){
		$("#contDias").append("<div id='dia"+dias[i]+"' style='display:inline-block;border:1px solid black; width:100px'>"+dias[i]+"</div>");
	}
	var cont=0;
	var hora=0;
	for(var i=0; i<48; i++){

		var minTemp;
		var hotaTemp;

		if(i % 2 == 0) {
			minTemp="00";	
		}else{
			minTemp="30";	
		}
		
		
		if(cont>1){
			cont=0;
			hora++;
		}

		if(hora<10){
			hotaTemp="0"+hora.toString();
		}else{
			hotaTemp=hora;
		}

		cont++;
		

		$("#contHoras").append("<div id='"+hotaTemp+minTemp+"' style='display:inline-block;width:800px'>"+hotaTemp+":"+minTemp+"</div></br>");
		for(var j=0; j<7; j++){
				$("#"+hotaTemp+minTemp+"").append("<div id='"+hotaTemp+minTemp+dias[j]+"' style='display:inline-block;border:1px solid black;width:100px;height:22px'></div>");
		}
	}


	$.each(citas,function(key,value){
		$.each(value,function(key2,value2){
				var temp=value2.hora_inicio.replace(":","");
				
				$("#"+temp+key+"").append("*");

				var temp=value2.hora_termino.replace(":","");
				$("#"+temp+key+"").append("*");
		})
		
	})
});

```