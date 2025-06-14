/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/WebServices/WebService.java to edit this template
 */
package com.syntaxerror.biblioteca.bibliows;

import com.syntaxerror.biblioteca.bibliobusiness.MaterialBO;
import com.syntaxerror.biblioteca.bibliomodelado.MaterialDTO;
import com.syntaxerror.biblioteca.bibliomodelado.enums.NivelDeIngles;
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
    @WebMethod(operationName = "hello")
    public ArrayList<MaterialDTO> sumar(@WebParam(name = "a") int a,@WebParam(name = "b") int b){
        ArrayList<MaterialDTO> numeros = new ArrayList<MaterialDTO>();
        MaterialBO material = new MaterialBO();
        MaterialDTO material2 =new MaterialDTO();
        material2=material.obtenerPorId(1);
        numeros.add(material2);
        return numeros;
    }
}
