
package EditProductWS;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.ws.Action;
import javax.xml.ws.FaultAction;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;


/**
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.2.11-b150120.1832
 * Generated source version: 2.2
 * 
 */
@WebService(name = "EditProductWS", targetNamespace = "http://EditProductModel/")
@XmlSeeAlso({
    ObjectFactory.class
})
public interface EditProductWS {


    /**
     * 
     * @param imgName
     * @param imgByte
     * @param productId
     * @param price
     * @param description
     * @param accessToken
     * @param productName
     * @return
     *     returns int
     * @throws IOException_Exception
     * @throws ParseException_Exception
     * @throws ProtocolException_Exception
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "editProduct", targetNamespace = "http://EditProductModel/", className = "EditProductWS.EditProduct")
    @ResponseWrapper(localName = "editProductResponse", targetNamespace = "http://EditProductModel/", className = "EditProductWS.EditProductResponse")
    @Action(input = "http://EditProductModel/EditProductWS/editProductRequest", output = "http://EditProductModel/EditProductWS/editProductResponse", fault = {
        @FaultAction(className = ProtocolException_Exception.class, value = "http://EditProductModel/EditProductWS/editProduct/Fault/ProtocolException"),
        @FaultAction(className = IOException_Exception.class, value = "http://EditProductModel/EditProductWS/editProduct/Fault/IOException"),
        @FaultAction(className = ParseException_Exception.class, value = "http://EditProductModel/EditProductWS/editProduct/Fault/ParseException")
    })
    public int editProduct(
        @WebParam(name = "access_token", targetNamespace = "")
        String accessToken,
        @WebParam(name = "product_id", targetNamespace = "")
        String productId,
        @WebParam(name = "product_name", targetNamespace = "")
        String productName,
        @WebParam(name = "description", targetNamespace = "")
        String description,
        @WebParam(name = "price", targetNamespace = "")
        String price,
        @WebParam(name = "img_name", targetNamespace = "")
        String imgName,
        @WebParam(name = "img_byte", targetNamespace = "")
        byte[] imgByte)
        throws IOException_Exception, ParseException_Exception, ProtocolException_Exception
    ;

    /**
     * 
     * @param productId
     * @param accessToken
     * @return
     *     returns java.lang.String
     * @throws IOException_Exception
     * @throws ParseException_Exception
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "setCurrentProduct", targetNamespace = "http://EditProductModel/", className = "EditProductWS.SetCurrentProduct")
    @ResponseWrapper(localName = "setCurrentProductResponse", targetNamespace = "http://EditProductModel/", className = "EditProductWS.SetCurrentProductResponse")
    @Action(input = "http://EditProductModel/EditProductWS/setCurrentProductRequest", output = "http://EditProductModel/EditProductWS/setCurrentProductResponse", fault = {
        @FaultAction(className = IOException_Exception.class, value = "http://EditProductModel/EditProductWS/setCurrentProduct/Fault/IOException"),
        @FaultAction(className = ParseException_Exception.class, value = "http://EditProductModel/EditProductWS/setCurrentProduct/Fault/ParseException")
    })
    public String setCurrentProduct(
        @WebParam(name = "access_token", targetNamespace = "")
        String accessToken,
        @WebParam(name = "product_id", targetNamespace = "")
        String productId)
        throws IOException_Exception, ParseException_Exception
    ;

    /**
     * 
     * @param accessToken
     * @return
     *     returns java.lang.String
     * @throws IOException_Exception
     * @throws ParseException_Exception
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "validasiTokenEdit", targetNamespace = "http://EditProductModel/", className = "EditProductWS.ValidasiTokenEdit")
    @ResponseWrapper(localName = "validasiTokenEditResponse", targetNamespace = "http://EditProductModel/", className = "EditProductWS.ValidasiTokenEditResponse")
    @Action(input = "http://EditProductModel/EditProductWS/validasiTokenEditRequest", output = "http://EditProductModel/EditProductWS/validasiTokenEditResponse", fault = {
        @FaultAction(className = IOException_Exception.class, value = "http://EditProductModel/EditProductWS/validasiTokenEdit/Fault/IOException"),
        @FaultAction(className = ParseException_Exception.class, value = "http://EditProductModel/EditProductWS/validasiTokenEdit/Fault/ParseException")
    })
    public String validasiTokenEdit(
        @WebParam(name = "access_token", targetNamespace = "")
        String accessToken)
        throws IOException_Exception, ParseException_Exception
    ;

}
