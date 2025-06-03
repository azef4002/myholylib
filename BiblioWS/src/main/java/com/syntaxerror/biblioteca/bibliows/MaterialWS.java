/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/WebServices/WebService.java to edit this template
 */
package com.syntaxerror.biblioteca.bibliows;

import com.syntaxerror.biblioteca.business.MaterialBO;
import com.syntaxerror.biblioteca.model.MaterialDTO;
import com.syntaxerror.biblioteca.model.enums.NivelDeIngles;
import jakarta.xml.ws.WebServiceException;
import java.util.List;
import jakarta.jws.WebService;
import jakarta.jws.WebMethod;
import jakarta.jws.WebParam;
import java.util.ArrayList;

/**
 *
 * @author JL
 */
@WebService(serviceName = "MaterialWS")
public class MaterialWS {

    private final MaterialBO materialBO;
    
    public MaterialWS(){
        materialBO=new MaterialBO();
    }
    /**
     * This is a sample web service operation
     */
    @WebMethod(operationName = "listarTodos")
    public ArrayList<MaterialDTO> listarTodos() {
        try{
            return materialBO.listarTodos();
        } catch(Exception e){
            throw new WebServiceException("Error al listar"+e.getMessage());
        }
    }
    @WebMethod(operationName = "modificarMaterial")
    public int modificarMaterial(
        @WebParam(name = "idMaterial") Integer idMaterial,
        @WebParam(name = "titulo") String titulo,
        @WebParam(name = "edicion") String edicion,
        @WebParam(name = "nivel") NivelDeIngles nivel,
        @WebParam(name = "anioPublicacion") Integer anioPublicacion,
        @WebParam(name = "portada") String portada,
        @WebParam(name = "idEditorial") Integer idEditorial
    ) {
        try {
            return materialBO.modificar(idMaterial, titulo, edicion, nivel, anioPublicacion, portada, idEditorial);
        } catch (Exception e) {
            throw new WebServiceException("Error al modificar material: " + e.getMessage());
        }
    }
    @WebMethod(operationName = "eliminarMaterial")
    public int eliminarMaterial(@WebParam(name = "idMaterial") Integer idMaterial) {
        try {
            return materialBO.eliminar(idMaterial);
        } catch(Exception e){
            throw new WebServiceException("Error al eliminar material: " + e.getMessage());}
    }
}
