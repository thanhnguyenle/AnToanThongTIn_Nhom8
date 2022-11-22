function avatar( elementId,ava ) {
    CKFinder.popup( {
        chooseFiles: true,
        type: 'Avatar',
        width: 800,
        height: 600,
        onInit: function( finder ) {
            finder.on( 'files:choose', function( evt ) {
                var file = evt.data.files.first();
                var output = document.getElementById( elementId );
                var out = document.getElementById( ava );
                output.value = file.getUrl();
                out.src=file.getUrl();
            } );

            finder.on( 'file:choose:resizedImage', function( evt ) {
                var output = document.getElementById( elementId );
                output.value = evt.data.resizedUrl;
            } );
        }
    } );
}
function upload( type,url =null ,img=null) {
    CKFinder.popup( {
        chooseFiles: true,
        type: type,
        width: 800,
        height: 600,
        onInit: function( finder ) {
            finder.on( 'files:choose', function( evt ) {
                var file = evt.data.files.first();
                if(url!=null) {
                    var out = document.getElementById(url);
                    out.src = file.getUrl();
                }
                if(img!=null) {
                    var output = document.getElementById(img);
                    output.value = file.getUrl();
                }
            } );

            finder.on( 'file:choose:resizedImage', function( evt ) {
                var output = document.getElementById( img );
                output.value = evt.data.resizedUrl;
            } );
        }
    } );
}