package studentSurvey

import grails.util.Metadata

class Constants {

    public static final String APP_NAME = Metadata.getCurrent().getApplicationName()        //StudentSurvey
    public static final String APP_VERSION = Metadata.getCurrent().getApplicationVersion() // e.g. v.0.5
    public static final int SESSION_TIMEOUT_SEC = 28800;                                    //8 hours

    public static final String ATTR_USERNAME = APP_NAME + '-v.' + APP_VERSION + '-username'
    public static final String ATTR_ROLE = APP_NAME + "-role"
    public static final String ATTR_RETURN_TO = APP_NAME + '-v.' + APP_VERSION + '-returnTo'

}
