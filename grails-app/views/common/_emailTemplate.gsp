<table cellspacing="0" cellpadding="4" border="0" style="width:100%; font-family:'Open Sans','Helvetica',Arial,sans-serif; color: #333; font-size:11px;">

    <tr>
        <td style="font-size: 14px; color:#333; padding-bottom:10px;">${mailBody.date}</td>
    </tr>

    <tr>
        <td style="font-size: 14px;">
            <g:if test="${mailBody.bodyTextHtml == null}">There is no content.</g:if>
            <g:else>${raw(mailBody.bodyTextHtml)}</g:else>
        </td>
    </tr>


    <tr style="background-color:#eaeaea;margin-bottom:10px;">
        <td>Created/Uploaded by: <b>${mailBody.byUser}</b></td>
    </tr>


</table>