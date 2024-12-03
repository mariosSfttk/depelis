//
//  Strings.swift
//  DePelis
//
//  Created by Mario Vargas on 09/11/24.
//

import Foundation


struct Strings {
    
    struct LoginScreen {
        static var userPlaceHolder: String {
            return "Usuario"
        }
        static var passwordPlaceHolder: String {
            return "Contraseña"
        }
        static var btnLogin: String {
            return "Entrar"
        }
        static var notRegistered: String {
            return "¿No estás registrado?"
        }
        static var createAccount: String {
            return "Crea una cuenta"
        }
    }
    
    struct WelcomeScreen {
        static var titleHeader: String {
            return "Hola "
        }
        static var searchText: String {
            return "Buscar pelicula"
        }
    }
    
    struct SettingsScreen {
        static var btnExit: String {
            return " Cerrar Sesión"
        }
        static var welcome: String {
            return "Bienvenido"
        }
        static var about: String {
            return "Acerca de"
        }
        static var tyc: String {
            return "Terminos y Condiciones"
        }
        static var questions: String {
            return "Preguntas frecuentes"
        }
    }
    
    struct Icons {
        static var backArrow: String {
            return "chevron.backward"
        }
        static var movieIcon: String {
            return "movieclapper"
        }
        static var exitIcon: String {
            return "door.left.hand.open"
        }
        static var personIcon: String {
            return "person"
        }
        static var heartIcon: String {
            return "heart.fill"
        }
        static var gearshapeIcon: String {
            return "gearshape"
        }
        static var gearshapefillIcon: String {
            return "gearshape.fill"
        }
        static var starIcon: String {
            return "star"
        }
        static var starfillIcon: String {
            return "star.fill"
        }
        static var houseIcon: String {
            return "house"
        }
        static var housefillIcon: String {
            return "house.fill"
        }
        static var trashIcon: String {
            return "trash"
        }
        static var magnifyingglassIcon: String {
            return "magnifyingglass"
        }
        static var loginLogo: String {
            return "iconLogin"
        }
    }
    
    struct General {
        static var EnterBackGround: String {
            return "applicationDidEnterBackground"
        }
        static var WillTerminate: String {
            return "applicationWillTerminate"
        }
        static var wrongMessage: String {
            return "Something went wrong"
        }
        static var invalidOp: String {
            return "Ivalid operation"
        }
        static var userInfo: String {
            return "userInfo"
        }
        static var usernameKey: String {
            return "username"
        }
        static var passKey: String {
            return "password"
        }
    }
    
    struct CoreData {
        static var modelName: String {
            return "DePelis"
        }
        static var entityName: String {
            return "Movies"
        }
    }
    
    struct TabBar {
        static var settingsTitle: String {
            return "Ajustes"
        }
        static var favoriteTitle: String {
            return "Favoritos"
        }
        static var initTitle: String {
            return "Inicio"
        }
    }
        
    struct DetailScreen {
        static var btnFavs: String {
            return " Agregar a favoritos"
        }
    }
    
    struct Server {
        static var methodPOST: String {
            return "POST"
        }
        static var appJson: String {
            return "application/json"
        }
        static var contentType: String {
            return "Content-Type"
        }
        static var accept: String {
            return "Accept"
        }
        static var requestToken: String {
            return "request_token"
        }
    }
    
    struct CustomAlert {
        static var cancel: String {
            return "Cancelar"
        }
        static var accept: String {
            return "Aceptar"
        }
        static var titleAlert: String {
            return "Title"
        }
        static var messageAlert: String {
            return "This is a message"
        }
    }
    
    struct RegisterScreen {
        static var titleHeader: String {
            return "Registro"
        }
        static var descriptionText: String {
            return "Para crear tu cuenta necesitamos que ingreses la información solicitada"
        }
        static var nameLabel: String {
            return "Nombre"
        }
        static var passLabel: String {
            return "Contraseña"
        }
        static var sendBtn: String {
            return "Enviar"
        }
        static var congrats: String {
            return "Felicidades"
        }
        static var successRegister: String {
            return "Tu registro ha sido exitoso"
        }
        
    }
    
}
