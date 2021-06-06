//
//  EntrenamientosResponseModel.swift
//  CiceSports
//
//  Created by cice on 03/06/2021.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let entrenamientoResponseModel = try? newJSONDecoder().decode(EntrenamientoResponseModel.self, from: jsonData)

import Foundation

// MARK: - EntrenamientoResponseModel
struct EntrenamientoResponseModel: Codable {
    let localPlist: LocalPlist?

    enum CodingKeys: String, CodingKey {
        case localPlist = "localPlist"
    }
}

// MARK: - LocalPlist
struct LocalPlist: Codable {
    let arrayDiccionariosNivel1: [ArrayDiccionariosNivel]?
    let arrayDiccionariosNivel2: [ArrayDiccionariosNivel]?
    let arrayDiccionariosNivel3: [ArrayDiccionariosNivel]?
    let arrayDiccionariosNivel4: [ArrayDiccionariosNivel]?

    enum CodingKeys: String, CodingKey {
        case arrayDiccionariosNivel1 = "arrayDiccionariosNivel1"
        case arrayDiccionariosNivel2 = "arrayDiccionariosNivel2"
        case arrayDiccionariosNivel3 = "arrayDiccionariosNivel3"
        case arrayDiccionariosNivel4 = "arrayDiccionariosNivel4"
    }
}

// MARK: - ArrayDiccionariosNivel
struct ArrayDiccionariosNivel: Codable {
    let tituloEjercicio: String?
    let descripcionEjercicio: String?
    let imagenEjercicio: String?
    let arrayEjerciciosResponse: [String]?

    enum CodingKeys: String, CodingKey {
        case tituloEjercicio = "tituloEjercicio"
        case descripcionEjercicio = "descripcionEjercicio"
        case imagenEjercicio = "imagenEjercicio"
        case arrayEjerciciosResponse = "arrayEjerciciosResponse"
    }
}
