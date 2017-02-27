
package AddProductWS;

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
@WebService(name = "AddProductWS", targetNamespace = "http://AddProductModel/")
@XmlSeeAlso({
    ObjectFactory.class
})
public interface AddProductWS {


    /**
     * 
     * @param imgName
     * @param imgByte
     * @param price
     * @param description
     * @param accessToken
     * @param productName
     * @return
     *     returns int
     * @throws IOException_Exception
     * @throws ProtocolException_Exception
     * @throws ParseException_Exception
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "addProduct", targetNamespace = "http://AddProductModel/", className = "AddProductWS.AddProduct")
    @ResponseWrapper(localName = "addProductResponse", targetNamespace = "http://AddProductModel/", className = "AddProductWS.AddProductResponse")
    @Action(input = "http://AddProductModel/AddProductWS/addProductRequest", output = "http://AddProductModel/AddProductWS/addProductResponse", fault = {
        @FaultAction(className = ProtocolException_Exception.class, value = "http://AddProductModel/AddProductWS/addProduct/Fault/ProtocolException"),
        @FaultAction(className = IOException_Exception.class, value = "http://AddProductModel/AddProductWS/addProduct/Fault/IOException"),
        @FaultAction(className = ParseException_Exception.class, value = "http://AddProductModel/AddProductWS/addProduct/Fault/ParseException")
    })
    public int addProduct(
        @WebParam(name = "access_token", targetNamespace = "")
        String accessToken,
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

}
