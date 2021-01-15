import UIKit

// Protocol con fin de que cada entidad pueda implementar la descripción de sus características
protocol Describir {
    func obtenerDescripcion() -> String
}
// Entidad Usuario
class User: Describir {
    
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
    func obtenerDescripcion() -> String {
        return("Name: \(self.getName()), Lastname: \(self.getLastName()), Age: \(self.getAge()), Adress: \(self.getAdress())")
    }
}

// Entidad Place de tipo struct
struct Place: Describir {
    
    let placeName: String
    let landmark: [Landmark]?
    
    func getPlaceName() -> String{
        return placeName
    }
    func getLandmark() -> [Landmark]{
        return landmark!
    }
    func obtenerDescripcion() -> String {
        return("Place Name: \(self.getPlaceName()), Landmarks: \(self.getLandmark())")
    }
}

// Entidad Landmark de tipo struct
struct Landmark: Describir {
    
    let attractionName: String
    let typeOfLandmark: String
    let description: String
    let ubication: Adress
    
    func getAttractionName() -> String {
        return attractionName
    }
    func getTypeOfLandmark() -> String {
        return typeOfLandmark
    }
    func getDescription() -> String {
        return description
    }
    func getUbication() -> Adress {
        return ubication
    }
    func obtenerDescripcion() -> String {
        return("Attraction name: \(self.getAttractionName()), Type of landmark: \(self.getTypeOfLandmark()), Description: \(self.getDescription()), and Ubication: \(self.getUbication())")
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

// Instancias de variables de tipo 'Place' y de sus objetos de tipo 'Landmark'
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

// Función que recibe un objeto usuario, una cadena de texto para 'buscar', y un array de tipo 'Place'
// Recorre el array que recibe por parámetro y compara si la cadena de texto que recibe es igual al nombre del place.
// Si coincide, el valor se agrega a un array auxiliar, de no ser así, se continúa con el próximo elemento
func addFavoritePlace(user usuario: User, place value: String, from place: [Place]) -> [String] {
    
    var placesFav: [String] = []
    for _ in place {
        if value ==  placeF.getPlaceName(){
            placesFav.append(value)
        } else { break }
    }; return placesFav
}

// Igual que el anterior, pero se compara el valor de la cadena de texto con el valor que contiene como 'landmark' el objeto 'place'
func addFavoriteLandmark(user usuario: User, attractionName value: String, from place: [Place]) -> [String] {
    
    var landmarkFav: [String] = []
    let newValue = true
    
    for _ in place {
        if newValue ==  placeF.getLandmark().description.contains(value) {
            landmarkFav.append(value)
        } else { break }
    }; return landmarkFav
}

addFavoritePlace(user: userAle, place: "Francia", from: [placeF])
addFavoriteLandmark(user: userAle, attractionName: "Museo del Louvre", from: [placeF])
addFavoriteLandmark(user: userAle, attractionName: "Torre Eiffel", from: [placeF])
userAle.obtenerDescripcion()
