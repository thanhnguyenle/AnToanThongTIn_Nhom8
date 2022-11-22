<%--
  Created by IntelliJ IDEA.
  User: NLTHANH
  Date: 6/6/2022
  Time: 9:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.controller.web.Asset" %>
<%@ include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--this order is strict--%>
<script src="<%= Asset.url("/template/admin/js/jquery-1.10.2.js")%>"></script>
<script src="<%= Asset.url("/template/admin/js/bootstrap.min.js")%>"></script>
<script src="<%= Asset.url("/template/admin/js/plugins/metisMenu/jquery.metisMenu.js")%>"></script>
<script src="<%= Asset.url("/template/admin/js/sb-admin.js")%>"></script>

<script src="<%= Asset.url("/template/admin/js/plugins/dataTables/jquery.dataTables.js")%>"></script>
<script src="<%= Asset.url("/template/admin/js/plugins/dataTables/dataTables.bootstrap.js")%>"></script>

<script>
    //AJAX read file json -> generate list province, district, ward
    $(document).ready(function () {
        const xmlhttp = new XMLHttpRequest();
        const url = "https://provinces.open-api.vn/api/?depth=3";
        var myArrProvince;
        var myArrDistrict;
        var myArrWard;

        xmlhttp.onreadystatechange = function () {
            //4 DONE : thao tac hoan tat
            //200 OK, 403 Forbidden, 404 Page not found
            if (this.readyState == 4 && this.status == 200) {
                myArrProvince = JSON.parse(this.responseText);
                addOption(myArrProvince,'#province');
            }
        };
        xmlhttp.open("GET", url, true);
        xmlhttp.send();

        function addOption(arr,id) {
            for (let i = 0; i < arr.length; i++) {
                let optionText = arr[i].name;
                $(id).append('<option value=\"'+optionText+'\">'+ optionText+'</option>');
            }
        }

        $('#province').on('change',function (e){
            //delete all selected of select
        }).on('change',function (e){
            let optionSelected = $("option:selected", this);
            let valueSelected = optionSelected.val();
            for(let i = 0;i<myArrProvince.length;i++){
                let optionValue = myArrProvince[i].name;
                //use "==" is exactly, dont change plz
                if(optionValue==valueSelected){
                    myArrDistrict = myArrProvince[i].districts;
                    break;
                }
            }
            let listdistrict = myArrDistrict;
            $('#district').empty();
            for (let j = 0; j < listdistrict.length; j++) {
                let optionText = listdistrict[j].name;
                $('#district').append('<option value=\"'+optionText+'\">'+ optionText+'</option>');
            }
        });

        $('#district').on('change',function (e) {
        }).on('change',function (e){
            let optionSelected = $("option:selected", this);
            let valueSelected = optionSelected.val();
            for(let i = 0;i<myArrDistrict.length;i++){
                let optionText = myArrDistrict[i].name;
                if(optionText==valueSelected){
                    myArrWard = myArrDistrict[i].wards;
                    break;
                }
            }

            let listwards = myArrWard;
            $('#ward').empty();
            for (let j = 0; j < listwards.length; j++) {
                let optionText = listwards[j].name;
                $('#ward').append('<option value=\"'+optionText+'\">'+ optionText+'</option>');
            }
        });
    });
</script>