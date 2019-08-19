/**
 * 
 */
package com.fdzc.gd.familyhotel.config;

/**
 * @author Miracle_Q
 *
 */
public class VersionInfo {

    //application info
    public final static String APP_NAME="家庭旅馆管理系统";
    public final static String APP_VERSION="1.0";
    public final static String APP_STATUS="Beta";
    public final static String APP_BUILDATE="2018-11-11";
    public final static String APP_BUILDVER="#1";

    //application author
    public final static String APP_AUTHOR="2015级软件工程一班_张乾";
    public final static String APP_WORKSTUDIO="毕业设计";

    public final static String buildFooterStr()
    {
        StringBuffer sb=new StringBuffer();

        sb.append(APP_NAME);
        sb.append(" "+"(版本:"+APP_STATUS+APP_VERSION);
        sb.append(" &nbsp;&nbsp;Build:"+APP_BUILDVER);
        sb.append(" "+APP_BUILDATE+")");
        sb.append("&nbsp;&nbsp;&nbsp;&nbsp;开发者:&nbsp;"+APP_AUTHOR+"</a><br/>");
        sb.append("(C)&nbsp;"+APP_WORKSTUDIO+"&nbsp;&nbsp;");

        return sb.toString();
    }

}
