<%@ page import="khronosun.ItemRating" %>

${average}
<richui:rating dynamic="true" units="5" showCurrent="false" id="${itemInstance?.id}" rating="${average}"  controller="ItemComment" action="saveRate"/>