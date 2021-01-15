import UIKit

// Entidad Usuario
class User {
    private let name: String
    private let lastName: String
    private let age: Int
    private let adress: Adress

// Inicialización de atributos, clase Usuario
    init(name: String, lastName: String, age: Int, adress: Adress) {
        self.name = name
        self.lastName = lastName
        self.age = age
        self.adress = adress
    }

// Definición de los getters de los atributos de Usuario
    func getName() -> String {
        return name
    }
    func getLastName() -> String {
        return lastName
    }
    func getAge() -> Int {
        return age
    }
    func getAdress() -> Adress {
        return adress
    }
}

// Entidad Place de tipo struct
struct Place {
    let placeName: String
    let landmark: [Landmark]?
    
    func getPlaceName() -> String{
        return placeName
    }
    func getLandmark() -> [Landmark]{
        return landmark!
    }
}

// Entidad Landmark de tipo struct
struct Landmark {
    let attractionName: String
    let typeOfLandmark: String
    let description: String
    let ubication: Adress?
    
    func getAttractionName() -> String{
        return attractionName
    }
}

// Entidad Direccion de tipo struct
struct Adress {
    let city: String
    let street: String?
    let number: String?
    let apartment: String?
    let floor: String?
}

// Instancia del primer objeto 'User' y su 'Adress' de tipo struct
let userAle = User(name: "Alejandro",
                lastName: "Castillo",
                age: 23,
                adress: Adress(
                   city: "Ituzaingó",
                   street: "Agustín Camerucci",
                   number: "1544",
                   apartment: nil,
                   floor: nil
    )
)

// Declaracion de variables de tipo 'Place' y agregación de objetos de tipo 'Landmark' a su 'Place' determinado
var placeA = Place(placeName: "Argentina", landmark:
        [Landmark(attractionName: "Las Cataratas del Iguazú", typeOfLandmark: "Natural", description: "Aquí va una descripción",
                  ubication: Adress(
                    city: "Misiones",
                    street: nil,
                    number: nil,
                    apartment: nil,
                    floor: nil
        )),
        Landmark(attractionName: "La Casa Rosada", typeOfLandmark: "Cultural", description: "Aquí va una descripción",
                 ubication: Adress(
                    city: "Ciudad Autónoma de Buenos Aires",
                    street: "Balcarce",
                    number: "50",
                    apartment: nil,
                    floor: nil
        ))])

var placeF = Place(placeName: "Francia", landmark: [
    Landmark(attractionName: "Torre Eiffel", typeOfLandmark: "Torre de observación y radiodifusión", description: "Aquí va una breve descripción",
             ubication: Adress(
                city: "París",
                street: "Campo de Marte y avenue Anatole-France",
                number: "Nº 5, 75007",
                apartment: nil,
                floor: nil
    )),
    Landmark(attractionName: "Museo del Louvre", typeOfLandmark: "Museo de arte público", description: "Aquí va una breve descripción",
             ubication: Adress(
                city: "París",
                street: "Palais Royal, Musée du Louvre",
                number: "75001, París",
                apartment: nil,
                floor: nil))
    ])

func addFavoritePlace(user usuario: User, place value: String, from place: [Place]) -> [String] {
    
    var placesFav: [String] = []
    for _ in place {
        if value ==  placeF.getPlaceName(){
            placesFav.append(value)
        } else { break }
    }; return placesFav
}

func addFavoriteLandmark(user usuario: User, landmark value: String, from place: [Place]) -> [String] {
    
    var landmarkFav: [String] = []
    let newValue = true
    
    for _ in place {
        if newValue ==  placeF.getLandmark().description.contains(value) {
            landmarkFav.append(value)
        } else { break }
    }; return landmarkFav
}

addFavoritePlace(user: userAle, place: "Francia", from: [placeF])
addFavoriteLandmark(user: userAle, landmark: "Museo del Louvre", from: [placeF])
addFavoriteLandmark(user: userAle, landmark: "Torre Eiffel", from: [placeF])
