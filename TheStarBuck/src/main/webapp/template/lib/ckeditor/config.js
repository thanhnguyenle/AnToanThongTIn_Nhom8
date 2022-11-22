/**
 * @license Copyright (c) 2003-2021, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	config.filebrowserBrowseUrl = 'http://localhost:8080/ckfinder/ckfinder.html';

	config.filebrowserImageBrowseUrl = 'http://localhost:8080/ckfinder/ckfinder.html?type=Images';

	config.filebrowserFlashBrowseUrl = 'http://localhost:8080/ckfinder/ckfinder.html?type=Flash';

	config.filebrowserUploadUrl = 'http://localhost:8080/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files';

	config.filebrowserImageUploadUrl = 'http://localhost:8080/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Images';

	config.filebrowserFlashUploadUrl = 'http://localhost:8080/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Flash';

};
