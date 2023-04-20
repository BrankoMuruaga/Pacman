import wollok.game.*
object pacman {
	var vidas = 3
	var property image = "pacman.png"
	var property position = game.origin()
	
	method vidas() = vidas
	
	method perderVida() {
		vidas--
		position = game.origin()	
	}
	
	method chocarCon(elemento){
		self.perderVida()
		elemento.position(game.center())
		
	}
}

object fantasma{
	var property image = "rival1.png"
	var property position = game.at(3, 7)
	
	method valorDeX(elemento){
		if(elemento.position().x() > position.x()) {
			return 1
		} 
		else if (elemento.position().x() == position.x()){
			return 0
		}
		else{
			return -1
		}
	}
	
	method valorDeY(elemento){
		if(elemento.position().y() > position.y()) {
			return 1
		} 
		else if (elemento.position().y() == position.y()){
			return 0
		}
		else{
			return -1
		}
	}
	
	method acercarseA(elemento){
		var nuevaX = position.x() + self.valorDeX(elemento)
		var nuevaY = position.y() + self.valorDeY(elemento)
		
		position = game.at(nuevaX, nuevaY)
		
	}
}
