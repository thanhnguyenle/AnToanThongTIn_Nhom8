$(document).ready(function () {
    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {

        var href = $(e.target).attr('href');
        var $curr = $(".checkout-bar  a[href='" + href + "']").parent();

        $('.checkout-bar li').removeClass();

        $curr.addClass("active");
        $curr.prevAll().addClass("visited");
    });
});

//AJAX read file json -> generate list province, district, ward
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

