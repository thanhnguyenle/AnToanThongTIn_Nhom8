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
            let optionValue = arr[i].code;
            let optionText = arr[i].name;
            $(id).append(`<option value="${optionValue}"> 
                                               ${optionText}
                                   </option>`);

        }
    }

    $('#province').on('change',function (e){
        //delete all selected of select
        $("#province option").attr("selected", false);
        let optionSelected = $("option:selected", this);
        optionSelected.attr("selected",true);
    }).on('change',function (e){
        let optionSelected = $("option:selected", this);
        let valueSelected = optionSelected.val();
        for(let i = 0;i<myArrProvince.length;i++){
            let optionValue = myArrProvince[i].code;
            //use "==" is exactly, dont change plz
            if(optionValue==valueSelected){
                myArrDistrict = myArrProvince[i].districts;
                break;
            }
        }
        let listdistrict = myArrDistrict;
        $('#district').empty();
        for (let j = 0; j < listdistrict.length; j++) {
            let optionValue = listdistrict[j].code;
            let optionText = listdistrict[j].name;
            $('#district').append(`<option value="${optionValue}">
                                           ${optionText}
                               </option>`);
        }
    });

    $('#district').on('change',function (e) {
        $("#district option").attr("selected", false);
        let optionSelected = $("option:selected", this);
        optionSelected.attr("selected",true);
    }).on('change',function (e){
        let optionSelected = $("option:selected", this);
        let valueSelected = optionSelected.val();
        for(let i = 0;i<myArrDistrict.length;i++){
            let optionValue = myArrDistrict[i].code;
            if(optionValue==valueSelected){
                myArrWard = myArrDistrict[i].wards;
                break;
            }
        }

        let listwards = myArrWard;
        $('#ward').empty();
        for (let j = 0; j < listwards.length; j++) {
            let optionValue = listwards[j].code;
            let optionText = listwards[j].name;
            $('#ward').append(`<option value="${optionValue}">
                                           ${optionText}
                               </option>`);
        }
    });
});