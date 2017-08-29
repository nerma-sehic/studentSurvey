package studentSurvey

import org.codehaus.groovy.grails.web.util.WebUtils

import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpSession


class SecurityUtil {


    /**
     * Get loggedin username
     * @return string username
     */
    public static String getLoggedInUser(){
        HttpServletRequest request = WebUtils.retrieveGrailsWebRequest().currentRequest
        HttpSession session = request.session
        return (session.getAttribute(Constants.ATTR_USERNAME))
//        return ""
    }
}
