/**
 * @license Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
    // config.uiColor = '#AADC6E';
    //config CKEditor
    config.syntaxhighlight_lang = 'csharp';
    config.syntaxhighlight_hideControls = true;
    config.language = 'en';
    config.filebrowserBrowseUrl = '/Scripts/plugin/ckfinder/ckfinder.html';
    config.filebrowserImageBrowseUrl = '/Scripts/plugin/ckfinder.html?Type=Images';
    config.filebrowserFlashBrowseUrl = '/Scripts/plugin/ckfinder.html?Type=Flash';
    config.filebrowserUploadUrl = '/Scripts/plugin/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Files';
    config.filebrowserImageUploadUrl = '/Data/Img_content';
    config.filebrowserFlashUploadUrl = '/Scripts/plugin/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Flash';


    //Setup CKFinder
    CKFinder.setupCKEditor(null, "/Scripts/plugin/ckeditor/config.js");
};
